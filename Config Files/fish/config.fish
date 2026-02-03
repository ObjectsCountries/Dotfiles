if status is-interactive
    starship init fish | source
    fzf --fish | source
    tree-sitter complete --shell=fish | source
    # openclaw completion --shell fish | source
    alias eza='eza -l --color=always --icons=always --hyperlink -a --group-directories-first --git --total-size --no-user --no-time'
end
