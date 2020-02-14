let g:jedi#goto_definitions_command = "<C-t>"

let g:ale_lint_on_insert_leave=1
let g:ale_fixers = ["black"]
let g:ale_fix_on_save=1
let g:ale_virtualenv_dir_names = ["env"]
let g:ale_python_pylint_options = "--init-hook='import sys; sys.path.append(\".\")'"


