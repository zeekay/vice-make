func! vice#make#quit()
    let g:vice.make.quitting = 1
endf

func! vice#make#quitting()
    return exists('g:vice.make.quitting')
endf

func! vice#make#find_jshintrc()
    let jshintrc = findfile('.jshintrc', '.;')
    if jshintrc == ""
        let jshintrc = g:vice.make.jshintrc
    endif

    let g:syntastic_javascript_jshint_args = '--config '.jshintrc
    let g:neomake_javascript_jshint_maker = {
        \ 'args': [
            \ '--verbose',
            \ '--config',
            \ jshintrc
        \ ],
        \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
    \ }
endf
