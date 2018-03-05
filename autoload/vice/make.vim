func! vice#make#quit()
    let g:vice.make.quitting = 1
endf

func! vice#make#quitting()
    return exists('g:vice.make.quitting')
endf

func! vice#make#find_jshintrc()
    let jshintrc = findfile('.jshintrc', '.;')
    if jshintrc == ""
        let jshintrc = g:vice.addon_dir.'/jshint.json'
    endif
    return jshintrc
endf
