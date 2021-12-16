call plug#begin('~/.vim/plugged')

" To work better with tmux, but i don't remember why
Plug 'https://github.com/wincent/terminus'

" IDEditor like features
Plug 'neovim/nvim-lspconfig'
Plug 'preservim/nerdtree' " Filesystem tree
Plug 'junegunn/fzf' " Fuzzy file finder like <C-p> in VsCode
Plug 'lervag/vimtex' " Tex code completer, probably want to switch to coc-vimtex
Plug 'preservim/nerdcommenter' " Toggle comment
Plug 'cespare/vim-toml'
Plug 'udalov/kotlin-vim' " to help nvim-lsp with kotlin
Plug 'folke/lsp-colors.nvim', {'branch': 'main'}

Plug 'mhartington/formatter.nvim'
" Auto completion plugin
Plug 'hrsh7th/cmp-nvim-lsp', {'branch': 'main'}
Plug 'hrsh7th/cmp-buffer', {'branch': 'main'}
Plug 'hrsh7th/nvim-cmp', {'branch': 'main'}
Plug 'onsails/lspkind-nvim'

" Vsnip and cmp integration
Plug 'hrsh7th/cmp-vsnip', {'branch': 'main'}
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" Better code highlighter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Themes and style
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'juanedi/predawn.vim'
Plug 'mhartington/oceanic-next'
Plug 'arcticicestudio/nord-vim'
Plug 'rakr/vim-one'
Plug 'crusoexia/vim-monokai'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'sainnhe/sonokai'
Plug 'tomasiser/vim-code-dark'
" Darcula :'(
"Plug 'blueshirts/darcula'
Plug 'doums/darcula'
Plug 'ryanoasis/vim-devicons'

Plug 'lukas-reineke/indent-blankline.nvim'

" Status line
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" Git integration
Plug 'tpope/vim-fugitive'

" Syntax highlighter
Plug 'posva/vim-vue' " Vue syntax integration
Plug 'HerringtonDarkholme/yats.vim' " TS syntax highlight
Plug 'evanleck/vim-svelte', {'branch': 'main'} " Svelte syntax highlight
Plug 'tikhomirov/vim-glsl'

" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()

" Terminus setup -- Better terminal support
set runtimepath+=~/.vim/bundle/terminus/plugin/terminus.vim

" NERDCommenter vue fix
let g:ft = ''
function! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      endif
    endif
  endif
endfunction
function! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    let g:ft = ''
  endif
endfunction

" Setting up vimtex
let g:tex_flavor='latex'
let g:vimtex_compiler_latexmk = {
    \ 'build_dir' : '',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'hooks' : [],
    \ 'options' : [
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}

" svelte postprocess
let g:svelte_preprocessor_tags = [
  \ { 'name': 'ts', 'tag': 'script', 'as': 'typescript' }
  \ ]
let g:svelte_preprocessors = ['typescript', 'ts']
