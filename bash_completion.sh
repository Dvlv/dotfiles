_eg() 
{
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts="new checkout origin merge revert unadd uncommit cm stat branch log"

    case "${prev}" in
    merge)
		local branches=$(git for-each-ref --format='%(refname:short)' refs/heads/)
		COMPREPLY=( $(compgen -W "${branches}" -- ${cur}) )
		;;
    checkout)
	    local branches=$(git for-each-ref --format='%(refname:short)' refs/heads/)
		COMPREPLY=( $(compgen -W "${branches}" -- ${cur}) )
		;;
    add)
		local files=$(ls)
		COMPREPLY=( $(compgen -W "${files}" -- ${cur}) )
		;;
    *)
                COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
		;;
    esac
}
complete -F _eg eg
