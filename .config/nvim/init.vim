call plug#begin('~/.local/share/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Markdown
Plug 'jtratner/vim-flavored-markdown'
Plug 'tpope/vim-markdown'

" remove trailing whitespace
Plug 'bronson/vim-trailing-whitespace'

" comment lines out (gc in visual mode)
Plug 'tomtom/tcomment_vim'

" Pimped out bar at the bottom of current buffer
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Golang
Plug 'fatih/vim-go'
Plug 'mdempsky/gocode'

" Bazel
Plug 'bazelbuild/vim-bazel'
Plug 'bazelbuild/vim-ft-bzl'

" Rust
Plug 'racer-rust/vim-racer'
Plug 'roxma/nvim-cm-racer'
Plug 'rust-lang/rust.vim'

" Terraform
Plug 'b4b4r07/vim-hcl'
Plug 'hashivim/vim-terraform'

" Jsonnet filetype plugin
Plug 'google/vim-jsonnet'

" toml
Plug 'cespare/vim-toml'

" Plug 'ervandew/supertab'
Plug 'google/vim-maktaba'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'kshenoy/vim-signature'
Plug 'Matt-Deacalion/vim-systemd-syntax'
Plug 'NLKNguyen/papercolor-theme'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
" Plug 'vim-syntastic/syntastic'
Plug 'w0rp/ale'

" Powershell
Plug 'PProvost/vim-ps1'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

" PowerShell
Plug 'PProvost/vim-ps1'

" Webdev
Plug 'burner/vim-svelte'

" Themes
" Plug 'mhartington/oceanic-next'
Plug 'arcticicestudio/nord-vim'

call plug#end()

" GUI
set mouse=a
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set softtabstop=2

"" COC completion

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>


function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd CursorHold * silent call CocActionAsync('doHover')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
" vmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Keybindings
let mapleader=","
map <silent> <space> :Buffers<cr>
map <silent> <leader>` :Buffers<cr>
map <silent> <leader>; :Commits<cr>
map <silent> <leader>e :GitFiles<cr>
map <silent> <leader>d :Files<cr>
map <silent> <leader>f :History<cr>
map <silent> <leader>/ :Ag<cr>
map <silent> <leader>m :Marks<cr>
"" Buffer navigation
map <silent> ` :b#<CR>

"" Terminal
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
let &t_8f = "<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "<Esc>[48;2;%lu;%lu;%lum"
set number

colorscheme nord
