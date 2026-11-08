if status is-interactive
        source ~/.config/fish/aliases.fish

        set fish_greeting
        set -U fish_color_command 88C0D0

        fish_vi_key_bindings

        bind -M visual ctrl-r history-pager
        bind -M normal ctrl-r history-pager        
        bind -M insert ctrl-r history-pager

        set -gx LANG en_US.UTF-8
        set -gx LC_ALL en_US.UTF-8
        set -gx LC_CTYPE en_US.UTF-8

        set -gx DOTNET_CLI_TELEMETRY_OPTOUT 1
        set -gx EDITOR /usr/bin/nvim
        set -gx FZF_DEFAULT_COMMAND fd
        set -gx FZF_DISABLE_KEYBINDINGS 1

        set -g __fish_git_prompt_showdirtystate 1

        if type -q setxkbmap; and set -q DISPLAY
            setxkbmap -option caps:swapescape
        end
end
