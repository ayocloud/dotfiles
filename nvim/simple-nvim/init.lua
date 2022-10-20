vim.defer_fn(function()
    pcall(require, 'impatient')
end, 0)

local fn = vim.fn
local tools = require('core.tools')
local list = require('plugins.list')

local status, packer = tools.get_packer()
if not status then
    return
else
    packer.startup(list)
end

require('core.keymaps')
require('plugins.config')
