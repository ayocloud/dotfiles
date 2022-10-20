local fn = vim.fn

local _M = {}

local function packer_install(install_path)
    local packer_install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if install_path then
        packer_install_path = install_path
    end

    if fn.empty(fn.glob(packer_install_path)) > 0 then
        return fn.system({
            'git',
            'clone',
            '--depth',
            '1',
            'https://github.com/wbthomason/packer.nvim',
            packer_install_path,
        })
    else
        print('packer install path is not empty')
        return false
    end
end

function _M.get_packer(install_path)
    local status_ok, packer
    status_ok, packer = pcall(require, 'packer')

    if not status_ok then
        print('please install packer.nvim first')

        if packer_install(install_path) then
            print('packer install ok')
            status_ok, packer = pcall(require, 'packer')
            if not status_ok then
                print('packer require failed')
                return false
            else
                print('packer require success')
                return true, packer
            end
        else
            print('packer install failed')
            return false
        end
    end

    return true, packer
end

return _M
