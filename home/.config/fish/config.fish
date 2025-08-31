if status is-interactive
        source ~/.config/fish/aliases.fish
        
        set -gx EDITOR /usr/bin/nvim

        set fish_greeting
        set -U fish_color_command 88C0D0
        set -U fish_user_paths ~/.local/bin $fish_user_paths

        fish_vi_key_bindings
        starship init fish | source 

        set -U FZF_DISABLE_KEYBINDINGS 1
        set -U FZF_DEFAULT_COMMAND fd
        set -U DOTNET_ROOT ~/.dotnet
        set -U DOTNET_CLI_TELEMETRY_OPTOUT 1
        set -U ANDROID_HOME ~/tools/android-sdk/

        set LC_ALL en_IN.UTF-8
        set LANG en_IN.UTF-8

        set PATH "$HOME/.cargo/bin/:$PATH"
        set PATH "$HOME/.dotnet:$HOME/.dotnet/tools:$PATH"
        set PATH "$HOME/.node/bin/:$PATH"
        set PATH "/usr/local/go/bin:$PATH"

        direnv hook fish | source
        set -g direnv_fish_mode eval_on_arrow
end
