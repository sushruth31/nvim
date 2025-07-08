vim.opt.guicursor = ""
vim.opt.clipboard = "unnamedplus"

if vim.fn.has('wsl') == 1 then
    local clip_exe = '/mnt/c/Windows/System32/clip.exe'
    local powershell_exe = '/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe'

    if vim.fn.executable(clip_exe) == 1 then
        vim.g.clipboard = {
            name = 'WslClipboard',
            copy = {
                ['+'] = clip_exe,
                ['*'] = clip_exe,
            },
            paste = {
                ['+'] = powershell_exe .. ' -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
                ['*'] = powershell_exe .. ' -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            },
            cache_enabled = 0,
        }
    end
end


vim.opt.cursorline = false

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
