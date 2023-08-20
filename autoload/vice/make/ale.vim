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

    let g:ale_sign_error = '⏵ '
    let g:ale_sign_warning = '- '

    " highlight clear ALEErrorSign
    " highlight clear ALEWarningSign

    let g:ale_linters = {
        \ 'go':         ['goimports', 'go build', 'go vet'],
        \ 'javascript': ['eslint', 'prettier', 'jscs'],
        \ 'python':     ['flake8'],
        \ 'typescript': ['tslint', 'tsserver', 'typecheck'],
        \ 'solidity':   ['solc'],
    \ }

    let g:ale_jshint_config_loc = g:vice.make.jshintrc
    let g:ale_python_flake8_args = '--ignore=E501,E241,E221'
    let g:ale_solidity_solc_options = '--allow-paths=. @luxdefi=../node_modules/@luxdefi @chainlink=../node_modules/@chainlink @openzeppelin=../node_modules/@openzeppelin'

    " call deoplete#custom#option('sources', {
    "     \ '_': ['ale'],
    " \})

    call vice#Extend({
        \ 'addons': [
            \ 'github:dense-analysis/ale',
        \ ]
    \ })
endf
