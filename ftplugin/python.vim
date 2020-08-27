autocmd VimEnter * call MaybeSem()
autocmd InsertLeave * call MaybeSem()

set path+=web/admin/templates/,web/templates/,web/admin/static,web/static

" commenting
vmap <leader>c :norm I#<CR>
vmap <leader><leader>c :norm ^x<CR>
