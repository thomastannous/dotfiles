alias swp2='mvn clean package -DskipTests=true embedded-glassfish:run'
alias ydl="youtube-dl -x -o '%(title)s.%(ext)s'" 
alias vi="vim"
alias pac="sudo pacman -S"
alias gitls="git log --pretty=format:'%C(yellow)%h%Cred%d\ %Creset%s%Cblue\ [%cn]' --decorate"
alias gittree="git log --graph --oneline --decorate --all"

#git aliases
alias gs="git status"
alias gd="git diff"
alias gdh="git diff HEAD"
alias gc="git clone $1 $2"
alias gcm="git commit -m "$1""
alias gaa="git add -A ."
alias gpo="git push origin $1"
alias gpu="git pull origin "$1""
