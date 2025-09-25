if status is-interactive
    starship init fish | source
    alias eza='eza -l --color=always --icons=always --hyperlink -a --group-directories-first --git --total-size --no-user --no-time'
    set -gx EDITOR nvim
    fish_add_path $HOME/.cargo/bin
    fzf --fish | source
end
