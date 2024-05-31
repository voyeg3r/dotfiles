-- Filename: markdown.lua
-- Last Change: Wed, 13 Jul 2022 20:23

-- TODO: https://bitbucket.org/sergio/workspace/snippets/6EEM7k
-- add fucntion to jump to the next heading
-- https://secluded.site/vim-as-a-markdown-editor/

local function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end
-- now I can use: vim.cmd(t('normal <C-e>'))
-- source: https://stackoverflow.com/a/69142336/2571881

vim.opt_local.number = false
vim.opt_local.relativenumber = false
vim.g['loaded_spellfile_plugin'] = 0
vim.opt_local.spell = true
vim.bo.spelllang = 'en_us'
vim.bo.textwidth = 80
vim.opt_local.wrap = true
vim.opt_local.suffixesadd:prepend('.md')

--vim.keymap.set('i', '<C-s>', '<C-g>u<Esc>[s1z=`]a<C-g>u', { buffer = true, desc = 'Fix Last Miss-Spelling' })
vim.keymap.set('i', '<C-s>', '<C-g>u<Esc>[s1z=`]a<C-g>u', { buffer = true, desc = 'Fix Last Miss-Spelling' })

local status_ok, mkdnflow = pcall(require, 'mkdnflow')
if status_ok then
    vim.keymap.set('n', ']]', ':MkdnNextHeading<CR>',{ buffer = true, desc = 'Jump to the next Heading' })
    vim.keymap.set('n', '[[', ':MkdnPrevtHeading<CR>',{ buffer = true, desc = 'Jump to the previous Heading' })
    vim.keymap.set({ 'n', 'v'}, '<CR>', ":MkdnFollowLink<CR>" ,{ buffer = true, desc = 'Follow markdown link' })
    vim.keymap.set('n', '<C-Space>', ':MkdnToggleToDo<CR>' ,{ buffer = true, desc = 'Toggle todo "check"' })
    vim.keymap.set( 'n', '+', ":MkdnIncreaseHeading<CR>", { buffer = true, desc = 'Increase markdown heading' })
    vim.keymap.set( 'n', '-', ":MkdnDecreaseHeading<CR>", { buffer = true, desc = 'Decrease markdown heading' })
else
    vim.keymap.set('n', ']]', function()
        vim.fn.search("^##")
        vim.cmd('normal zz')
        require('core.utils').flash_cursorline()
    end,
    { buffer = true, desc = 'Jump to the next Heading' })

    vim.keymap.set('n', '[[', function()
        vim.fn.search("^#", "b")
        vim.cmd('normal zz')
        require('core.utils').flash_cursorline()
     end,
     { buffer = true, desc = 'Jump to the previous Heading' })
end

-- reference: https://superuser.com/a/277326/45032
-- vim.keymap.set('n', '<cr>', ':e <cfile><CR>', { buffer = true, silent = true, desc = "markdown.lua: creates a file under the cursor" })
-- vim.keymap.set('n', 'ge', ':e <cfile><CR>', { buffer = true, silent = true, desc = "markdown.lua: creates a file under the cursor" })

-- -- :ec expand("<cfile>") . &suffixesadd
-- https://vi.stackexchange.com/a/9636/7339
-- http://lua-users.org/wiki/StringLibraryTutorial
-- add extension: local file_name = string.gsub('name', '$', '.md')
-- string.gsub('texto', '(.*)', '[%1](%1.md)')
-- [file](file.md)
-- vim.keymap.set('n', '<cr>', function()
--         status_ok, _ = pcall(vim.cmd, "normal gf")
--         if not status_ok then
--             vim.cmd[[
--             let dest = expand("<cfile>")
--             let flink = '[' . dest . '](' . dest . '.md)'
--             execute "normal ciw".flink
--             execute 'normal :e ' . dest . '.md' . "\r"
--             ]]
--         end
--     end,
--     { buffer = true, desc = "markdown.lua: open file under the cursor" }
-- )

-- https://gitlab.com/neonunux/vim-open-or-create-path-and-file
-- https://www.reddit.com/r/vim/comments/fy10se
vim.keymap.set('n', '<cr>', function()
        local status_ok, _ = pcall(vim.cmd, "normal gf")
        if not status_ok then
            local dest = vim.fn.expand('<cword>')
            if string.match(dest, "%a") then
                local flink = '['..dest..']('..dest..'.md)'
                local current_word = vim.fn.expand("<cWORD>")
                if string.match(current_word,'[[]') then
                    -- print("We already have a link here!")
                else
                    -- print("Creating a link for: ", current_word)
                    vim.fn.feedkeys('ciw'..flink,'x')
                end
                vim.cmd('edit '..dest..'.md')
            end
        end
    end,
    { buffer = true, desc = "markdown.lua: open file under the cursor" }
)

-- vim.keymap.set("n", "<leader>s", function() vim_opt_toggle("spell", true, false, "Spelling") end)

vim.keymap.set({"n", "i"}, "<Leader>s", function()
  vim.opt_local.spell = not(vim.opt_local.spell:get())
  print("spell: " .. tostring(vim.o.spell))
end, { buffer = true , desc = "toggle spell"})
