if status is-interactive
        # fish
        set fish_greeting
        source ~/.config/fish/aliases.fish
        set -U fish_user_paths ~/.local/bin $fish_user_paths

        # starship
        starship init fish | source

        # fzf
        set -U FZF_DISABLE_KEYBINDINGS 1
        set -U FZF_DEFAULT_COMMAND fd
        set -U DOTNET_ROOT ~/.dotnet

        # PATH
        set PATH "$HOME/.cargo/bin/:$PATH"
        set PATH "$HOME/.dotnet:$HOME/.dotnet/tools:$PATH"
        set PATH "$HOME/.yarn/bin/:$PATH"
end
