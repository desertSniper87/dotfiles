call plug#begin()
" Plug 'junegunn/vim-easy-align'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'rafamadriz/friendly-snippets'

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'


"nvim-cmp

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'ojroques/nvim-hardline'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'preservim/nerdcommenter'
Plug 'windwp/nvim-ts-autotag'

Plug 'svermeulen/vim-easyclip'
Plug 'flazz/vim-colorschemes'

Plug 'lervag/vimtex'
Plug 'lewis6991/gitsigns.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'jremmen/vim-ripgrep'
Plug 'raghur/vim-ghost', {'do': ':GhostInstall'}
Plug 'phaazon/hop.nvim'

" Markdown 
 Plug 'godlygeek/tabular'
 Plug 'preservim/vim-markdown'
" Plug 'vim-pandoc/vim-pandoc-syntax'

Plug 'folke/which-key.nvim'

call plug#end()

" Nerd Tree
map <F2> :NERDTreeToggle<CR>
map <F4> :NERDTreeFind<CR>


"nvim-cmp
set completeopt=menu,menuone,noselect

"nvim-vsnip

" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Conflict with Easyclip
" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
"nmap        s   <Plug>(vsnip-select-text)
"xmap        s   <Plug>(vsnip-select-text)
"nmap        S   <Plug>(vsnip-cut-text)
"xmap        S   <Plug>(vsnip-cut-text)

let g:vsnip_snippet_dir = '~/.vsnip'

"Vim-easyclip 
"TODO: Split into three plugins bt ~vermulen

let g:EasyClipUsePasteToggleDefaults = 0
let g:EasyClipUseSubstituteDefaults = 1

nnoremap gm m

"vimtex
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" vim-surround
let g:surround_{char2nr("\<CR>")} = "\n\r\n"

nnoremap <c-p><c-o> <cmd>Telescope oldfiles<cr>
nnoremap <c-p><c-f> <cmd>Telescope find_files<cr>
nnoremap <c-p><c-p> <cmd>Telescope live_grep<cr>
nnoremap <c-p><c-i> <cmd>Telescope buffers<cr>
nnoremap <c-p><c-l> <cmd>Telescope help_tags<cr>
nnoremap <c-p><c-g> <cmd>Telescope git_files<cr>
nnoremap <c-p><c-q> <cmd>Telescope quickfix<cr>
nnoremap <c-p><c-r> <cmd>Telescope registers<cr>

" Markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1 
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1  

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'


  -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)


  cmp.setup({
    -- completion = {
    --   completeopt = 'menu,menuone,noselect',
    --   autocomplete = true
    -- },

    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item()),
      ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item()),
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<Tab>'] = cmp.mapping.confirm({ select = false }),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'path', option = {} },
      { name = 'vsnip' },
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local lspconfig = require('lspconfig')
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

  -- Enable some language servers with the additional completion capabilities offered by nvim-cmp
  local servers = { 'pyright', 'tsserver', 'svelte', 'bashls', 'sqls' }
  for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
          on_attach = on_attach,
          capabilities = capabilities,
          }
      end

  local configPath = vim.fn.stdpath("config")
  local languageServerPath = configPath.."/languageserver"
  local angular_cmd = {"node", languageServerPath.."/node_modules/@angular/language-server/index.js", "--stdio", "--tsProbeLocations", languageServerPath, "--ngProbeLocations", languageServerPath}

  require'lspconfig'.angularls.setup{
     on_attach = on_attach_common,
     cmd = angular_cmd,
     on_new_config = function(new_config,new_root_dir)
     new_config.cmd = angular_cmd
     end,
  }


if vim.fn.has("mac") == 1 then
  require'lspconfig'.sourcekit.setup{
    init_options = {
    }
  }
else
  require'lspconfig'.ccls.setup{
    init_options = {
      cache = {
        directory = ".ccls-cache";
      };
    }
  }
end
  
-- nvim-hardline
require('hardline').setup {}

-- nvim-treesitter

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "javascript", "python", "typescript", "tsx", "html" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,



  highlight = {
    enable = true,
    disable =  { "vim", "latex", "kotlin", "markdown" },
    additional_vim_regex_highlighting = false,
  }
}

require('nvim-ts-autotag').setup()
require('gitsigns').setup {
 on_attach = function(bufnr)
   local function map(mode, lhs, rhs, opts)
       opts = vim.tbl_extend('force', {noremap = true, silent = true}, opts or {})
       vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
   end

   -- Navigation
   map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
   map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})
   map('n', '<leader>hp', gs.preview_hunk)
   map('n', '<leader>hd', gs.diffthis)

   -- Text object
   map('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
   map('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')

   map('n', '<leader>hr', ':Gitsigns reset_hunk<CR>')
   map('v', '<leader>hr', ':Gitsigns reset_hunk<CR>')
 end
}

require('telescope').setup{
  defaults = {
    mappings = {
    }
  },
  pickers = {
  },
  extensions = {
  }
}
-- hop.nvim

require('hop').setup()

vim.api.nvim_set_keymap('', '<leader>w', "<cmd>lua require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR,  current_line_only = false })<cr>", {})
vim.api.nvim_set_keymap('', '<leader>b', "<cmd>lua require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR,  current_line_only = false })<cr>", {})
vim.api.nvim_set_keymap('', '<leader>e', "<cmd>lua require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR,  current_line_only = false, hint_position = require'hop.hint'.HintPosition.END})<cr>", {})
vim.api.nvim_set_keymap('', '<leader>E', "<cmd>lua require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR,  current_line_only = false, hint_position = require'hop.hint'.HintPosition.END})<cr>", {})
vim.api.nvim_set_keymap('', '<space>p', "<cmd>lua require'hop'.hint_patterns({ current_line_only = false })<cr>", {})
vim.api.nvim_set_keymap('', '<leader>f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<cr>", {})
vim.api.nvim_set_keymap('', '<leader>F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<cr>", {})
vim.api.nvim_set_keymap('', '<leader>t', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false, hint_offset = -1 })<cr>", {})
vim.api.nvim_set_keymap('', '<leader>T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false, hint_offset = 1 })<cr>", {})


-- which-key

require("which-key").setup {}
EOF
