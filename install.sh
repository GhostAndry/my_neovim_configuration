#!/bin/bash

set -e

echo "📦 Installazione Neovim VSCode AMOLED..."

NVIM_DIR="$HOME/.config/nvim"
CONFIG_DIR="$NVIM_DIR/lua/config"

mkdir -p "$CONFIG_DIR"

# === init.lua ===
cat > "$NVIM_DIR/init.lua" << 'EOF'
require("config.lazy")
require("config.keymaps")
EOF

# === config/lazy.lua ===
cat > "$CONFIG_DIR/lazy.lua" << 'EOF'
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },
    { "catppuccin/nvim", name = "catppuccin" },
    "nvim-lualine/lualine.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    "akinsho/toggleterm.nvim"
})

vim.cmd.colorscheme "catppuccin-mocha"

require("nvim-tree").setup()
require("toggleterm").setup()
require("lualine").setup()

require("nvim-treesitter.configs").setup({
    ensure_installed = { "lua", "python", "javascript", "html", "css" },
    highlight = { enable = true }
})

local lspconfig = require("lspconfig")
local cmp = require("cmp")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
    }),
    sources = { { name = "nvim_lsp" } }
})

lspconfig.lua_ls.setup({ capabilities = capabilities })
lspconfig.tsserver.setup({ capabilities = capabilities })
lspconfig.pyright.setup({ capabilities = capabilities })

vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
EOF

# === config/keymaps.lua ===
cat > "$CONFIG_DIR/keymaps.lua" << 'EOF'
local toggle_nvimtree_state = false

vim.keymap.set("n", "<C-S-e>", function()
    local api = require("nvim-tree.api")
    local view = require("nvim-tree.view")

    if toggle_nvimtree_state then
        api.tree.close()
        toggle_nvimtree_state = false
    else
        api.tree.open()
        api.tree.find_file()
        toggle_nvimtree_state = true
    end
end, { noremap = true, silent = true })
EOF

echo ""
echo "✅ Installazione completata!"
echo "👉 Avvia Neovim con 'nvim' e Lazy.nvim installerà tutto"
