let g:indentLine_fileTypeExclude = ['alpha', 'packer'] 
let g:neovide_remember_window_size = v:true
let g:neovide_fullscreen = v:false

let g:neovide_floating_blur_amount_x = 2.0
let g:neovide_floating_blur_amount_y = 2.0

function! IsMachine(hostname)
    return match(hostname(), a:hostname) >= 0
endfunction

set clipboard+=unnamedplus "Use the system clipboard

if IsMachine('rocinante')
    set guifont=FiraCode\ Nerd\ Font\ Mono:h10
elseif IsMachine('andromeda')
    set guifont=FiraCode\ Nerd\ Font\ Mono:h8
else
    set guifont=FiraCode\ Nerd\ Font\ Mono:h14
endif

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

syntax on
"let g:onedark_style = 'darker' "Make the color scheme darker than normal
"LUA CONFIG

lua require('setup')

au BufRead,BufNewFile *.ks set filetype=kerboscript
filetype plugin indent on "Enable automatic indenting based on file type

"autocmd InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs :lua require'rust-tools.inlay_hints'.set_inlay_hints()
autocmd BufWritePre * set fileformat=unix
"Control + n to open / close the file tree
nnoremap <silent> <C-n> :NvimTreeToggle<CR>
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
nnoremap <silent> <C-Space> @=(foldlevel('.')?'zA':"\<C-Space>")<CR>
vnoremap <Space> zf
