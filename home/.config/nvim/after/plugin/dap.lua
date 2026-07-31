local dap = require("dap")
dap.adapters.gdb = {
	type = "executable",
	command = "gdb",
	args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
}

dap.adapters.coreclr = {
	type = "executable",
	command = "netcoredbg",
	args = { "--interpreter=vscode" },
}

if vim.fn.has("win32") ~= 1 then
	local handle = vim.system({ "lsof", "-ti", ":8001" }, { text = true }):wait()
	local pid_int = tonumber(vim.trim(handle.stdout)) or -1
	dap.configurations.cs = {
		{
			type = "coreclr",
			request = "attach",
			name = "Attach to .NET (port)",
			processId = pid_int,
			justMyCode = true,
		},
	}
end
