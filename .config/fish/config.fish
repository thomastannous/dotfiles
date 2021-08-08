if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_vi_key_bindings

set fish_greeting

starship init fish | source

#git abbreviation

abbr gitls git log --pretty=format:'%C(yellow)%h%Cred%d\ %Creset%s%Cblue\ [%cn]' --decorate
abbr gittree git log --graph --oneline --decorate --all
abbr gs git status
abbr gd git diff
abbr gdh git diff HEAD
abbr gc git clone $1 $2
abbr gcm git commit -m "$1"
abbr gaa git add -A .
abbr gpo git push origin $1
abbr gpu git pull origin "$1"
abbr vim nvim
abbr chrome google-chrome-stable
abbr vimconf nvim ~/.config/nvim/init.vim
abbr rr ./run.sh # run

# tmux 

abbr ta 'tmux attach -t'
abbr tad 'tmux attach -d -t'
abbr ts 'tmux new-session -s'
abbr tl 'tmux list-sessions'
abbr tksv 'tmux kill-server'
abbr tkss 'tmux kill-session -t'

abbr pino 'z pino && tmux new-session -s pino'

set -x TERMINAL /usr/bin/alacritty

set -x CXX /usr/bin/clang++
set -x CC /usr/bin/clang
