# ~/.bash_profile

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Setup our PATH
export PATH=$PATH:\
$HOME/scripts:\
$HOME/gopath/bin:\
/opt/devkitpro/devkitPPC/bin:\
/opt/vitasdk/bin:\
$HOME/.cargo/bin:\

# Options for various programs
export EDITOR=vim
export VISUAL=vim
export STEAM_RUNTIME=0
export WIILOAD="tcp:10.200.200.5"

export GOROOT="/usr/lib/go"
export GOPATH="$HOME/projects/gopath"
export VAGRANT_HOME="/data/.vagrant.d"
export WINEPREFIX="/data/wine/flstudio"

export DEVKITPRO="/opt/devkitpro"
export DEVKITPPC="${DEVKITPRO}/devkitPPC"
export DEVKITARM="${DEVKITPRO}/devkitARM"
export VITASDK="/opt/vitasdk"
