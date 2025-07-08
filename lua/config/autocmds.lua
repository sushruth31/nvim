-- Check if running in WSL
if vim.fn.system('uname -r'):match('Microsoft') then
    -- Create autocmd group
    local yank_group = vim.api.nvim_create_augroup('Yank', { clear = true })

    -- Create autocmd for TextYankPost
    vim.api.nvim_create_autocmd('TextYankPost', {
        group = yank_group,
        callback = function()
            vim.fn.system('/mnt/c/windows/system32/clip.exe', vim.fn.getreg('"'))
        end,
    })
end
