local dap = require("dap")
dap.adapters.gdb = {
	type = "executable",
	command = "gdb",
	args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
}

dap.adapters.coreclr = {
	type = "executable",
	command = "/home/user/tools/netcoredbg/netcoredbg",
	args = { "--interpreter=vscode" },
}
