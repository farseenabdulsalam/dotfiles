
"  My Plugins
" ------------
" {{
call plug#begin()
    Plug 'PotatoesMaster/i3-vim-syntax'
    Plug 'gioele/vim-autoswap'
    Plug 'tomtom/tcomment_vim'
    Plug 'tpope/vim-surround'
    Plug 'mhinz/vim-startify'

    Plug 'scrooloose/nerdtree'
    Plug 'airblade/vim-rooter'
    Plug 'LucHermitte/lh-vim-lib'
    Plug 'LucHermitte/local_vimrc'
    Plug 'kien/ctrlp.vim'
    " Plug 'bronson/vim-trailing-whitespace'
    Plug '4Evergreen4/vim-hardy' " -- Arduino integration
    Plug 'nanotech/jellybeans.vim'
    Plug 'bling/vim-airline'
    Plug 'majutsushi/tagbar'
    Plug 'moll/vim-bbye' " :Bdelete
    Plug 'Valloric/YouCompleteMe'
    Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }
    Plug 'mattn/emmet-vim', { 'for': 'html' }
call plug#end()
" }} End of My Plugins

" My preferences
" {{

    " Indentation related prefs
    " {
        filetype plugin indent on
        " show existing tab with 4 spaces width
        set tabstop=2
        " when indenting with '>', use 4 spaces width
        set shiftwidth=2
        " On pressing tab, insert 4 spaces
        set expandtab
        " backspace key -> untab
        " home go to true beginning
        set softtabstop=2
    " }

    " Numbering prefs
    " {

        " enable numbering
        set number
        set relativenumber

        " insert mode -> absolute number
        autocmd InsertEnter * :set norelativenumber
        autocmd InsertLeave * :set relativenumber
        " focus lost -> absolute number
        :au FocusLost * :set norelativenumber
        :au FocusGained * :set relativenumber
    " }

    " Preview window at bottom
        augroup PreviewOnBottom
            autocmd InsertEnter * set splitbelow
            autocmd InsertLeave * set splitbelow!
        augroup END

    " General completion options
    " {{
       " auto select longest common match
       " show menu even if only one match
        set completeopt=longest,menu,preview
        " fix enter key on popup
        inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
        " fix jk navigation on popup
        inoremap <expr> <C-j> pumvisible() ? '<C-n>' : 'j'
        inoremap <expr> <C-k> pumvisible() ? '<C-p>' : 'k'
    " }}


    " Clang_complete options
    " {{

        " more completion
        " let g:clang_complete_macros=1
        " " let g:clang_complete_pattern=1
        " " auto select, insert
        " let g:clang_auto_select = 2
        " " Auto complete without pressing Tab
        " let g:clang_complete_auto=1
        "
        " " Auto close preview window clang_complete
        " let g:clang_close_preview=1
        "
        " " Use libclang instead of clang executable
        " let g:clang_library_path='/usr/lib/libclang.so'
        "
        " " Some dirty hack
        " let g:clang_user_options='|| exit 0'
        "
        " let g:clang_complete_copen=1
        " let g:clang_periodic_quickfix=1
        " "
        " let g:clang_snippets=1
        " let g:clang_snippets_engine = 'ultisnips'
        " let g:SuperTabDefaultCompletionType='<c-x><c-u><c-p>'
        " let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
        " let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']
        " let g:SuperTabDefaultCompletionType = 'YCM'
        " let g:SuperTabDefaultCompleteType = 'context'
        " Set ultisnips triggers
        " let g:UltiSnipsExpandTrigger="<tab>"
        " let g:UltiSnipsJumpForwardTrigger="<tab>"
        " let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
        let g:SuperTabClosePreviewOnPopupClose = 1
    " }}

    " General prefs
    " {
        syntax on

        " -- 80th column
        if (exists('+colorcolumn'))
            set colorcolumn=80
            highlight ColorColumn ctermbg=8
        endif

        " Always show statusbar
        set laststatus=2

        try
            colorscheme jellybeans
        catch
            echo "Jellybeans color scheme is not found"
        endtry
    " }

    " GUI prefs
    " {

        set guifont=Source\ Code\ Pro\ Medium\ 9
        set guioptions-=r " Removes right hand scroll bar
        set guioptions-=L " Removes left hand scroll bar
        set guioptions-=T " Removes toolbar

    " }

    " Plugin specific prefs
    " {

        let g:ctrlp_custom_ignore = {
          \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site|unused)$',
          \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
        \}
        let g:airline#extensions#tabline#enabled = 1

    " }

" }}
" ENDOF My preferences

" Beginning of my shortcuts
" {{

    " Here goes leader declaration
    let mapleader = "\<Space>"
    let maplocalleader = "\<Space>"

    " Quick access to Ctrl-P
    " <Leader> <Dot>
    nnoremap <leader>. :CtrlPBuffer<cr>
    nnoremap <leader>.a :CtrlPMixed<cr>
    nnoremap <leader>.m :CtrlPMRU<cr>
    nnoremap <leader>.t :CtrlPTag<cr>

    nnoremap <silent> <Leader>b :TagbarToggle<CR>
    nnoremap <silent> <Leader>bb :TagbarTogglePause<CR>

    " Disable Arrow keys in normal mode
    " nnoremap <Up> <NOP>
    " nnoremap <Down> <NOP>
    " nnoremap <Left> <NOP>
    " nnoremap <Right> <NOP>
    nnoremap <C-j> <PageDown>
    nnoremap <C-k> <PageUp>
    " Ctrl+hjkl -> movement in insert mode
    inoremap <C-h> <Left>
    inoremap <C-j> <Down>
    inoremap <C-k> <Up>
    inoremap <C-l> <Right>

    " inoremap <C-Space> <ESC>l
    " <Leader> w <Direction> to create a split
    " in that direction
    nnoremap <leader>wh     :lefta wincmd v<CR>
    nnoremap <leader>wk     :lefta wincmd s<CR>
    nnoremap <leader>wl     :rightb wincmd v<CR>
    nnoremap <leader>wj     :rightb wincmd s<CR>

    " <Leader> <Dir> to move to that window
    nnoremap <silent> <leader>k :wincmd k<CR>
    nnoremap <silent> <leader>j :wincmd j<CR>
    nnoremap <silent> <leader>h :wincmd h<CR>
    nnoremap <silent> <leader>l :wincmd l<CR>

    " close window <leader> wc
    nnoremap <leader>wc :wincmd q<cr>
    " rotate window <leader> wr
    nnoremap <leader>wr <C-W>r

    " <leader> wr <direction> resize window
    nnoremap <leader>wrh  :3wincmd <<cr>
    nnoremap <leader>wrl :3wincmd ><cr>
    nnoremap <leader>wrk    :3wincmd +<cr>
    nnoremap <leader>wrj  :4wincmd -<cr>

    " Quick toggle relative/abs numbering
    " <leader>*2 n
    nnoremap <leader><leader>n :set relativenumber!<cr>


    " <leader> bc -> close buffer
    nnoremap <leader>bc :Bdelete<cr>
    " <leader><dir> -> move to that buffer
    nnoremap <C-l> :bnext!<cr>
    nnoremap <C-h> :bprevious!<cr>

    " Window maximize toggle
    " <leader> wm
    nnoremap <leader>wm :call MaximizeToggle()<CR>

    function! MaximizeToggle()
      if exists("s:maximize_session")
        exec "source " . s:maximize_session
        call delete(s:maximize_session)
        unlet s:maximize_session
        let &hidden=s:maximize_hidden_save
        unlet s:maximize_hidden_save
      else
        let s:maximize_hidden_save = &hidden
        let s:maximize_session = tempname()
        set hidden
        exec "mksession! " . s:maximize_session
        only
      endif
    endfunction
    "<leader> <action> to del/copy/paste
    "to/from system clipboard
    vmap <Leader>y "+y
    vmap <Leader>d "+d
    nmap <Leader>p "+p
    nmap <Leader>P "+P
    vmap <Leader>p "+p
    vmap <Leader>P "+P

    " <leader> w -> save
    nnoremap <Leader>w :w<CR>

    " NERDTree
    nnoremap <leader>nt :NERDTreeToggle<CR>

    " Stop that stupid window from popping up
    nnoremap q: :q

    " Close preview window
    nnoremap <Leader>pc :pclose<CR>

    " Search for expression containing slash
    " Define a new command Ss.
    command! -nargs=1 Ss let @/ = <q-args>
    " Map <Leader><slash> to the above command
    nnoremap <Leader>/ :Ss
" }}
" ENDOF My shortcuts

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Auto remove whitespaces
autocmd BufWritePre * :%s/\s\+$//e

command! AutoSplit :rightb wincmd v|:wincmd l| :rightb wincmd s | :wincmd h

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

nnoremap <leader>x :lnext<CR>
nnoremap <leader>X :lprevious<CR>
nnoremap <leader>, :%s/,\(\S\)/, \1/g<CR>
" python comma style fix
nnoremap <leader>i :VimpyCheckLine
" TODO: Figure out how to make the above shortcut python only
