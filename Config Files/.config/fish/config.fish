if status is-interactive
    starship init fish | source
    alias eza='eza -l --color=always --icons=always --hyperlink -a --group-directories-first --git --total-size --no-user --no-time'
end
