-- austino/config/nvim-dap

local dap = require('dap')
local dapui = require('dapui')

dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/bin/lldb-vscode',
    name = 'lldb'
}

dap.configurations.zig = {
  {
    name = 'Launch (Default)',
    type = 'lldb',
    request = 'launch',
    program = '${workspaceFolder}/zig-out/bin/${workspaceFolderBasename}',
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
    runInTerminal = false,
  },
}

dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open {} end
dap.listeners.before.event_terminated['dapui_config'] = function() dapui.close {} end
dap.listeners.before.event_exited['dapui_config'] = function() dapui.close {} end


-- load local dap configurations if launch.json exists

-- local getcwd = vim.loop.cwd
-- local launchjs_filename = getcwd()..'/launch.json'
-- print("checking for 'launch.json' in ..."..launchjs_filename)
-- local launchjs_file = io.open(launchjs_filename)
-- if launchjs_file then
--     print("we have a 'launch.json'!")
--     launchjs_file:close()
--     require 'dap.ext.vscode'.load_launchjs(nil, { lldb = {'zig'}})
-- end

require 'dap.ext.vscode'.load_launchjs(nil, { lldb = {'zig'}})

-- if vim.fn.filereadable('launch.json') then
--     print("we have a 'launch.json'!")
--     require 'dap.ext.vscode'.load_launchjs(nil, { lldb = {'zig'}})
-- end
