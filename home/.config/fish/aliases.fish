#/usr/bin/fish

alias c=clear
alias cls=clear

alias l='exa -l'
alias la='exa -Ah'
alias ll='exa -la'
alias ls='exa'

alias ccc='curl ip-api.com'
alias leet='pushd ~/code/leetcode && vim vimconfig && popd'
alias nau='thunar'
alias tlmgr='/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode'
alias touchenv='echo ". .venv/bin/activate.fish" > .env'

alias vim=nvim
alias vimg='vim +G'
alias webp2gif='magick mogrify -format gif *.webp && rm *.webp'

alias tt=tmux

function ff
    cd $(FZF_DEFAULT_COMMAND='fd -td' fzf)
end

function yy
    if command -v apt >/dev/null 2>&1
        sudo apt update -y
        sudo apt list --upgradable
        sudo apt upgrade -y
    else if command -v pacman >/dev/null 2>&1
        sudo pacman -Syu --noconfirm
    else
        return 1
    end
end

