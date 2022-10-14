" my filetype file
if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    au! BufRead,BufNewFile *.conf       setfiletype sh
    au! BufRead,BufNewFile *.bean       setfiletype beancount
augroup END
