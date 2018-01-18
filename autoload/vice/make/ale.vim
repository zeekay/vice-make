func! vice#make#ale#enable()
    call vice#Extend({
        \ 'addons': [
            \ 'github:w0rp/ale',
            \ 'github:maximbaz/lightline-ale',
        \ ]
    \ })

    let g:ale_linters = {'go': ['gofmt', 'goimports', 'go build', 'go vet', 'staticcheck']}

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
