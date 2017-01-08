
### Convertendo de html para markdown

     cat file.html | pandoc --from=html --to=markdown

#### no vim você pode usar:

     :%!pandoc --from=html --to=markdown | pandoc --from=markdown --to=html

             nnoremap <leader>gq :%!pandoc -f html -t markdown \| pandoc -f markdown -t html<CR>
             vnoremap <leader>gq :%!pandoc -f html -t markdown \| pandoc -f markdown -t html<CR>

     :let &formatprg="pandoc -f html -t markdown \| pandoc -f markdown -t html"

    Using the above option you cand do gqap

    if has("autocmd")
        let pandoc_pipeline = "pandoc --from=html --to=markdown"
        let pandoc_pipeline .= " | pandoc --from=markdown --to=html"
        autocmd Filetype html let &formatprg=pandoc_pipeline
    endif

