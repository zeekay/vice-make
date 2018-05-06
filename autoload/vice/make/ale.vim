func! vice#make#ale#enable()
    let g:ale_history_enabled         = 0
    let g:ale_history_log_output      = 0
    let g:ale_max_buffer_history_size = 1
    let g:ale_lint_on_insert_leave    = 0
    let g:ale_lint_on_text_changed    = 0
    let g:ale_lint_on_save            = 1
    let g:ale_open_list               = 'on_save'
    let g:ale_set_loclist             = 0
    let g:ale_set_quickfix            = 1
    let g:ale_set_signs               = 1
    let g:ale_keep_list_window_open   = 0
    let g:ale_fix_on_save             = 1
    let g:ale_completion_enabled      = 0

    let g:ale_sign_error = '>>'
    let g:ale_sign_warning = '--'

    " highlight clear ALEErrorSign
    " highlight clear ALEWarningSign

    let g:ale_linters = {
        \ 'go':         ['gofmt', 'goimports', 'go build', 'go vet', 'staticcheck'],
        \ 'javascript': ['eslint', 'prettier', 'jscs'],
        \ 'python':     ['flake8'],
        \ 'typescript': ['tslint', 'tsserver', 'typecheck'],
    \ }

    let g:ale_python_flake8_args = '--ignore=E501,E241,E221'
    let g:ale_jshint_config_loc = g:vice.make.jshintrc

    call vice#Extend({
        \ 'addons': [
            \ 'github:w0rp/ale',
            \ 'github:maximbaz/lightline-ale',
        \ ]
    \ })
endf
