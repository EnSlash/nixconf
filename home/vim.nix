{ pkgs, ... }:

{
  programs.vim = {
    enable = true;
    defaultEditor = true;

    plugins = with pkgs.vimPlugins; [
      nord-vim
      lightline-vim
      vim-fugitive
      vim-gitgutter
      nerdtree
      nerdtree-git-plugin
      vim-devicons
      auto-pairs
      vim-commentary
      vim-surround
      fzf-vim
      vim-nix
      coc-nvim
      coc-pyright
      coc-json
      coc-yaml
    ];

    extraConfig = ''
      set nocompatible
      set encoding=utf-8
      set number
      set relativenumber
      set cursorline
      set signcolumn=yes
      set colorcolumn=100
      set scrolloff=5
      set sidescrolloff=5
      set mouse=a
      set hidden
      set confirm

      set expandtab
      set tabstop=2
      set softtabstop=2
      set shiftwidth=2
      set smartindent
      set autoindent

      set ignorecase
      set smartcase
      set incsearch
      set hlsearch
      set wildmenu
      set wildmode=longest:full,full
      set completeopt=menuone,noinsert,noselect

      set splitbelow
      set splitright
      set updatetime=300
      set timeoutlen=500
      set noshowmode
      set laststatus=2
      set undofile
      set undodir=~/.vim/undo//

      if has('termguicolors')
        set termguicolors
      endif
      set background=dark
      colorscheme nord

      let mapleader = " "

      " Сохранение, выход и очистка подсветки поиска.
      nnoremap <leader>w :write<CR>
      nnoremap <leader>q :quit<CR>
      nnoremap <leader>h :nohlsearch<CR>

      " Быстрая навигация между окнами.
      nnoremap <C-h> <C-w>h
      nnoremap <C-j> <C-w>j
      nnoremap <C-k> <C-w>k
      nnoremap <C-l> <C-w>l

      " Файловое дерево и поиск.
      nnoremap <silent> <C-n> :NERDTreeToggle<CR>
      nnoremap <silent> <leader>nf :NERDTreeFind<CR>
      nnoremap <silent> <leader>ff :Files<CR>
      nnoremap <silent> <leader>fg :Rg<CR>
      nnoremap <silent> <leader>fb :Buffers<CR>
      let NERDTreeShowHidden = 1
      let NERDTreeMinimalUI = 1
      let NERDTreeDirArrows = 1

      " Информативная строка состояния.
      function! LightlineGitBranch()
        return exists('*FugitiveHead') ? FugitiveHead() : ""
      endfunction
      let g:lightline = {
        \ 'colorscheme': 'nord',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
        \   'right': [ [ 'lineinfo' ], [ 'percent' ],
        \              [ 'cocstatus', 'fileformat', 'fileencoding', 'filetype' ] ]
        \ },
        \ 'component_function': {
        \   'gitbranch': 'LightlineGitBranch',
        \   'cocstatus': 'coc#status'
        \ },
        \ }

      " Git-индикация на полях редактора.
      let g:gitgutter_map_keys = 0
      nnoremap <leader>hn :GitGutterNextHunk<CR>
      nnoremap <leader>hp :GitGutterPrevHunk<CR>
      nnoremap <leader>hs :GitGutterStageHunk<CR>
      nnoremap <leader>hu :GitGutterUndoHunk<CR>
      nnoremap <leader>gp :Git<CR>

      " Coc: completion, переходы по коду и диагностика.
      function! CheckBackspace() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1] =~# '\s'
      endfunction

      inoremap <silent><expr> <Tab>
        \ coc#pum#visible() ? coc#pum#next(1) :
        \ CheckBackspace() ? "\<Tab>" : coc#refresh()
      inoremap <silent><expr> <S-Tab>
        \ coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
      inoremap <silent><expr> <CR>
        \ coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>"

      nmap <silent> gd <Plug>(coc-definition)
      nmap <silent> gy <Plug>(coc-type-definition)
      nmap <silent> gi <Plug>(coc-implementation)
      nmap <silent> gr <Plug>(coc-references)
      nmap <silent> [g <Plug>(coc-diagnostic-prev)
      nmap <silent> ]g <Plug>(coc-diagnostic-next)
      nmap <leader>rn <Plug>(coc-rename)
      nmap <leader>ca <Plug>(coc-codeaction-cursor)

      function! ShowDocumentation()
        if index(['vim', 'help'], &filetype) >= 0
          execute 'help ' . expand('<cword>')
        elseif coc#rpc#ready()
          call CocActionAsync('doHover')
        else
          execute '!' . &keywordprg . ' ' . expand('<cword>')
        endif
      endfunction
      nnoremap <silent> K :call ShowDocumentation()<CR>

      autocmd CursorHold * silent call CocActionAsync('highlight')
      autocmd FileType nix setlocal shiftwidth=2 tabstop=2 softtabstop=2
      autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4
    '';
  };

  home.file.".vim/undo/.keep".text = "";

  home.file.".vim/coc-settings.json".text = builtins.toJSON {
    "coc.preferences.formatOnSaveFiletypes" = [
      "json"
      "yaml"
    ];
    "diagnostic.virtualText" = true;
    "diagnostic.virtualTextCurrentLineOnly" = false;
    "suggest.noselect" = true;
    "suggest.enablePreselect" = false;
    "python.analysis.typeCheckingMode" = "basic";
  };
}
