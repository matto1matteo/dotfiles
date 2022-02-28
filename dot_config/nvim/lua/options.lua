vim.cmd [[

syntax enable

" coc related
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
"set nobackup
"set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
"set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

]]
vim.opt.errorbells = false
vim.opt.number = true
vim.opt.showcmd = true
vim.opt.cursorline = true

-- Default editor style
-- vim.opt.t_Co=256
vim.opt.laststatus = 2
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.expandtab = true --  Tab width for tab and space
vim.opt.showmatch = true
vim.opt.relativenumber = true
-- vim.opt.colorcolumn = {80}
vim.opt.guicursor = ""
