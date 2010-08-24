_fab_completion() {
    COMPREPLY=()

    # Fab in the path?
    /usr/bin/which -s fab || return 0

    # Fabfile in this folder?
    [[ -e fabfile.py ]] || return 0

    local cur="${COMP_WORDS[COMP_CWORD]}"

    tasks=$(fab --list | sed -e '/^[^ ]/d' | awk '{print $1}')
    COMPREPLY=( $(compgen -W "${tasks}" -- ${cur}) )
}

complete -F _fab_completion fab