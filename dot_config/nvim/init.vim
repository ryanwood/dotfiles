let g:ale_disable_lsp = 1

" VimPlug Initialization {{{
call plug#begin()

" Appearance
" Plug 'morhetz/gruvbox'
" Plug 'joshdick/onedark.vim'
" Plug 'sonph/onehalf', { 'rtp': 'vim' }
" Plug 'wojciechkepka/vim-github-dark'
" Plug 'adrian5/oceanic-next-vim'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }

" Project
Plug 'christoomey/vim-tmux-navigator'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'tpope/vim-obsession'
Plug 'justinmk/vim-dirvish'
Plug 'kristijanhusak/vim-dirvish-git'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'itchyny/lightline.vim'
Plug 'roman/golden-ratio'

" Git
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'

" Language/Syntax
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-liquid'
Plug 'iamcco/coc-tailwindcss',  {'do': 'yarn install --frozen-lockfile && yarn run build'}

" Testing
Plug 'janko-m/vim-test'              " run test from vim
Plug 'tpope/vim-dispatch'
Plug 'neomake/neomake'               " runs make asynchronously in background
Plug 'olalonde/jest-quickfix-reporter'

" Snippets
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'

" Tools
Plug 'tpope/vim-bundler'
Plug 'jgdavey/tslime.vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-eunuch'             " Rename and other Unix helpers
Plug 'jc00ke/vim-tomdoc'            " Tomdoc snippets
Plug 'jrudess/vim-foldtext'         " Better fold text
Plug 'tpope/vim-jdaddy'
Plug 'dense-analysis/ale'
Plug 'pbrisbin/vim-mkdir'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'unblevable/quick-scope'
Plug 'justinmk/vim-sneak'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'jeetsukumaran/vim-indentwise'

" Search
Plug 'junegunn/fzf', { 'do' : { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'skwp/greplace.vim'

" Text Objects
Plug 'kana/vim-textobj-user'        " Required for nelstrom/vim-textobj-rubyblock
Plug 'michaeljsmith/vim-indent-object'
" Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'rhysd/vim-textobj-ruby'
Plug 'glts/vim-textobj-comment'
Plug 'terryma/vim-expand-region'

" " Improvements
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/matchit.zip'
" Plug 'alvan/vim-closetag'
" Plug 'Yggdroot/indentLine'

Plug 'AndrewRadev/deleft.vim'
Plug 'AndrewRadev/dsf.vim'
" Plug 'AndrewRadev/multichange.vim'
Plug 'AndrewRadev/sideways.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'sickill/vim-pasta'
" Plug 'AndrewRadev/whitespaste.vim' " works with vim-pasta
Plug 'AndrewRadev/undoquit.vim'

Plug 'jiangmiao/auto-pairs'
Plug 'mbbill/undotree'
Plug 'tmux-plugins/vim-tmux-focus-events'

" Writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

" Plug 'briandoll/change-inside-surroundings.vim'
" Plug 'kristijanhusak/vim-multiple-cursors'
" Plug 'Keithbsmiley/investigate.vim'
" Plug 'bogado/file-line'
" Plug 'vim-scripts/lastpos.vim'
" Plug 'editorconfig/editorconfig-vim'
" Plug 'mbbill/undotree'
" Plug 'majutsushi/tagbar'
" Plug 'Valloric/MatchTagAlways'
" Plug 'EinfachToll/DidYouMean'
" Plug 'chrisbra/csv.vim'
" Plug 'ludovicchabant/vim-gutentags'

" ======================================================== }}}
" Setting {{{

set clipboard=unnamed
" set cmdheight=2                   " [coc] Give more space for displaying messages.
set expandtab
set foldmethod=syntax             " fold based on syntax
set foldnestmax=10                " deepest fold is 3 levels
set gdefault                      " Default to /g at the end of regexes
set hidden                        " buffers can exist in the background without being in a window.
set lazyredraw                    " Attempt to speed things up
set ignorecase                    " Ignore case when searching...
set iskeyword+=-                  " Make dashed word, like CSS class act as a word (user-name)
set linebreak                     " Wrap lines at convenient points
set modelines=1
set mouse=a                       " Set mouse to scroll vim window - not terminal history"
set nofoldenable                  " dont fold by default
set noswapfile                    " Turn Off Swap Files
set nobackup
set nowb
set nowrap                        " Don't wrap lines
set nowritebackup                 " [coc]
set number                        " Line numbers are good
set numberwidth=2                 " Use relative number except for the current line
set re=0                          " Changed back to 0 for tsx files to work. Previously 1 for Faster Ruby (use the older regex engine) - faster for Ruby files - https://stackoverflow.com/questions/16902317/vim-slow-with-ruby-syntax-highlighting
set scrolloff=3                   " Start scrolling when we're X lines away from margins
set shiftwidth=2
set sidescroll=1                  " https://ddrscott.github.io/blog/2016/sidescroll/
set sidescrolloff=100             " Don't shift the beginning of line off screen left when moving into panes if cursor is at EOL
" [coc] Always show the signcolumn, otherwise it would shift the text each time diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
set showcmd                       " Show incomplete cmds down the bottom
set smartindent
set softtabstop=2
set shortmess+=c                  " [coc] Don't pass messages to |ins-completion-menu|.
set showmatch
set noshowmode                    " Lightline shows the mode - don't need to duplicated it
set splitbelow
set splitright
set smartcase                     " ...unless we type a capital
set tabstop=2
set timeoutlen=1000 ttimeoutlen=0 " Fix <shift-O> after <esc> delay https://www.johnhawthorn.com/2012/09/vi-escape-delays/
set undofile                      " Set persistent undo file (location set by neovim)
set updatetime=300                " [coc] Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
set wildmode=list:longest,list:full
set wildmenu                      " enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~       " stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=vendor/ruby/**    " For local path gem installation
set wildignore+=node_modules/**
set wildignore+=bower_components/**

" ======================================================== }}}
" Appearence {{{

if (has("termguicolors"))
  set termguicolors
endif

" colorscheme onedark
" colorscheme onehalfdark
" colorscheme ghdark

" colorscheme oceanicnext
" let g:oceanic_for_polyglot = 1

colorscheme material

set guifont=Hack:h14

" To enable mode shapes, "Cursor" highlight, and blinking:
" https://neovim.io/doc/user/options.html#'guicursor'
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
		  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
		  \,sm:block-blinkwait175-blinkoff150-blinkon175
highlight Cursor gui=reverse guifg=NONE guibg=NONE
highlight Cursor gui=NONE guifg=bg guibg=fg

" Show a vertical line/guard at column 80
" let &colorcolumn=join(range(81,999),",")
" highlight ColorColumn ctermbg=236  guibg=#2C323C
" let &colorcolumn="80,".join(range(100,999),",")


" ======================================================== }}}
" Leader Mappings {{{

let mapleader=" "

" Adjust viewports to the same size
nnoremap <Leader>= <C-w>=
nnoremap <leader>] gt
nnoremap <leader>[ gT
" Close all except current tab
nnoremap <leader>\ :tabonly<Enter>
" nmap <leader>' cs"'

" Resize splits by %
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" Quick replace
nmap <leader>; :%s//

" Navigating tabs
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt

" fzf
nnoremap <leader>bb :Buffers<cr>
" Delete buffer but keep window. http://stackoverflow.com/questions/4298910/vim-close-buffer-but-not-split-window
nmap <leader>bd :bp<bar>bd#<CR>
" buffergator: View the entire list of buffers open
nmap <leader>bl :BuffergatorOpen<cr>
" Close all buffers but the current one
nmap <leader>bo :%bd<cr>:e#<cr>

" Copy the current file's path
nmap <leader>cf :let @+=expand("%")<cr>

"Clone a Ruby/RSpec Method
nmap <leader>cm yar%o<esc>p

" Clone a paragraph
nnoremap <leader>cp yap<S-}>p

" map <Leader>d "_d<CR>
" map <Leader>D "_dd<CR>

" Some helpers to edit mode http://vimcasts.org/e/14
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
nmap <leader>ew :e %%
nmap <leader>es :sp %%
nmap <leader>ev :vsp %%
nmap <leader>et :tabe %%

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" format (align) the entire file
nnoremap <leader>fef :normal! gg=G``<CR>
" Full Zoom the current pane in a new tab. :wq to go back to the pane.
nnoremap <leader>fz :tabnew %<cr>

" fugitive
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gf :GV!<CR>
nnoremap <leader>gl :Gclog<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gt :Gcommit -v -q %:p<CR>
nnoremap <leader>gv :GV<CR>
nnoremap <leader>gw :Gwrite<CR><CR>

nnoremap <leader>go :Goyo<CR>

" Toggle hlsearch with <leader>hs
" nmap <leader>hs :set hlsearch! hlsearch?<CR>

" buffergator: Go to the previous buffer open
" nmap <leader>j :BuffergatorMruCyclePrev<cr>

" buffergator: Go to the next buffer open
" nmap <leader>k :BuffergatorMruCycleNext<cr>

map <leader>nf :NERDTreeFind<cr>
map <leader>nm :NERDTreeMirror<cr>
map <leader>nt :NERDTreeToggle<cr>

nnoremap <leader>o :Obsess<CR>
" p for pretty
nmap <Leader>p :Prettier<CR>

" Find in project
" Fix for Mac opt key
command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
\   {'options': fzf#vim#with_preview()["options"] + ['--bind', 'ctrl-a:select-all,ctrl-d:deselect-all']}, <bang>0)
nnoremap <leader>rg :Rg<space>

" search & replace current word
map <Leader>rr :%S@<C-r><C-w>@

" https://github.com/JoshCheek/seeing_is_believing/wiki/Editor-Integration

" Assumes you have a Ruby with SiB available in the PATH
" If it doesn't work, you may need to `gem install seeing_is_believing`

" Annotate every line
nmap <leader>saa :%!seeing_is_believing --timeout 12 --line-length 500 --number-of-captures 300 --alignment-strategy chunk<CR>;
" Remove annotations
nmap <leader>sc :%.!seeing_is_believing --clean<CR>;

" Mark the current line for annotation
nmap <leader>sm A # => <Esc>
" Mark the highlighted lines for annotation
vmap <leader>sm :norm A # => <Esc>

" Annotate marked lines
nmap <leader>sam :%.!seeing_is_believing --timeout 12 --line-length 500 --number-of-captures 300 --alignment-strategy chunk --xmpfilter-style<CR>;

nmap <Leader>tt :w<CR>:TestFile<CR>
nmap <Leader>ts :w<CR>:TestNearest<CR>
nmap <Leader>tl :w<CR>:TestLast<CR>
" nmap <Leader>ta :w<CR>:TestSuite<CR>
nmap <Leader>tv :w<CR>:TestVisit<CR>

command! PromoteToLet :call PromoteToLet()
nmap <leader>tp :PromoteToLet<cr>

nmap <Leader>trt :w<CR>:TestFile -strategy=basic<CR>
nmap <Leader>trs :w<CR>:TestNearest -strategy=basic<CR>
nmap <Leader>trl :w<CR>:TestLast -strategy=basic<CR>

" set text wrapping toggles
nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

nnoremap <leader>u :UndotreeToggle<CR>

nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>

nnoremap <leader>ve :tabe $MYVIMRC<CR>
" Manually source it, there is an autocmd below to do this automatically.
nnoremap <leader>vs :source $MYVIMRC<CR>

" Refocus folds
nnoremap <leader>z zMzvzz

" upper/lower word
" nmap <leader>u mQviwU`Q
" nmap <leader>l mQviwu`Q

" upper/lower first char of word
" nmap <leader>U mQgewvU`Q
" nmap <leader>L mQgewvu`Q

" cd to the directory containing the file in the buffer
" nmap <silent> <leader>cd :lcd %:h<CR>

" Create the directory containing the file in the buffer
" nmap <silent> <leader>md :!mkdir -p %:p:h<CR>

" ======================================================== }}}
" Non-Leader Mappings {{{

" Fast <esc>
inoremap jk <esc>

" <c-u> in normal mode uppercases current word
nnoremap <c-u> viwU
" <c-u> in insert mode uppercases current word
inoremap <c-u> <esc>viwUea

" Start a search based on the visually-selected text
vnoremap // y/<C-R>"<CR>

" Start an Rg search based on the visually-selected text
nnoremap & *yiw:Rg <C-R>"<CR>

" Swap two words
" nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" Underline the current line with '='
" nmap <silent> <leader>ul :t.<CR>Vr=  " Causes delay on ',w'

" Make regex behave like Ruby or PRCE, not vim's weirdness
" Commented because this adds to the search phrase and breaks :AckFromSearch
" nnoremap / /\v
" vnoremap / /\v

" Apply macros with ease
nnoremap Q @q
vnoremap Q :norm @q<cr>

" Handle accidental capitals
command! Q q " Bind :Q to :q
command! Qall qall
command! W w

" Make Y yank till end of line
nnoremap Y yg_

" Recursively top-level fold regardless of cursor
nnoremap zO zCzO

" Map the arrow keys to be based on display lines, not physical lines
map <Down> gj
map <Up> gk

" Clear search result when hitting enter
nnoremap <CR> :nohlsearch<BAR>:echo<CR><CR>

" Move visual block up/down with indentation
xnoremap <C-j> :m'>+<CR>gv=gv
xnoremap <C-k> :m-2<CR>gv=gv

" After whitespace, insert the current directory into a command-line path
cnoremap <expr> <C-P> getcmdline()[getcmdpos()-2] ==# ' ' ? expand('%:p:h') : "\<C-P>"

" fzf
nnoremap <c-p> :Files<cr>

" " Easy Switching - Now built in the vim-tmux-navigator plugin
" map <c-h> <c-w>h
" map <c-j> <c-w>j
" map <c-k> <c-w>k
" map <c-l> <c-w>l
noremap <c-x> <c-w>x

" ======================================================== }}}
" AutoCommands {{{

" Set unusual filetypes
autocmd BufNewFile,BufRead *.jb set filetype=ruby

" Source vimrc/init when saved
" autocmd BufWritePost $MYVIMRC source $MYVIMRC

" vim-commentary - fix comments
autocmd FileType slim setlocal commentstring=/\ %s
autocmd FileType yaml setlocal commentstring=#\ %s
autocmd FileType eruby.yaml setlocal commentstring=#\ %s

" Trigger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
" autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
" autocmd FileChangedShellPost *
"   \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None


" Automatically resize splits when resizing MacVim window
autocmd VimResized * wincmd =

autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

autocmd FileType elm setlocal shiftwidth=4 tabstop=4

autocmd FileType eruby setlocal foldmethod=indent

" ======================================================== }}}
" Custom Functions {{{

" Promote a variable to an rspec let statement.
"
" Convert lines that look like `x = y` to lines that look like
" `let(:x){ y }`.

function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction


function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
  set wrap
  set guifont=Menlo:h18
  Limelight
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5
  set nowrap
  set guifont=Hack:h14
  Limelight!
endfunction

" ======================================================== }}}
" Plugin Settings {{{

" ale {{{

" fix files on save
let g:ale_fix_on_save = 1

" lint after 1000ms after changes are made both on insert mode and normal mode
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_delay = 1000

" use nice symbols for errors and warnings
let g:ale_sign_error = '✗\ '
let g:ale_sign_warning = '⚠\ '

" fixer configurations
let g:ale_linters_explicit = 1
let g:ale_linters = {
      \ 'eruby': ['erb'],
      \ 'ruby': ['standardrb'],
      \ 'javascript': ['standard']
\}
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'ruby': ['standardrb'],
      \ 'javascript': ['standard']
\}

" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)

" ======================================================== }}}
" auto-pairs {{{

" don't jump to a new line to close a pair
let g:AutoPairsMultilineClose=0

" ======================================================== }}}
" buffergator.vim {{{

let g:buffergator_sort_regime = "mru"
let g:buffergator_autoexpand_on_split = 0
let g:buffergator_display_regime = "basename"
let g:buffergator_show_full_directory_path = 0
let g:buffergator_split_size = 50

" Use the right side of the screen
let g:buffergator_viewport_split_policy = 'R'

" I want my own keymappings...
let g:buffergator_suppress_keymaps = 1

" Looper buffers
"let g:buffergator_mru_cycle_loop = 1

" ======================================================== }}}
" coc.nvim {{{

let g:coc_global_extensions = [
      \  'coc-css',
      \  'coc-html',
      \  'coc-json',
      \  'coc-prettier',
      \  'coc-solargraph',
      \  'coc-snippets',
      \  'coc-tsserver',
      \  'coc-yaml',
      \]

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>lr <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>la  <Plug>(coc-codeaction-selected)
nmap <leader>la  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>lt  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>lf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <leader>ld  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <leader>le  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <leader>lc  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <leader>lo  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <leader>ls  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <leader>lj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>lk  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <leader>lp  :<C-u>CocListResume<CR>

" CoC Extensions

command! -nargs=0 Prettier :CocCommand prettier.formatFile

let g:coc_snippet_next = '<tab>'

" ======================================================== }}}
" emmet-vim {{{

let g:user_emmet_leader_key=','

" make emmet behave well with JSX in JS and TS files
" let g:user_emmet_settings = {
" \  'javascript' : {
" \      'extends' : 'jsx',
" \  },
" \  'typescript' : {
" \      'extends' : 'tsx',
" \  },
" \}

" let g:user_emmet_install_global = 0
" autocmd FileType jsx,slim,scss,html,css EmmetInstall

" ======================================================== }}}
" golden-ratio {{{

let g:golden_ratio_autocommand = 0
let g:golden_ratio_exclude_nonmodifiable = 1

" ======================================================== }}}
" greplace.vim {{{

set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

" ======================================================== }}}
" lightline.vim {{{

" Defaults
  " \   'left': [['mode', 'paste'], ['readonly', 'filename', 'modified']],
  " \   'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype']]

let g:lightline = {
  \ 'colorscheme': 'material_vim',
  \ 'active': {
  \   'left': [['mode', 'paste'], ['cocstatus', 'currentfunction', 'gitbranch', 'readonly', 'filenamewithparent', 'modified']],
  \   'right': [['lineinfo'], ['percent'], ['filetype']]
  \ },
  \ 'inactive': {
  \   'left': [['filenamewithparent', 'modified']],
  \   'right': [['lineinfo'], ['percent']]
  \ },
  \ 'component': {
  \   'filenamewithparent' : "%{expand('%:p:h:t')}/%t"
  \ },
  \ 'component_function': {
  \   'cocstatus': 'coc#status',
  \   'currentfunction': 'CocCurrentFunction',
  \   'gitbranch': 'FugitiveHead',
  \   'filetype': 'LightlineFiletype',
  \ },
  \ 'mode_map': {
  \   'n' : 'N',
  \   'i' : 'I',
  \   'R' : 'R',
  \   'v' : 'V',
  \   'V' : 'VL',
  \   "\<C-v>": 'VB',
  \   'c' : 'C',
  \   's' : 'S',
  \   'S' : 'SL',
  \   "\<C-s>": 'SB',
  \   't': 'T',
  \ },
\ }

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! CocCurrentFunction()
  return get(b:, 'coc_current_function', '')
endfunction

" ======================================================== }}}
" limelight.vim {{{

" autocmd! User GoyoEnter Limelight
" autocmd! User GoyoLeave Limelight!

" ======================================================== }}}
" neomake {{{

let g:neomake_open_list = 2

" ======================================================== }}}
" quick-scope {{{

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" ======================================================== }}}
" splitjoin {{{

let g:splitjoin_ruby_curly_braces = 0
let g:splitjoin_ruby_hanging_args = 0

" ======================================================== }}}
" tslime.vim {{{

let g:tslime_always_current_session = 1
nmap <C-c>r <Plug>SetTmuxVars

" ======================================================== }}}
" vim-closetag {{{

let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb,*.jsx"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.erb'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

" ======================================================== }}}
" vim-easy-align {{{

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" ======================================================== }}}
" vim-expand-region {{{

" Use the global default + the following for ruby
call expand_region#custom_text_objects('ruby', {
      \ 'ir' :0,
      \ 'ar' :1,
      \ })

" ======================================================== }}}
" vim-ruby {{{

let g:ruby_indent_assignment_style = 'variable'

" ======================================================== }}}
" sideways.vim {{{

" Move arguments sideways
nnoremap gz :SidewaysLeft<cr>
nnoremap gx :SidewaysRight<cr>

" This will map the "a" text object to operate on an "argument". So, you can
" perform daa to delete an argument, cia to change an argument, and so on.
omap aa <Plug>SidewaysArgumentTextobjA
xmap aa <Plug>SidewaysArgumentTextobjA
omap ia <Plug>SidewaysArgumentTextobjI
xmap ia <Plug>SidewaysArgumentTextobjI

" ======================================================== }}}
" switch.vim {{{

" let g:switch_custom_definitions =
"     \ [
"     \   ['foo', 'bar', 'baz']
"     \ ]

let b:switch_custom_definitions = [
      \   {
      \     '\(\k\+=\){\([[:keyword:].]\+\)}':      '\1{`${\2}`}',
      \     '\(\k\+=\){`${\([[:keyword:].]\+\)}`}': '\1{\2}',
      \     '^\( *\)describe': '\1fdescribe',
      \     '^\( *\)fdescribe': '\1describe',
      \     '^\( *\)it': '\1fit',
      \     '^\( *\)fit': '\1it',
      \     'it.todo(\(.\+\))': 'it(\1, () => {\r})',
      \     'expect(\(.\+\)).to': 'expect(\1).not.to',
      \     'expect(\(.\+\)).not.to': 'expect(\1).to'
      \   }
      \ ]

" ======================================================== }}}
" vim-sneak {{{

let g:sneak#label = 1

" map f <Plug>Sneak_f
" map F <Plug>Sneak_F
" map t <Plug>Sneak_t
" map T <Plug>Sneak_T

" ======================================================== }}}
" vim-test {{{

" let g:dispatch_quickfix_height=25

" let test#strategy = "basic"
let test#strategy = "dispatch"
" let test#strategy = "vimterminal"
" let test#strategy = "vimux"
" let g:test#strategy = 'neomake'
" let g:test#strategy = 'neovim'
" let g:test#strategy = 'kitty'

let g:test#javascript#jest#options = '--reporters jest-vim-reporter'


" ======================================================== }}}
" ======================================================== }}}
"// " vim:foldmethod=marker:foldlevel=1:foldenable
