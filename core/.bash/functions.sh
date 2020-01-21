# see https://stackoverflow/com/a/13003854/170413
find_git_branch(){ local branch;
  if branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null); then
    if [[ "$branch" == "HEAD" ]]; then branch='detached*'; fi
    git_branch="[$branch]"
    else git_branch=""; fi; }
find_git_dirty(){ local status=$(git status --porcelain 2>/dev/null)
  if [[ "$status" != "" ]]; then git_dirty="!";
  else git_dirty=""; fi; }

# Resolve Git information in PROMPT_COMMAND
PROMPT_COMMAND="find_git_branch; find_git_dirty; $PROMPT_COMMAND"

# Various helper functions
get_sha() { git rev-parse --short HEAD 2>/dev/null; }
foldersize(){ du -h -d1; }
who-uses(){ find ${1} -print0 | xargs -0 lsof -n; }
flushdocker(){ for i in $(docker ps -aq); do docker rm -f $i; done; }
readme(){ 2>/dev/null less -c README.*||return 1; }
kbuild(){ make -C /lib/modules/$(uname -r)/build M=${PWD} modules; }
kbuild-clean(){ make -C /lib/modules/$(uname -r)/build M=${PWD} clean; }
who-owns() { pacman -Ql | grep "${1}" | cut -d' ' -f1; }
capcard-loopback() { pacmd load-module module-loopback; }
hexadd(){ r=0;for n in "$@";do r=$(($r + $n));done;printf "0x%x\n" $r;}
hexsub(){ r=$1;shift;for n in "$@";do r=$(($r - $n));done;printf "0x%x\n" $r;}
ytdl-mp3(){ youtube-dl -x --audio-quality 0 --audio-format mp3 ${1};}

start(){ sudo systemctl start ${1}; }
status(){ systemctl status ${1}; }
stop(){ sudo systemctl stop ${1}; }

flstudio64(){ wine "${FLPATH}/FL64.exe"; }
flstudio32(){ wine "${FLPATH}/FL32.exe"; }
