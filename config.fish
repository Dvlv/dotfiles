begin
    set --local AUTOJUMP_PATH $HOME/.autojump/share/autojump/autojump.fish
    if test -e $AUTOJUMP_PATH
        source $AUTOJUMP_PATH
    end
end

. /home/Dvlv/Stuff/easy-git/fish_completion
# /bin/bash /home/Dvlv/bin/ssh_config

set PATH /home/Dvlv/bin $PATH
# set PATH /home/Dvlv/Downloads/nsq-1.0.0-compat.linux-amd64.go1.8/bin $PATH

set -x GOPATH /home/Dvlv/go

function sourceeg
    set PATH /home/Dvlv/bin $PATH
    set PATH /usr/local/go/bin $PATH
end

funcsave sourceeg

function addtopath
    set CWD (pwd)
    set PATH CWD $PATH
end

funcsave addtopath

function back
    for x in (seq $argv)
        cd ..
    end
end

funcsave back

function cd
    if test -d ./env
        deactivate
    end

    builtin cd $argv;

    if test -d ./env
        source env/bin/activate.fish
    end
end

function fish_greeting
end 

funcsave fish_greeting

alias sl='ls'

status --is-interactive; and source (pyenv init -|psub)


