local utils = require('config.utils')
local autocmd = utils.autocmd


autocmd('limit_highlight', [[ BufWinEnter * if line2byte(line("$") + 1) > 100000 | syntax clear | endif ]], true)


autocmd('indent_settings', {
  [[FileType python,htmldjango setl sw=4 sts=4 et]],
  [[FileType go setl sw=4 sts=4 et]],
  [[FileType css,scss setl sw=2 sts=2 et]],
  [[FileType js,javascript,ts,typescript,tsx setl sw=2 sts=2 et]],
  [[FileType html setl sw=2 sts=2 et]],
}, true)

