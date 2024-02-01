local o = vim.opt
local wo = vim.wo
local fn = vim.fn

vim.cmd("colorscheme catppuccin")
vim.cmd("set background=dark")
vim.cmd("au InsertEnter * set nornu")
vim.cmd("au InsertLeave * set rnu")

vim.cmd([[
  augroup fmt
    autocmd!
    autocmd BufWritePre * undojoin | Neoformat
  augroup END
]])

vim.g.blamer_enabled = true
o.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"
o.wrap = false
o.updatetime = 300
o.timeoutlen = 400
o.ttimeoutlen = 0
o.backup = false
o.swapfile = false
o.dir = fn.stdpath("data") .. "/swp"
o.undofile = false
o.undodir = fn.stdpath("data") .. "/undodir"
o.history = 500
o.clipboard = "unnamedplus"
o.fileencoding = "utf-8"
o.conceallevel = 0
o.number = true
o.relativenumber = true
o.cmdheight = 1
o.showmode = false
o.laststatus = 2
o.smartcase = true
o.smartindent = true
o.splitbelow = true
o.splitright = true
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 1
o.tabpagemax = 1
o.showtabline = 0
o.termguicolors = true
o.cursorline = true
o.scrolloff = 3
o.sidescrolloff = 5
o.hlsearch = true
o.ignorecase = true
o.foldenable = true
o.foldmethod = "syntax"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.listchars = "eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣"
o.shortmess = o.shortmess + "c"
wo.colorcolumn = "99999"
o.wildmode = "full"
o.lazyredraw = true
o.grepprg = "rg --hidden --vimgrep --smart-case --"
o.completeopt = { "menu", "menuone", "noselect", "noinsert" }
o.wildignorecase = true
o.wildignore = [[
.git,.hg,.svn
*.aux,*.out,*.toc
*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
*.mp3,*.oga,*.ogg,*.wav,*.flac
*.eot,*.otf,*.ttf,*.woff
*.doc,*.pdf,*.cbr,*.cbz
*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
*.swp,.lock,.DS_Store,._*
*/tmp/*,*.so,*.swp,*.zip,**/node_modules/**,**/target/**,**.terraform/**"
]]
