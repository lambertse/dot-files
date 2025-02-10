local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save with root permission
vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- Terminal
keymap.set("n", "<C-`>", ":horizontal term<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Clipboard operations
-- Copy to system clipboard
keymap.set("v", "<C-c>", '"+y')  -- Copy selected text
keymap.set("n", "<C-c>", '"+yy') -- Copy current line

-- Paste from system clipboard
keymap.set("n", "<C-v>", '"+p')  -- Paste in normal mode
keymap.set("v", "<C-v>", '"+p')  -- Paste in visual mode
keymap.set("i", "<C-v>", '<C-r>+') -- Paste in insert mode

-- Cut to system clipboard
keymap.set("v", "<C-x>", '"+d')  -- Cut selected text
keymap.set("n", "<C-x>", '"+dd') -- Cut current line

-- Undo/Redo
keymap.set("i", "<C-z>", "<C-o>u", opts)  -- Insert mode: Use <C-o> to temporarily switch to normal mode and undo
keymap.set("v", "<C-z>", "<Esc>u", opts)  -- Visual mode: Exit visual mode and undo
keymap.set("n", "<C-z>", "u", opts)       -- Normal mode: Just undo

-- Telescope mappings
local builtin = require('telescope.builtin')
keymap.set("n", "<space>fh", builtin.help_tags, {})
keymap.set("n", "<C-t>", builtin.find_files, {})
keymap.set("n", "<space>fd", builtin.live_grep, {})
keymap.set("n", "<space>en", function()
    builtin.find_files({
        cwd = vim.fn.stdpath("config")
    })
end)
keymap.set("n", "<C-f>", builtin.current_buffer_fuzzy_find, {})
