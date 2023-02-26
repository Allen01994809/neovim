filetype plugin indent on

"=====================================================================
" variables
let is_nvim = has('nvim')
let is_vscode = exists('g:vscode')

" let is_windows = has("win32") || has("win64")
let mapleader = "," " <leader>で使用できる

"=====================================================================
if is_nvim
  lua require('entry') 
endif

"=====================================================================
if !is_vscode
  set encoding=utf-8
  set number
  " set ruler                " ルーラーの表示
  set cursorline             " 行を強調表示

  " winとmacは違う
  set clipboard+=unnamedplus " クリップボードのコピー
  set encoding=utf-8         " 文字コード
  set linespace=0            " hoge
  set nowrap                 " 文字の折り返し設定
  " set showcmd                " コマンドをステータス行に表
  set ignorecase             " 大文字小文字無視
  set smartcase              " 大文字ではじめたら大文字小文字無視しない
  set wrapscan               " 最後まで検索したら先頭へ戻る
  set hlsearch               " 検索文字をハイライト
  set incsearch              " インクリメンタルサーチ
  set noswapfile             " swapファイルを表示しない
  " set list set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:% " インデントなどの設定
  imap <C-H> <BS>
endif

"=====================================================================
" imap インサートモード用のキーマッピング
"=====================================================================
" noremap ノーマルモード用のキーマッピング
" 行頭、行末
noremap <Space>h  ^
noremap <Space>l  $

" 分割ウィンドウ移動
if !is_vscode
  noremap <C-h> <C-w>h
  noremap <C-j> <C-w>j
  noremap <C-k> <C-w>k
  noremap <C-l> <C-w>l
  noremap gh gT
  noremap gl gt
  " 平行分割ウィンド
  noremap ss :split<Return><C-w>w
  " 水平分割ウィンド
  noremap sv :vsplit<Return><C-w>w
  noremap gn :tabnew<CR>
  " <Space>q で強制終了
  noremap <Space>q :<C-u>q!<Return>
  " <Space>w 強制保存
  noremap <Space>w :<C-u>w<Return>
  " ESC*2 でハイライトやめる
  noremap <Esc><Esc> :<C-u>set nohlsearch<jReturn>
  " command
  command! Memo edit ~/memo.markdown
  command! Read edit ~/.config/nvim/README.md
  "=====================================================================
  " vnoremap
  vnoremap < <gv
  vnoremap > >gv
  " 0番レジスタを使いやすくした
  " via http://qiita.com/items/bd97a9b963dae40b63f5
  vnoremap <silent> <C-p> "0p
  "=====================================================================
  " highlight Blamer guifg=lightgrey
  let g:blamer_delay = 300
  let g:blamer_date_format = '%y/%m/%d'
  let g:blamer_enabled = 1
  let g:blamer_template	= '=> <committer>: <committer-time> • <summary>'
else
  " ref https://github.com/vscode-neovim/vscode-neovim/blob/b9def15f267d0e212c989981c883741de4256993/vim/vscode-window-commands.vim
  nnoremap <C-l> <Cmd>call VSCodeNotify('workbench.action.focusRightGroup')<CR>
  nnoremap <C-h> <Cmd>call VSCodeNotify('workbench.action.focusLeftGroup')<CR>
  function! s:switchEditor(...) abort
    let count = a:1
    let direction = a:2
    for i in range(1, count ? count : 1)
        call VSCodeCall(direction ==# 'next' ? 'workbench.action.nextEditorInGroup' : 'workbench.action.previousEditorInGroup')
    endfor
  endfunction
  
  function! s:split(...) abort
    let direction = a:1
    let file = exists('a:2') ? a:2 : ''
    call VSCodeCall(direction ==# 'h' ? 'workbench.action.splitEditorDown' : 'workbench.action.splitEditorRight')
    if !empty(file)
        call VSCodeExtensionNotify('open-file', expand(file), 'all')
    endif
  endfunction
  noremap ss <Cmd>call <SID>split('v')<CR>
  noremap sv <Cmd>call <SID>split('v')<CR>

  nnoremap gh <Cmd>call <SID>switchEditor(v:count, 'next')<CR>
  xnoremap gh <Cmd>call <SID>switchEditor(v:count, 'next')<CR>
  nnoremap gl <Cmd>call <SID>switchEditor(v:count, 'prev')<CR>
  xnoremap gl <Cmd>call <SID>switchEditor(v:count, 'prev')<CR>

  noremap <Space>q <Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>
  noremap <Space>w <Cmd>call VSCodeCall('workbench.action.files.save')<CR>
endif
