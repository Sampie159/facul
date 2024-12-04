-- Main plugins

require('core.plugin_config.harpoon_config')
require('core.plugin_config.cmp_config')
require('core.plugin_config.telescope_config')
require('core.plugin_config.treesitter_config')
require('core.plugin_config.lsp_config')
require('core.plugin_config.luasnip_config')

local hour = tonumber(os.date("%H"))

vim.g.agua_bold = 0
vim.g.zenbones_darkness = "stark"

if vim.g.neovide then
    vim.o.guifont = "CaskaydiaMono Nerd Font:h12"
    if hour > 17 or hour < 9 then
        vim.o.background = "dark"
        vim.cmd.colorscheme("modus_vivendi")
    else
        vim.o.background = "light"
        vim.cmd.colorscheme("modus_operandi")
    end
end

-- I got tired of creating separate files for each plugin configuration, so I'll
-- just put them all here. I'll try to keep it organized, though.

require('mini.surround').setup()

-- Git stuff
-- Neogit
require('neogit').setup {}
vim.keymap.set("n", "<leader>gn", "<cmd>Neogit<CR>")

-- Lazygit
vim.keymap.set("n", "<leader>gl", "<CMD>LazyGit<CR>")

-- Orgmode
local orgmode = require('orgmode')
-- orgmode.setup_ts_grammar()
orgmode.setup({
    org_agenda_files = { '~/org/**/*' },
    org_default_notes_file = '~/org/notes.org',
    mappings = {
        org = {
            org_toggle_checkbox = '<C-b>',
        },
    },
})

-- nvim-spectre
vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
    desc = "Toggle Spectre"
})
vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = "Search current word"
})
vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    desc = "Search current word"
})
vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = "Search on current file"
})

vim.g.haskell_tools = {
    hls = {
        settings = {
            haskell = {
                formattingProvider = "stylish-haskell"
            }
        }
    }
}

require'nvim-web-devicons'.get_icons()

require('todo-comments').setup {
    highlight = {
        pattern = [[(KEYWORDS)\s*(\([^\)]*\))?:]],
    },
}

-- Gruvbox config
vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_foreground = 'mix'

-- Catppuccin config
require("catppuccin").setup {
  color_overrides = {
    mocha = {
      base = "#000000"
    }
  }
}
