norm=$(tput sgr0);     
red=$(tput setaf 1)
green=$(tput setaf 2); 
yellow=$(tput setaf 3)
blue=$(tput setaf 4);  
pink=$(tput setaf 5)
cyan=$(tput setaf 6);  
white=$(tput setaf 7)

txtrst="$(tput sgr 0 2>/dev/null || echo '\e[0m')"
txtblk="$(tput setaf 232 2>/dev/null || echo '\e[0;30m')" 
txtred="$(tput setaf 1 2>/dev/null || echo '\e[0;31m')" 
txtgrn="$(tput setaf 2 2>/dev/null || echo '\e[0;32m')" 
txtylw="$(tput setaf 3 2>/dev/null || echo '\e[0;33m')" 
txtblu="$(tput setaf 4 2>/dev/null || echo '\e[0;34m')" 
txtpur="$(tput setaf 5 2>/dev/null || echo '\e[0;35m')" 
txtcyn="$(tput setaf 6 2>/dev/null || echo '\e[0;36m')" 
txtwht="$(tput setaf 7 2>/dev/null || echo '\e[0;37m')" 

bldblk="$(tput setaf 0 2>/dev/null)$(tput bold 2>/dev/null || echo '\e[1;30m')" 
bldred="$(tput setaf 1 2>/dev/null)$(tput bold 2>/dev/null || echo '\e[1;31m')" 
bldgrn="$(tput setaf 2 2>/dev/null)$(tput bold 2>/dev/null || echo '\e[1;32m')" 
bldylw="$(tput setaf 3 2>/dev/null)$(tput bold 2>/dev/null || echo '\e[1;33m')" 
bldblu="$(tput setaf 4 2>/dev/null)$(tput bold 2>/dev/null || echo '\e[1;34m')" 
bldpur="$(tput setaf 5 2>/dev/null)$(tput bold 2>/dev/null || echo '\e[1;35m')" 
bldcyn="$(tput setaf 6 2>/dev/null)$(tput bold 2>/dev/null || echo '\e[1;36m')" 
bldwht="$(tput setaf 7 2>/dev/null)$(tput bold 2>/dev/null || echo '\e[1;37m')" 

undblk="$(tput setaf 0 2>/dev/null)$(tput smul 2>/dev/null || echo '\e[4;30m')" 
undred="$(tput setaf 1 2>/dev/null)$(tput smul 2>/dev/null || echo '\e[4;31m')" 
undgrn="$(tput setaf 2 2>/dev/null)$(tput smul 2>/dev/null || echo '\e[4;32m')" 
undylw="$(tput setaf 3 2>/dev/null)$(tput smul 2>/dev/null || echo '\e[4;33m')" 
undblu="$(tput setaf 4 2>/dev/null)$(tput smul 2>/dev/null || echo '\e[4;34m')" 
undpur="$(tput setaf 5 2>/dev/null)$(tput smul 2>/dev/null || echo '\e[4;35m')" 
undcyn="$(tput setaf 6 2>/dev/null)$(tput smul 2>/dev/null || echo '\e[4;36m')" 
undwht="$(tput setaf 7 2>/dev/null)$(tput smul 2>/dev/null || echo '\e[4;37m')" 
