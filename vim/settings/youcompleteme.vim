nnoremap gd :YcmCompleter GoTo<CR>

let g:ycm_confirm_extra_conf = 0
set completeopt-=preview
" let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_always_populate_location_list = 1
let g:ycm_enable_diagnostic_signs = 0

" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\.git$\|\.hg$\|\.svn\|\.git5_specs$\|review$',
"   \ 'file': '\.exe$\|\.so$\|\.dll$',
"   \ 'link': 'blaze-bin\|blaze-genfiles\|blaze-google3\|blaze-out\|blaze-testlogs\|READONLY$',
"   \ }
" " nnoremap <C-R> :CtrlP<CR>
" nnoremap ,. :CtrlPBuffer<CR>
" nnoremap ,/ :CtrlPTag<CR>

" Let YCM and UltiSnips work together.
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" let g:UltiSnipsSnippetDirectories  = ["snips"]
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction
au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
