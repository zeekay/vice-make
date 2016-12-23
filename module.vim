call vice#Extend({
    \ 'addons': [
        \ 'github:zeekay/QuickFixCurrentNumber',
    \ ]
\ })

" Defaults
if !exists('g:vice.make')
    let g:vice.make = {}
endif

if !exists('g:vice.make.hooks')
    let g:vice.make.hooks = []
endif

if !exists('g:vice.make.jshintrc')
    let g:vice.make.jshintrc = g:vice.addon_dir.'/jshint.json'
endif

if !exists('g:vice.make.neomake_enabled')
    " Use neomake with neovim
    let g:vice.make.neomake_enabled = has('nvim')
endif

if vice.make.neomake_enabled
    call vice#make#neomake#enable()
else
    call vice#make#syntastic#enable()
endif

" Go
let g:go_fmt_fail_silently = 1
let g:go_fmt_command       = "gofmt"

" Find local jshintrc automatically
au BufEnter * call vice#make#find_jshintrc()

" Prevent quickfix from popping up on wq and blocking exit
au WinEnter * if &buftype ==# 'quickfix' && winnr('$') == 1 | quit | endif

if v:version > 703 || (v:version == 703 && has('patch544'))
    au QuitPre * call vice#make#quit()
endif
