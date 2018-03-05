func! vice#make#neomake#enable()
    call vice#Extend({
        \ 'addons': [
            \ 'github:benekastah/neomake',
        \ ]
    \ })

    let g:neomake_go_gofmt_maker = {
        \ 'exe': 'gofmt',
        \ 'args': ['-l'],
        \ 'errorformat':
            \ '%f:%l:%c: %m,' .
            \ '%-G%.%#'
    \ }

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

    let g:neomake_go_enabled_makers         = ['gofmt', 'gobuild']
    let g:neomake_javascript_enabled_makers = ['jshint']
    let g:neomake_python_enabled_makers     = ['flake8']
    let g:neomake_javascript_jshint_maker = {
        \ 'args': [
            \ '--verbose',
            \ '--config',
            \ g:vice.make.jshintrc
        \ ],
        \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
    \ }

    let g:neomake_open_list   = 2
    let g:neomake_list_height = 5
    let g:neomake_verbose     = 0
    let g:neomake_airline     = 0

    let g:neomake_error_sign = {
        \ 'text':   '!',
        \ 'texthl': 'Text',
    \ }
    let g:neomake_warning_sign = {
        \ 'text':   '.',
        \ 'texthl': 'Text',
    \ }

    autocmd! BufWritePost * Neomake
    autocmd BufWinEnter,CursorHold * call vice#make#neomake#statusline()
    command Errors lopen
endf

func! vice#make#neomake#statusline()
    if !exists('lightline#update')
        return
    endif

    if neomake#statusline#LoclistStatus() != ""
        call lightline#update()
    endif
endf
