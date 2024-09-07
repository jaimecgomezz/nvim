local function append(table, element)
	table[#table + 1] = element

	return table
end

local function handle_args(args, target)
	args = args or {}

	if not target then
		return args
	end

	if target == "workspace" then
		args = append(args, vim.fn.getcwd())
	elseif target == "file" then
		args = append(args, vim.fn.expand("%:p"))
	elseif target == "line" then
		args = append(args, vim.fn.expand("%:p") .. ":" .. vim.fn.line("."))
	else
		args = append(args, target)
	end

	return args
end

local function spawn_rdbg(opts)
	local handle, pid

	-- Initialize a new pipe that will be used to communicate `rdbg` and
	-- `nvim-dap` through the former's `stdout` output
	local stdout = vim.uv.new_pipe()
	assert(stdout, "Couldn't obtain new pipe for `rdbg` spawn")

	-- Prepare the arguments that will be provided to spawn `rdbg`, along with
	-- stablishing the `stdout` pipe that will be used by the process
	opts = vim.tbl_extend("force", opts, {
		cwd = vim.fn.getcwd(),
		stdio = { nil, stdout },
		args = handle_args(opts.args, opts.target),
	})

	-- Spawn a `rdbg` process that will accept requests through the
	-- `config.port` provided. Finally, whenever said process finishes, close
	-- the process handle obtained through the callback provided
	handle, pid = vim.uv.spawn("rdbg", opts, function(_code, _signal)
		vim.uv.close(handle, function()
			vim.notify("Debugger closed", vim.log.levels.INFO)
		end)
	end)

	assert(handle, "Command `rdbg` ran from `" .. opts.cwd .. "` exited with code " .. pid)

	-- Listen to the `rdbg` stdout and append its output to our `nvim-dap`
	-- REPL's console
	vim.uv.read_start(stdout, function(err, chunk)
		assert(not err, err)

		if chunk then
			vim.schedule(function()
				require("dap.repl").append(chunk)
			end)
		end
	end)
end

local function gport(should_pick_port)
	local port

	if should_pick_port then
		vim.ui.input({ prompt = "Select port to connect to: " }, function(input)
			port = input
		end)
	else
		-- TODO: validate the port is available and regenerate if it isn't
		port = math.random(49152, 65535)
	end

	return port
end

local function adapter(callback, config)
	-- Handle config default values
	config.wait = config.wait or 500
	config.host = config.host or "127.0.0.1"
	config.port = config.port or gport(config.should_pick_port)

	-- Spawn a `rdbg` subprocess, the debuggee, and config the necessary
	-- environmental variables. Only executed if `config.args` are provided,
	-- otherwise we assume there's already a debuggee process we'll connect to
	if config.args then
		vim.env.RUBY_DEBUG_OPEN = true
		vim.env.RUBY_DEBUG_HOST = config.host
		vim.env.RUBY_DEBUG_PORT = config.port

		spawn_rdbg(config)
	end

	-- Connect `nvim-dap`, the debugger, to the `rdbg` subprocess after
	-- `config.wait` miliseconds have passed, to ensure it has already started
	vim.defer_fn(function()
		callback({
			type = "server",
			host = config.host,
			port = config.port,
		})
	end, config.wait)
end

-- Easily generate DAP configurations
local function gconf(conf)
	return vim.tbl_extend("force", {
		type = "ruby",
		localfs = true, -- Why the hell is this needed wtf
		request = "attach",
		should_pick_port = false,
	}, conf)
end

local configurations = {
	gconf({
		name = "run file",
		args = { "-c", "--", "ruby" },
		target = "file",
	}),
	gconf({
		name = "rspec line",
		args = { "-n", "-c", "--", "rspec" },
		target = "line",
	}),
	gconf({
		name = "rspec file",
		args = { "-n", "-c", "--", "rspec" },
		target = "file",
	}),
	gconf({
		name = "rspec project",
		args = { "-n", "-c", "--", "rspec" },
	}),
	gconf({
		name = "run file (bundle)",
		args = { "-c", "--", "bundle", "exec", "ruby" },
		target = "file",
	}),
	gconf({
		name = "rspec line (bundle)",
		args = { "-n", "-c", "--", "bundle", "exec", "rspec" },
		target = "line",
	}),
	gconf({
		name = "rspec file (bundle)",
		args = { "-n", "-c", "--", "bundle", "exec", "rspec" },
		target = "file",
	}),
	gconf({
		name = "rspec project (bundle)",
		args = { "-n", "-c", "--", "bundle", "exec", "rspec" },
	}),
	gconf({
		name = "rails server (bin)",
		args = { "-n", "-c", "--", "bin/rails", "server" },
	}),
	gconf({
		name = "rails server (bundle)",
		args = { "-n", "-c", "--", "bundle", "exec", "rails", "server" },
	}),
	gconf({
		name = "attach to debugger",
		should_pick_port = true,
		wait = 0,
	}),
}

local M = {}

M.setup = function(dap)
	dap.adapters.ruby = adapter
	dap.configurations.ruby = configurations
end

return M
