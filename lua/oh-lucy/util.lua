local M = {}

local function highlight(group, properties)
        if properties.link ~= nil then
                local cmd = table.concat({ 'hi default link', group, properties.link }, ' ')
                vim.api.nvim_command(cmd)
                return
        end

        local bg = properties.bg == nil and '' or 'guibg=' .. properties.bg
        local fg = properties.fg == nil and '' or 'guifg=' .. properties.fg
        local style = properties.style == nil and '' or 'gui=' .. properties.style
        local cmd = table.concat({ 'highlight', group, bg, fg, style }, ' ')
        vim.api.nvim_command(cmd)
end

function M.load(theme)
        if vim.g.colors_name then
                vim.cmd 'hi clear'
        end
        vim.o.termguicolors = true
        for _, v in pairs(theme) do
                for group, properties in pairs(v) do
                        highlight(group, properties)
                end
        end
end

return M

