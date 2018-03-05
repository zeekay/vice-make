" Defaults
if !exists('g:vice.make')
    let g:vice.make = {}
endif

if !exists('g:vice.make.hooks')
    let g:vice.make.hooks = []
endif

if !exists('g:vice.make.jshintrc')
    let g:vice.make.jshintrc = vice#make#find_jshintrc()
endif

if exists('g:vice.make.plugin')
    exe 'call vice#make#'.g:vice.make.plugin.'#enable()'
else
    if v:version >= 800
        call vice#make#ale#enable()
    else
        call vice#make#syntastic#enable()
    endif
endif

" Go
let g:go_fmt_fail_silently = 1
let g:go_fmt_command       = "gofmt"

" Prevent quickfix from popping up on wq and blocking exit
au WinEnter * if &buftype ==# 'quickfix' && winnr('$') == 1 | quit | endif

if v:version > 703 || (v:version == 703 && has('patch544'))
    au QuitPre * call vice#make#quit()
endif
