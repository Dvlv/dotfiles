# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

# Added by Dvlv
alias nv=nvim

back() {
	num=$1
	for ((c=1; c<=num; c++))
	do
	   cd ..
	done
}


parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

toolbox_or_not() {
    HN=$(hostname)
    if [ $HN = "toolbox" ]
    then
	    echo "🧰\[\033[38;5;094m\]"
    else
	    echo 💻
    fi
}

export PS1="\[\033[1;37m\]<$(toolbox_or_not):\u|\[\033[32m\]\w\[\033[01;31m\]\$(parse_git_branch)\[\033[97m\]>\[\033[0m\] "
