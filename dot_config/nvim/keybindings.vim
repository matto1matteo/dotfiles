" Disable higlith after search by clicking <enter>
" Had to remap couse <CR> was already mapped to next line
nnoremap <CR> :noh<CR>

let mapleader=' '
let maplocalleader='_'

nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-p> :FZF<CR>

" Markdown remap
nmap <Leader>P <Plug>MarkdownPreview
nnoremap <silent> <leader>F :Format<CR>

" Tab remap
nnoremap tn :tabnew<CR>
nnoremap pt gT
nnoremap nt gt
