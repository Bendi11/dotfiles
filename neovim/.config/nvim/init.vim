let g:indentLine_fileTypeExclude = ['alpha', 'packer'] 
let g:neovide_remember_window_size = v:false
let g:neovide_fullscreen = v:false

"Disable tabline in dashboard
"autocmd FileType dashboard let g:indent_blankline_enable = v:false | autocmd WinLeave <buffer> let g:indent_blankline_enable = v:true
set clipboard+=unnamedplus "Use the system clipboard
set guifont=FiraCode\ Nerd\ Font\ Mono:h14
set mouse=a "Enable mouse controls
set number "Enable line numbering
"set autochdir

"Set 4 spaces instead of tabs
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

"For autocompletion
set completeopt=menu,menuone,noselect
"Use tree-sitter for folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
"set indentexpr=nvim_treesitter#indentexpr()

set termguicolors "Enable GUI coloring in the terminal
syntax on
set cursorline
"let g:onedark_style = 'darker' "Make the color scheme darker than normal
"LUA CONFIG

lua << EOF
require('plugins')
EOF

filetype plugin indent on "Enable automatic indenting based on file type

"autocmd InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs :lua require'rust-tools.inlay_hints'.set_inlay_hints()
autocmd BufWritePre * set fileformat=unix
"Control + n to open / close the file tree
nnoremap <silent> <C-n> :NvimTreeToggle<CR>
nnoremap <silent> xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <silent> ca <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <C-e> :lua vim.diagnostic.open_float(0, { scope = "line", border = "single" })<CR>
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
nnoremap <silent> <C-Space> @=(foldlevel('.')?'zA':"\<C-Space>")<CR>
vnoremap <Space> zf
