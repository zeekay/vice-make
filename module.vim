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

let g:vice.make.jshint_args = '--config '.g:vice.addon_dir.'/jshint.json'

" Use neomake with neovim
if has('nvim')
    call vice#make#neomake#enable()
else
    call vice#make#syntastic#enable()
endif

" Find local jshintrc automatically
au BufEnter coffee,javascript call vice#make#find_jshintrc()

" Prevent quickfix from popping up on wq and blocking exit
au WinEnter * if &buftype ==# 'quickfix' && winnr('$') == 1 | quit | endif

if v:version > 703 || (v:version == 703 && has('patch544'))
    au QuitPre * call vice#make#quit()
endif
