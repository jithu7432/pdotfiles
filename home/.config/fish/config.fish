if status is-interactive
        source ~/.config/fish/aliases.fish

        set fish_greeting
        set -U fish_color_command 88C0D0

        fish_vi_key_bindings
        bind -M visual ctrl-r history-pager
        bind -M normal ctrl-r history-pager        
        bind -M insert ctrl-r history-pager


        set -gx fish_user_paths ~/.local/bin $fish_user_paths
        set -gx ANDROID_HOME ~/tools/android-sdk/
        set -gx DOTNET_CLI_TELEMETRY_OPTOUT 1
        set -gx DOTNET_ROOT ~/.dotnet
        set -gx EDITOR /usr/bin/nvim
        set -gx FZF_DEFAULT_COMMAND fd
        set -gx FZF_DISABLE_KEYBINDINGS 1
        set -gx LANG en_IN.UTF-8
        set -gx LC_ALL en_IN.UTF-8
        set -gx LC_CTYPE en_US.UTF-8

        set PATH "$HOME/.cargo/bin/:$PATH"
        set PATH "$HOME/.dotnet:$HOME/.dotnet/tools:$PATH"
        set PATH "$HOME/.node/bin/:$PATH"
        set PATH "$HOME/tools/roslyn/:$PATH"
        set PATH "$HOME/tools/nodejs/bin/:$PATH"
        set PATH "/usr/local/go/bin:$PATH"

        if test -e direnv
            direnv hook fish | source
            set -g direnv_fish_mode eval_on_arrow
        end
        if set -q DISPLAY
            setxkbmap -option caps:swapescape
        end
end
