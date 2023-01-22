vim.opt.clipboard:append{'unnamedplus'}

vim.opt.completeopt = {'menu,menuone,noselect'}

vim.g.mapleader = ","
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.wrap = false
vim.opt.signcolumn = "yes"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.g.syntax = true
vim.opt.termguicolors = true

require("packer").startup(function(use)
        use 'wbthomason/packer.nvim'
        use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
        use {
          'nvim-telescope/telescope.nvim', tag = '0.1.0',
            -- or                            , branch = '0.1.x',
            requires = { {'nvim-lua/plenary.nvim'} }

        }
        use {
            "nvim-neorg/neorg",
            config = function()
            require('neorg').setup {

                }
            end,
            requires = "nvim-lua/plenary.nvim"
        }
        use "williamboman/nvim-lsp-installer"

        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/nvim-cmp'
        use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
        use 'habamax/vim-godot'
        use 'folke/zen-mode.nvim'
        use { "ellisonleao/gruvbox.nvim" }
        use { "catppuccin/nvim", as = "catppuccin" }
end)

-- Colorscheme
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha

require("catppuccin").setup()

vim.cmd [[colorscheme catppuccin]]

-- Mappings.
--

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }

vim.keymap.set('n', '<C-p>', '<cmd>Telescope find_files<cr>', opts)
vim.keymap.set('n', '<C-e>', '<cmd>Telescope oldfiles<cr>', opts)
vim.keymap.set('n','<leader>r', '<cmd> telescope.builtin.lsp_references<cr>', opts)
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', opts)
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', opts)
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', opts)

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<leader>gf', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

require'lspconfig'.gdscript.setup{
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    cmd = {"nc", "localhost", "6008"}
}

on_attach = on_attach

require('nvim-treesitter.configs').setup {
    ensure_installed = { "norg", --[[ other parsers you would wish to have ]] },
    highlight = { -- Be sure to enable highlights if you haven't!
        enable = true,
    }
}

local cmp = require'cmp'

cmp.setup({
    performance = {
        debounce = 150,
    },

    mapping = {
        ['<C-Space>'] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
    }
})

