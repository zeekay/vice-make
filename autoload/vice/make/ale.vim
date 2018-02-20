func! vice#make#ale#enable()
    let g:ale_history_enabled         = 1
    let g:ale_history_log_output      = 1
    let g:ale_max_buffer_history_size = 1
    let g:ale_lint_on_insert_leave    = 0
    let g:ale_lint_on_text_changed    = 0
    let g:ale_lint_on_save            = 1
    let g:ale_open_list               = 'on_save'
    let g:ale_set_quickfix            = 1
    let g:ale_set_signs               = 1

    let g:ale_linters = {
        \ 'go': ['gofmt', 'goimports', 'go build', 'go vet', 'staticcheck'],
        \ 'python': ['flake8'],
    \ }

    let g:ale_python_flake8_args = '--ignore=E501,E221'

    call vice#Extend({
        \ 'addons': [
            \ 'github:w0rp/ale',
            \ 'github:maximbaz/lightline-ale',
        \ ]
    \ })

    if !exists('g:lightline')
        let g:lightline = {}
    endif

    let g:lightline.component_expand = {
        \ 'linter_warnings': 'lightline#ale#warnings',
        \ 'linter_errors': 'lightline#ale#errors',
        \ 'linter_ok': 'lightline#ale#ok',
    \ }
    let g:lightline.component_type = {
        \ 'linter_warnings': 'warning',
        \ 'linter_errors': 'error',
    \ }
    let g:lightline.active = { 'right': [[ 'linter_errors', 'linter_warnings', 'linter_ok' ]] }
endf
