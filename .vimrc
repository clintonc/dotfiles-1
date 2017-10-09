" SETTINGS {{{
" Some standard vim settings, independent of plugins.

set background=dark
set showmatch
set hlsearch
set nomodeline  " I'm a scaredy-cat.

" Unhighlight highlighted search terms.
nnoremap <leader><space> :nohlsearch<CR>

" Escape is SO far away.
inoremap jk <ESC>

" Use folding in vimrc.
autocmd BufEnter .vimrc set foldmethod=marker

" No menus or scrollbars in gvim.
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
" }}}

" PLUGINS {{{
"
" We use junegunn/vim-plug for plugin configuration.  You can use :PlugInstall
" to git clone each of the following; vim-plug will add it to your runtime
" path.  If you comment out one of the following lines, the plugin will not be
" loaded on the next launch.  To remove unused plugins, use :PlugClean.

call plug#begin()

" Sensible defaults for vim.
Plug 'tpope/vim-sensible'

" A git wrapper.
" :help fugitive.txt
Plug 'tpope/vim-fugitive'

" Profiling support.  Run :StartupTime to test your vimrc.
" Visit the github for documentation.
Plug 'tweekmonster/startuptime.vim'

" Full path fuzzy file, buffer, mru, tag, ... finder.  Just press C-p to
" start.
" :help ctrlp.vim
Plug 'ctrlpvim/ctrlp.vim'

" A software caps lock with <C-g> c
" :help capslock.txt
Plug 'tpope/vim-capslock'

" Provides a :Subvert command, which is like :subsitute, but handles cpas
" intelligently.  Also includes commands to coerce among capitalization
" conventions (snake_case, MixedCase, camelCase, etc).
" :help abolish.txt
Plug 'tpope/vim-abolish'

" Handy pairs of related commands.  My favorites are [<Space> and ]<Space>,
" for inserting lines above and below the current one in normal mode.
" :help unimpaired.txt
Plug 'tpope/vim-unimpaired'

" Commands for commenting and uncommenting line.  Try gcc in normal mode, gc
" in visual selection mode.
" :help commentary.txt
Plug 'tpope/vim-commentary'

" Commands for surrounding stuff with stuff.  For example, ysiw) will surround
" a word with parentheses.
" :help surround.txt
Plug 'tpope/vim-surround'

" Makes . more powerful with some plugins (like vim-surround and vim-abolish).
" :help repeat.txt
Plug 'tpope/vim-repeat'

" Get readline-style behavior in the command line and insert mode.
" :help rsi.txt
Plug 'tpope/vim-rsi'

" Git interface.  :Magit opens the buffer, and ? then gives commands.
" :help vimagit.txt
Plug 'jreybert/vimagit'

" Show git status in the sidebar.  If you use other VCSes, consider using
" mhinz/vim-signify instead.
" :help gitgutter.txt
Plug 'airblade/vim-gitgutter'

" Visualize your vim undo tree.
" :help gundo.txt
Plug 'sjl/gundo.vim'

" A (slightly buggy) parens-balancing plugin.
" :help delimitMate.txt
Plug 'Raimondi/delimitMate'

" Expand the visual selection syntactically using + and _ in normal mode.
" :help vim-expand-region.txt
Plug 'terryma/vim-expand-region'

" Insert templated snippets.
" :help ultisnips.txt
Plug 'SirVer/ultisnips'

" Automatically detect the indentation settings for a file with :DetectIndent.
" See also tpope/vim-sleuth, which will search up the directory tree for files
" of the same type to use for indentation settings.
" :help detectindent.txt
Plug 'ciaranm/detectindent'

" Some Google plugins, necessary for the installation and configuration of
" other Google plugins..
Plug 'google/vim-maktaba'  " :help maktaba.txt
Plug 'google/vim-glaive'   " :help glaive.txt

" Adds FormatLines and FormatCode.
" :help codefmt.txt
Plug 'google/vim-codefmt'

" A comfy file browser.  Bound below to \a.
" :help NERDtree.txt
Plug 'scrooloose/nerdtree'

" Fancy modeline.
" :help airline.txt
Plug 'vim-airline/vim-airline'

" Decent color scheme.
Plug 'morhetz/gruvbox'

call plug#end()
call glaive#Install()
" }}}

" PLUGIN CONFIGURATION {{{

" Airline tries to use fancy symbols, which may only be available in a patched
" font.  Here, we restrict airline to using plain symbols.  See
" https://github.com/vim-airline/vim-airline#integrating-with-powerline-fonts
let g:airline_symbols_ascii = 1

" Bind codefmt bindings (\=).
Glaive codefmt plugin[mappings]

colorscheme gruvbox
let g:delimitMate_offByDefault = 1
let g:airline#extensions#tabline#enabled = 1
" }}}

" PLUGIN AUTOCMDS {{{
augroup autoformat_settings
  " Automatically format some file types.
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
augroup END
" }}}

" PLUGIN KEY BINDINGS {{{
nnoremap =om :DelimitMateSwitch<CR>
nmap <Leader>a :NERDTreeToggle<CR>
nnoremap <Leader>u :GundoToggle<CR>
" }}}
