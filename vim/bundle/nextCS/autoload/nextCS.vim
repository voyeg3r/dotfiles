" ============================================================================
" File:        nextCS.vim
" Description: vim color theme selector
" Maintainer:  Javier Lopez <m@javier.io>
" License:     WTFPL -- look it up.
" ============================================================================

function! nextCS#AvoidECN()
    if exists('g:colors_name')
        let result = index(g:colorSchemesDetected, g:colors_name)
        if result == -1
            let g:colorSchemesDetected = remove(g:colorSchemesDetected, i)
        endif
    else
        if exists('g:current')
            let g:current += 1
        else
            let g:current = -1
        endif
    endif
endfunction

function! nextCS#GetCS() "getColorSheme
    "this search in the color directories for *.vim files and add them to colorSchemesDetected
    "let g:colorSchemesDetected = map(split(globpath(&runtimepath, "colors/*.vim", "\n")), 'fnamemodify(v:val, ":t:r")')
    let g:colorSchemesDetected = map(split(globpath(&runtimepath, g:nextcs_dir . "*.vim")), 'fnamemodify(v:val, ":t:r")')

    if empty(g:colorSchemesDetected)
        echo 'nextCS: you do not have any color file at $runtimepath/' . g:nextcs_dir
        return 1
    endif
    "echo g:colorSchemesDetected
    "sometimes g:colors_name and file names don't match
    call nextCS#AvoidECN() "avoidEvilColorNames

    let g:current = index(g:colorSchemesDetected, g:colors_name)
    let g:CSloaded = 1
endfunction

function! nextCS#Next()
    if (!exists('g:CSloaded'))
        if nextCS#GetCS() | return 1 | endif
    endif

    let g:current += 1

    if !(0 <= g:current && g:current < len(g:colorSchemesDetected))
       let g:current = (g:current == len(g:colorSchemesDetected) ? 0 : len(g:colorSchemesDetected)-1)
    endif
    try
        execute 'colorscheme' . " " . g:colorSchemesDetected[g:current]
    catch /E185:/
        call nextCS#AvoidECN() "avoidEvilColorNames
    endtry
    highlight clear SignColumn
    redraw!
    echo g:colorSchemesDetected[g:current]
endfunction

function! nextCS#Previous()
    if (!exists('g:CSloaded'))
        if nextCS#GetCS() | return 1 | endif
    endif

    let g:current -= 1

    if !(0 <= g:current && g:current < len(g:colorSchemesDetected))
       let g:current = (g:current == len(g:colorSchemesDetected) ? 0 : len(g:colorSchemesDetected)-1)
    endif
    try
        execute 'colorscheme' . " " . g:colorSchemesDetected[g:current]
    catch /E185:/
        call nextCS#AvoidECN() "avoidEvilColorNames
    endtry
    highlight clear SignColumn
    redraw!
    echo g:colorSchemesDetected[g:current]
endfunction
