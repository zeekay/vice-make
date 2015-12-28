func! vice#make#find_jshintrc()
    let jshintrc = findfile('.jshintrc', '.;')

    if jshintrc == ""
        let g:syntastic_javascript_jshint_args = g:vice.make.jshint_args
    else
        let g:syntastic_javascript_jshint_args = '--config '.jshintrc
    endif
endf
