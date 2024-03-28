if status is-interactive
        source ~/.config/fish/aliases.fish

        set fish_greeting
        set -U fish_user_paths ~/.local/bin $fish_user_paths

        fish_vi_key_bindings
        starship init fish | source 

        set -U FZF_DISABLE_KEYBINDINGS 1
        set -U FZF_DEFAULT_COMMAND fd
        set -U DOTNET_ROOT ~/.dotnet
        set -U DOTNET_CLI_TELEMETRY_OPTOUT 1

        set PATH "$HOME/.cargo/bin/:$PATH"
        set PATH "$HOME/.dotnet:$HOME/.dotnet/tools:$PATH"
        set PATH "$HOME/.npm/bin/:$PATH"
end
