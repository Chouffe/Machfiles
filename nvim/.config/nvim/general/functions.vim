" Remove trailing whitespace
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

function! ParinferToggle()
    if g:parinfer_enabled == 1
        echo "Disabing Parinfer"
        ParinferOff
    else
        echo "Enabling Parinfer"
        ParinferOn
    endif
endfunction


" Color the colorcolumn
function! ColorColumn()
    if empty(&colorcolumn)
        if empty(&textwidth)
            echo "colorcolumn=80"
            setlocal colorcolumn=80
        else
            echo "colorcolumn=+1 (" . (&textwidth + 1) . ")"
            setlocal colorcolumn=+1
        endif
    else
        echo "colorcolumn="
        setlocal colorcolumn=
    endif
endfunction


" Deletes the current buffer
function! BufferDelete()
    if &modified
        echohl ErrorMsg
        echomsg "No write since last change. Not closing buffer."
        echohl NONE
    else
        let s:total_nr_buffers = len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))

        if s:total_nr_buffers == 1
            bdelete
            echo "Buffer deleted. Created new buffer."
        else
            bprevious
            bdelete #
            echo "Buffer deleted."
        endif
    endif
endfunction

" Clojure Settings
function! ClojureSettings()
  nmap <silent><buffer> << <Plug>(sexp_capture_prev_element)
  nmap <silent><buffer> >> <Plug>(sexp_capture_next_element)
  autocmd BufEnter *.cljs setlocal iskeyword+=?,-,*,!,+,/,=,<,>,.,:
endfunction
