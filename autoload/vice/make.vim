func! vice#make#quit()
    let g:vice.make.quitting = 1
endf

func! vice#make#quitting()
    return exists('g:vice.make.quitting')
endf

func! vice#make#find_jshintrc()
    let jshintrc = findfile('.jshintrc', '.;')

    if jshintrc == ""
        let g:syntastic_javascript_jshint_args = g:vice.make.jshint_args
    else
        let g:syntastic_javascript_jshint_args = '--config '.jshintrc
    endif
endf
