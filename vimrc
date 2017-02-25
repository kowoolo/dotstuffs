set nocompatible              " be iMproved, required
filetype off                  " required
" Vundle "{{{
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdcommenter'
Plugin 'wincent/terminus'
call vundle#end()
"}}}
" General settings "{{{
  filetype on
  filetype plugin indent on
  filetype plugin on
  syntax on
  set relativenumber
  set title
  set mouse=a
  set noswapfile        " no swapfile
  set shortmess=at      " shorten error messages
  set nrformats+=alpha  " in-/decrease letters with C-a/C-x
  set modeline          " enable modelines
  set modelines=5
  set number            " enable line numbers
  set ruler             " enable something
  set cursorline        " enable hiliting of cursor line
  set backspace=2       " backspace over EOL etc.
  set hidden            " buffer switching should be quick
  set confirm           " ask instead of just print errors
  set equalalways       " make splits equal size
  set lazyredraw        " don't redraw while executing macros
  set noshowmode        " don't display mode, it's already in the status line
  let mapleader=","
  let maplocalleader=","
  set showcmd
" Folds 
  set foldmethod=marker
  set foldcolumn=1
"set list
  "set list
" Margins 
  set scrolloff=5
  set sidescroll=5
" Wrapping 
  set linebreak
  set showbreak=</  
" tabs"{{{
	set tabstop=2
	set shiftwidth=2
	set softtabstop=2
	set autoindent
	set smartindent
	set expandtab
  set equalalways
"}}}
" Nerdtree plugin settings"{{{
  let NERDTreeChDirMode = 2
  let NERDTreeShowBookmarks = 1
  let NERDTreeShowHidden=1
"}}}
"}}}
" GUI or no GUI, that's the question "{{{
  if has('gui_running')
    set guicursor+=a:blinkon0       " Cursor doesn't blink - it's annoying
    " set guioptions-=m               " No Menubar
    set guioptions-=T               " No Toolbar
    set guioptions-=l               " No Scrollbar left
    set guioptions-=L               " No Scrollbar left when split
    set guioptions-=r               " No Scrollbar right
    set guioptions-=r               " No Scrollbar right when split
    set laststatus=2                " always show statusline
    set gfn=PragmataPro\ Bold\ 7 
    "set gfn=Ubuntu\ Mono\ derivative\ Powerline\ Bold\ 10
    " set gfn=Mensch\ 7
    set lines=40                    " Height
    set columns=85                  " Width
    set number
    colorscheme dotshare
  else
    colorscheme urxvt
  endif
"}}}
"{{{ theme stuff
  set background=dark   " i prefer dark backgrounds
  set laststatus=2      " always show statusline
  set t_Co=256

  setl statusline+=
" set statusline+=*\[%n]                                  "buffernr
" set statusline+=%1*\ %<%F\                                "File+path
" set statusline+=%2*\ %y\                                  "FileType
" set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
" set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
" set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..)
" set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
" set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
" set statusline+=%9*\ col:%03c\                            "Colnr
" set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.

function! HighlightSearch()
  if &hls
    return 'H'
  else
    return ''
  endif
endfunction


  " function! SetStatus()
  "   setl statusline+=
  "         \%1*\ %f
  "         \%H%M%R%W%7*\ ┃
  "         \%2*\ %Y\ <<<\ %{&ff}%7*\ ┃
  " endfunction
  "
  " function! SetRightStatus()
  "   setl statusline+=
  "         \%5*\ %{StatusFileencoding()}%7*\ ┃
  "         \%5*\ %{StatusBuffersize()}%7*\ ┃
  "         \%=%<%7*\ ┃
  "         \%5*\ %{StatusWrapON()}
  "         \%6*%{StatusWrapOFF()}\ %7*┃
  "         \%5*\ %{StatusInvisiblesON()}
  "         \%6*%{StatusInvisiblesOFF()}\ %7*┃
  "         \%5*\ %{StatusExpandtabON()}
  "         \%6*%{StatusExpandtabOFF()}\ %7*┃
  "         \%5*\ w%{StatusTabstop()}\ %7*┃
  "         \%3*\ %l,%c\ >>>\ %P
  "         \\
  " endfunction

  " function! SetStatusLeaveBuffer()
  "   setl statusline=""
  "   call SetStatus()
  " endfunction
  " au BufLeave * call SetStatusLeaveBuffer()
  "
  " function! SetStatusInsertMode(mode)
  "   setl statusline=%4*
  "   if a:mode == 'i'
  "     setl statusline+=\ Einfügen\ ◥
  "   elseif a:mode == 'r'
  "     setl statusline+=\ Ersetzen\ ◥
  "   elseif a:mode == 'normal'
  "     setl statusline+=\ normal\ ◥
  "   endif
  "   call SetStatus()
  "   call SetRightStatus()
  " endfunction
  "
  " au VimEnter     * call SetStatusInsertMode('normal')
  " au InsertEnter  * call SetStatusInsertMode(v:insertmode)
  " au InsertLeave  * call SetStatusInsertMode('normal')
  " au BufEnter     * call SetStatusInsertMode('normal')

  " Some Functions shamelessly ripped and modified from Cream
  "fileencoding (three characters only) {{{
  function! StatusFileencoding()
    if &fileencoding == ""
      if &encoding != ""
        return &encoding
      else
        return " -- "
      endif
    else
      return &fileencoding
    endif
  endfunc " }}}
  " &expandtab {{{
  function! StatusExpandtabON()
    if &expandtab == 0
      return "tabs"
    else
      return ""
    endif
  endfunction "
  function! StatusExpandtabOFF()
    if &expandtab == 0
      return ""
    else
      return "tabs"
    endif
  endfunction " }}}
  " tabstop and softtabstop {{{
  function! StatusTabstop()

    " show by Vim option, not Cream global (modelines)
    let str = "" . &tabstop
    " show softtabstop or shiftwidth if not equal tabstop
    if   (&softtabstop && (&softtabstop != &tabstop))
    \ || (&shiftwidth  && (&shiftwidth  != &tabstop))
      if &softtabstop
        let str = str . ":sts" . &softtabstop
      endif
      if &shiftwidth != &tabstop
        let str = str . ":sw" . &shiftwidth
      endif
    endif
    return str

  endfunction " }}}
  " Buffer Size {{{
  function! StatusBuffersize()
    let bufsize = line2byte(line("$") + 1) - 1
    " prevent negative numbers (non-existant buffers)
    if bufsize < 0
      let bufsize = 0
    endif
    " add commas
    let remain = bufsize
    let bufsize = ""
    while strlen(remain) > 3
      let bufsize = "," . strpart(remain, strlen(remain) - 3) . bufsize
      let remain = strpart(remain, 0, strlen(remain) - 3)
    endwhile
    let bufsize = remain . bufsize
    " too bad we can't use "¿" (nr2char(1068)) :)
    let char = "b"
    return bufsize . char
  endfunction " }}}
  " Show Invisibles {{{
  function! StatusInvisiblesON()
    "if exists("g:LIST") && g:LIST == 1
    if &list
      if     &encoding == "latin1"
        return "¶"
      elseif &encoding == "utf-8"
        return "¶"
      else
        return "$"
      endif
    else
      return ""
    endif
  endfunction
  function! StatusInvisiblesOFF()
    "if exists("g:LIST") && g:LIST == 1
    if &list
      return ""
    else
      if     &encoding == "latin1"
        return "¶"
      elseif &encoding == "utf-8"
        return "¶"
      else
        return "$"
      endif
    endif
  endfunction " }}}
  " Wrap Enabled {{{
  function! StatusWrapON()
    if &wrap
      return "wrap"
    else
      return ""
    endif
  endfunction
  function! StatusWrapOFF()
    if &wrap
      return ""
    else
      return "wrap"
    endif
  endfunction
  " }}}
" }}}
"{{{ Keybinds
  map <f5> :NERDTreeToggle<CR>
  map <f6> :tabprevious<CR>
  map <f7> :tabnext<CR>
  map <f8> :tabnew<CR>
" buffers
	map <F3> <Esc>:bn<CR>
	map <F2> <Esc>:bp<CR>
	map <F4> <Esc>:bd<CR>
" Saving
	map ,, :w<CR>
	"map ,. :w!<CR>
" Explore
  nmap <silent> ,. :Explore<CR>
" sourcing files
	nmap <silent> ,ev :e $MYVIMRC<CR>
	nmap <silent> ,en :e ~/notes.txt<CR>
	nmap <silent> ,sv :so $MYVIMRC<CR>
	nmap <silent> ,re :so $MYVIMRC<CR>
" Maps to make handling windows a bit easier
  noremap <silent> ,h :wincmd h<CR>
  noremap <silent> ,j :wincmd j<CR>
  noremap <silent> ,k :wincmd k<CR>
  noremap <silent> ,l :wincmd l<CR>
  noremap <silent> ,sb :wincmd p<CR>
  noremap <silent> ,sl  :vertical resize -10<CR>
  noremap <silent> ,sj :resize +10<CR>
  noremap <silent> ,sk :resize -10<CR>
  noremap <silent> ,sh :vertical resize +10<CR>
  noremap <silent> ,s8 :vertical resize 83<CR>
  noremap <silent> ,cj :wincmd j<CR>:close<CR>
  noremap <silent> ,ck :wincmd k<CR>:close<CR>
  noremap <silent> ,ch :wincmd h<CR>:close<CR>
  noremap <silent> ,cl :wincmd l<CR>:close<CR>
  noremap <silent> ,cc :close<CR>
  noremap <silent> ,cw :cclose<CR>
  noremap <silent> ,ml <C-W>L
  noremap <silent> ,mk <C-W>K
  noremap <silent> ,mh <C-W>H
  noremap <silent> ,mj <C-W>J
  noremap <silent> <C-7> <C-W>>
  noremap <silent> <C-8> <C-W>+
  noremap <silent> <C-9> <C-W>+
  noremap <silent> <C-0> <C-W>>
"}}}
"{{{ Plugin stuff
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
"Powerline/airline
let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 0
" set fillchars+=stl:\ ,stlnc:\
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1
let g:gruvbox_contrast_dark = "medium"
let g:gruvbox_vert_split = "dark4"
"}}}
