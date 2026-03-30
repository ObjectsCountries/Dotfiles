#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# alias ls='ls --color=auto'
# alias grep='grep --color=auto'
# PS1='[\u@\h \W]\$ '
alias eza='eza -l --color=always --icons=always --hyperlink -a --group-directories-first --git --total-size --no-user --no-time'
eval "$(starship init bash)"