autocmd VimEnter * call MaybeSem()
autocmd InsertLeave * call MaybeSem()

set path+=web/admin/templates/,web/templates/
