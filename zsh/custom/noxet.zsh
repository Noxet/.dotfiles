alias l='ls -hFG'
alias ll='ls -lhFG'
alias la='ls -lahFG'

alias vi='nvim'

alias myip="curl http://ipecho.net/plain; echo"

source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

alias setup-fslc='source /opt/fslc-xwayland/3.3/environment-setup-cortexa53-crypto-fslc-linux; export LDFLAGS='

# check length of video in seconds
checktime()
{
  ffprobe -i $1 -show_entries format=duration -v quiet -of csv="p=0"  
}


# Set paths for Splint (C linter)
export LARCH_PATH=/home/exensor/Downloads/splint-3.1.1/lib
export LCLIMPORTDIR=/home/exensor/Downloads/splint-3.1.1/imports
export PATH=$PATH:/home/exensor/Downloads/splint-3.1.1/bin
