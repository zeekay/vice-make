func! vice#make#neomake#enable()
    call vice#Extend({
        \ 'addons': [
            \ 'github:benekastah/neomake',
        \ ]
    \ })

    let g:neomake_go_gobuild_maker = {
        \ 'exe': 'sh',
        \ 'args': ['-c', 'go build -o /dev/null ./\$0', '%:h'],
        \ 'errorformat':
            \ '%W%f:%l: warning: %m,' .
            \ '%E%f:%l:%c:%m,' .
            \ '%E%f:%l:%m,' .
            \ '%C%\s%\+%m,' .
            \ '%-G#%.%#'
    \ }

    let g:neomake_go_enabled_makers = ['gobuild']
    let g:neomake_open_list = 2
    let g:neomake_list_height = 10
    let g:neomake_verbose = 0
    let g:neomake_airline = 0

    autocmd! BufWritePost * Neomake
endf
