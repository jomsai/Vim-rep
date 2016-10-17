#!/bin/bash
#===============File .bashrc Intro===============#
#========Paths Exports in .bash_profile==========#
#==============Uncomment as needed===============#
#VISUAL=/opt/local/bin/vim; export VISUAL
#EDITOR=/opt/local/bin/vim; export EDITOR
#PAGER=/usr/bin/less; export PAGER
#SHELL=/usr/local/bin/bash

export CURL_CA_BUNDLE=~/.ssh/cacert.pem

export HISTFILESIZE=20000
export HISTSIZE=10000
export HISTCONTROL=erasedups:ignoredups:ignorespace
#export DISPLAY


#=!!!!!!=====Need more shopt dircolors here======#

#====My PS1 from Kirsle Online PS1 generator=====#
PS1="\[$(tput bold)\]\[$(tput setaf 3)\]\t\[$(tput setaf 2)\][\[$(tput setaf 4)\] \u \[$(tput setaf 1)\]]==> \[$(tput setaf 3)\]\h \[$(tput setaf 6)\] \W ]\[$(tput bold)\]\[$(tput setaf 2)\][ $?! ]\[$(tput setaf 4)\][[>\[$(tput setaf 1)\]\\$ \[$(tput sgr0)\]"

#====================Aliases=====================#
#======================ls========================#
#==Set ls then others should call same options===#
alias ls='ls -XhailcF --color=auto'
alias ll="ls -lv --group-directories-first"
alias lss='ls | less'  # ls+less
alias lsn='ls -n'  # UID PID instead of names
alias lsrev='ls -r'  #reverse alphabetical sort
alias lsize='ls -S'   #Sort by file size
alias lmod='ls -tlc'  # Sort by Mod Time, New 1st
alias lswc='ls | wc -l'  # This ls has many lines?
alias ld='ls -d */'   # only Dirs
alias l.='ls -dAFh .[^.]*'  # ls only Dotfiles
alias lst='ls -hFtal | grep $(date +%Y-%m-%d)' #ls Today

#======================cd========================#
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'

#==================Fixes for Sudo================#
# I prefer command | xargs sudo
# alias ll | sed "s/.*'\(.*\)'.*/\1/g" | xargs sudo
alias sudo='sudo '
alias sbb='sudo $(fc -ln -1)'  # sudo !! shortcut

#=============Linux & Dotfiles========#
alias apt3='sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y && echo "YYaawwwzzzaaa"'
alias sai="sudo apt-get install"
alias so='source ~/.bashrc && cp ~/.bashrc ~/.bashrc.bak && cp ~/.bashrc ~/Desktop/bashrc.txt && echo "Bashrc on the desktop"'
alias sovim='source ~/.vimrc && cp ~/.vimrc ~/.vimrc.bak && cp ~/.vimrc ~/Desktop/vimrc.txt && echo "Vimrc on the desktop"'

#===tmux Edit/Source/Backup/Split .tmux.conf=====#
alias etmux='vim ~/.tmux'
alias sotmux='source ~/.tmux.conf && cp ~/.tmux.conf ~/.tmux.conf.bak && cp ~/.tmux.conf ~/Desktop/tmuxconf.txt && echo "TMUX on the desktop"'
alias sotmux='tmux source-file ~/.tmux.conf && cp ~/.tmux.conf ~/.tmux.conf.bak && cp ~/.tmux.conf ~/Desktop/tmux.conf.txt'
alias tmuxv='tmux split-window -h -p 40'
alias tmuxh='tmux split-window -v -l 30'

#==========Edit bashrc & vimrc Dotfiles==========#
alias ebrc='vim ~/.bashrc'
alias evrc='vim ~/.vimrc'

#=======Environemental Variables=================#
alias env='printenv'
alias env2='export -p'
alias path='echo -e ${PATH//:/\\n}'  # executable Paths
#=============Environemental Variables shopt=====#
alias shoptvar='shopt -p' # ShowALL & u=OFF, s=ON status
alias shopton='shopt -s'    # Show all s=ON
alias shoptoff='shopt -u'   # Show all u=OFF
#=Bash Options=shopt -s=set -u=unset options=====#
# -p=ListALLOptions -q=EXIT0 if set 1 if not=====#
#= -o=List all SET env Options that are set on===#
#shopt -s cdspell  #small spell autocorrects
shopt -s cdable_vars  # cd ls assumes DIR where ls is
shopt -s checkhash   # ls (does exist? yes ok do it)
shopt -s checkwinsize   #update winsize if needed
#shopt -s sourcepath  #Already Default enabled
shopt -s no_empty_cmd_completion
shopt -s extglob   # Needed for programmable completion
#histappend --try to list long commands on 1 line
# Disable options: # No shell warn incoming mail
shopt -u mailwarn
unset MAILCHECK
#====history related shopt options
shopt -s cmdhist #Saves all of a long cmd in history
shopt -s histappend histreedit histverify
PROMPT_COMMAND='history -a'

#==============Archival & Packaging==============#
#=======Note: Also zipf & extract Functions======#

alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'

#==================Github Aliases================#
alias ga='git add -A'                       #ga:    Git add all files
alias gs='git status'                       #gs:    Git status
alias gc='git commit -m'                    #gc:    Git commit w/ message
alias gpu='git pull'                        #gpu:   Git pull
alias gp='git push'                         #gp:    Git push
alias gr='git revert HEAD'                  #gr:    Git revert HEAD
alias gd="git diff --color"					#gd:	Git diff in color
alias glog='git log'
#alias gt="git today --since='1 days agos'"	#gt:	Git last 24 hours
#alias gl="git log --pretty=format:'%h %ad | %s [%an]' --graph --since='30 days agos' --color"

# Git aliases from https://gist.github.com/ald890/9089169
#alias g="git"
#alias ga="git add ." same as alias ga='git add -A'
#alias g:rollback="git reset --hard HEAD~1"
#alias gb="git reset --soft HEAD~1"

#==================Networking====================#
alias pi='echo $(echo "scale=30; 4*a(1)" | bc -l)'
alias ping3='ping -c3 -s1 8.8.8.8'
alias fastping='ping -c 100 -s.2'
alias nface="ip -s link | grep 2: | cut -d ' ' -f2" #Linux
#alias nface="  netstat -r | grep default | awk '{print $8}'" #Linux
alias intip="ifconfig | grep Bcast | cut -c 21-34"
alias extip="curl icanhazip.com"
alias extip2="dig +short myip.opendns.com @resolver1.opendns.com"
alias routes='netstat -r'
alias tcp='netstat -anp tcp'
alias udp='netstat -anp udp'
alias ports="sudo lsof -i | grep LISTEN && netstat -an | grep LISTEN"  #ports: listen connections x2
alias listen='netstat -anp tcp | grep LISTEN'  # listen: All listen connections
alias sock='lsof -i'  #All open TCP/IP Sockets
alias loop='netstat -anp tcp | grep 127.0.0.1'  # Loopback interface tcp stats

#===================IPTables=====================#
##======shortcut  for iptables with sudo=========#
alias ipt='sudo /sbin/iptables'
 
# display all rules #
alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
alias firewall=iptlist

#===================VM Management================#
#====cpu#==64bit=or=32==Intel=vmx=AMD=svm=etc====#
alias cpuinfo='cat /proc/cpuinfo | grep --color -E "vmx|svm|lm"'
alias cpus='grep processor /proc/cpuinfo'
alias cpuspecs='head /proc/cpuinfo'
alias cpuram='free -m'
alias cpuswap='free -m'
alias vmsize='ls -Rh ~/VirtualBox\ VMs/ | grep .vdi'

#================Misc Aliases====================#
#==============Some safer Options================#
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias cp='cp -i'
alias mv='mv -i'
alias ln='ln -i'
alias rm='rm -I --preserve-root' #Interactive > 3 files & nada under /

#alias -- -="cd -" # Have no idea about this. Gotta know.
alias c='/usr/bin/clear'
alias diff='colordiff'
alias du='du -kh'
alias df='df -kTh'

alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias fhere="find . -name "
alias h='history'
alias j='jobs'
alias less='less -R --tabs=4' # colorful 'less', tab stops = 4
alias mkdir='mkdir -p -v'
alias mount='mount |column -t'
alias now='date +"%T"'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'
# bc format example -Remeber to install bc
alias pi='echo $(echo "scale=30; 4*a(1)" | bc -l)'
alias os='ip route'

alias sha1='openssl dgst -sha1 '
alias sha256='openssl dgst -sha256 '
alias sha512='openssl dgst -sha512 '

alias term_size='echo "Rows=$(tput lines) Cols=$(tput cols)"'
alias vi=vim
alias edit="$EDITOR"  # if not set then use vim in quotes

alias yt="youtube-dl $1 > ~/Downloads/$1"

#=============Functions & Scripts================#

cd() { builtin cd "$@" && ls; }   # cd then ls DIR

# No more cd ../../../
up() {
	local d=""
	limit=$1
	for ((i=1; i<=limit; i++))
		do
			d=$d/..
		done
	d=$(echo $d | sed 's/^\///')
	if [ -z "$d" ]; then
		d=..
	fi
	cd $d
}

# Make sure these commands are done via root
# I have an alias for this already sudo included
# Maybe other commands can use this
if [ $UID -ne 0 ]; then
	alias reboot='sudo reboot'
	alias update='sudo apt-get upgrade'
fi

zipf () { zip -r "$1".zip "$1" ; }  # zipf:Create a ZIP archive of a folder

# extract function for any Archive Compression Type
extract () {
	if [ -f $1 ] ; then
		case $1 in
			x
			*.tar.bz2)   tar xjf $1     ;;
			*.tar.gz)    tar xzf $1     ;;
			*.bz2)       bunzip2 $1     ;;
			*.rar)       unrar e $1     ;;
			*.gz)        gunzip $1      ;;
			*.tar)       tar xf $1      ;;
			*.tbz2)      tar xjf $1     ;;
			*.tgz)       tar xzf $1     ;;
			*.zip)       unzip $1       ;;
			*.Z)         uncompress $1  ;;
			*.7z)        7z x $1        ;;
			*)     	 echo "'$1' cannot be extracted via extract()" ;;
		esac
	else
						 echo "'$1' is not a valid file"
	fi
}

# Function to move to new DIR when created. cd - then toggles last 2 DIR
function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }
# function to print nunbers down the screen as per $1 e.g. count 6
function count(){ python -c "for num in xrange($1):print num";}

# Make your directories and files access rights sane. For EVAL.
#function sanitize() { chmod -R u=rwX,g=rX,o= "$@" ;}

#====================Message Center==============#
#== echo -e for ESC, \033 works > \e on MacOS====#
#== quoting () work but also generate error
echo -e "ALERT *\\*/ ${PURPLE}${WBG}MOTD${NC}"  #Message in Purple on Yellow
#Needs work==>  echo -e "${CYAN}${WBG}BASH Version ${which --version} - for $USER${NC}"
echo -e "MOTD \033[107;38;5;199m Fuhgettaboutit \033[33;48;5;52m Semper fi ${NC}"
echo -e "$GreenBrownBG Conf in 10 minutes NOT MANDATORY... Free Cookies! $NC"
echo -e "${BlackYellowBG} Welcome to a new day! ${NC}"
# tput SETAF style syntax for MOTD and quoting () work but also generate error
echo -e "${bldgrn}Green tput ${bldmag}MOTD${txtrst}"
echo "$bldgrn Help me I am out of Oreos! $txtrst"
echo "${bldmag} Party at the Boss House 7PM! ${txtrst}"
echo "${reverse} Reverse Current FGBG Text MOTD${txtrst}"

printf '\e[38;5;222;48;5;238m  Hi  \e[m\n'

# Server SHUTDOWN Message function using tput 6 or CYAN
gohome()
{
tput setaf 6; echo "The Server will SHUTDOWN in 15 minutes so SAVE and go home"
}

#Test Display for 256 COLOR display
print256colors()
{
printf '\e[48;5;%dm ' {0..255}; printf '\e[0m \n'
}

# This function echoes 8 COLORS & CODES to check your display
print8colors()
{
echo -e "\n\033[4;31mLight Colors\033[0m  \t\t\033[1;4;31mDark Colors\033[0m"
echo -e "\033[0;30;47m Black    \033[0m 0;30m \t\033[1;30;40m Dark Gray  \033[0m 1;30m"
echo -e "\033[0;31;47m Red      \033[0m 0;31m \t\033[1;31;40m Dark Red   \033[0m 1;31m"
echo -e "\033[0;32;47m Green    \033[0m 0;32m \t\033[1;32;40m Dark Green \033[0m 1;32m"
echo -e "\033[0;33;47m Brown    \033[0m 0;33m \t\033[1;33;40m Yellow     \033[0m 1;33m"
echo -e "\033[0;34;47m Blue     \033[0m 0;34m \t\033[1;34;40m Dark Blue  \033[0m 1;34m"
echo -e "\033[0;35;47m Magenta  \033[0m 0;35m \t\033[1;35;40m DarkMagenta\033[0m 1;35m"
echo -e "\033[0;36;47m Cyan     \033[0m 0;36m \t\033[1;36;40m Dark Cyan  \033[0m 1;36m"
echo -e "\033[0;37;47m LightGray\033[0m 0;37m \t\033[1;37;40m White      \033[0m 1;37m"
}

# 16 COLOR Function
print16colors()
{
for clbg in {40..47} {100..107} 49 ; do
	#Foreground
	for clfg in {30..37} {90..97} 39 ; do
		#Formatting
		for attr in 0 1 2 4 5 7 ; do
			#Print the result
			echo -en "\033[${attr};${clbg};${clfg}m ^[${attr};${clbg};${clfg}m \033[0m"
		done
		echo #Newline
	done
done
exit 0
}

# 256 COLOR function #2 
# color_256_function_for_loop_tput.sh   
print256colors2()
{
color()
{
	for c; do
		printf '\e[48;5;%dm%03d' $c $c
		done
		printf '\e[0m \n'
}

# 16 million COLOR Test Function that works
print16millcolors()
{
	fb=3;r=255;g=1;b=1;printf '\033[0;%s8;2;%s;%s;%sm▒▒▒ ' "$fb" "$r" "$g" "$b"
}

# OK 16 Million COLORS Ultimate system & display test
#does not work for me. A work in progress
#print16millcolors2()
##{
#	for r in {200..255..5}; do fb=4;g=1;b=1;printf '\033[0;%s8;2;%s;%s;%sm   ' "$fb" "$r" "$g" "$b"; done; echo	
#}

# Function to run upon exit of shell
function _exit()
{
	echo -e "${BOLDRED}Adios fools${NC}"
}
trap _exit EXIT

#================END Message Center==============#

#====Mac OS Only Aliases Functions & Scripts=====#

#VISUAL=/opt/local/bin/vim; export VISUAL
#EDITOR=/opt/local/bin/vim; export EDITOR
#PAGER=/usr/bin/less; export PAGER
#SHELL=/usr/local/bin/bash
#PATH=/opt/pkg/bin/vim:$PATH  #Where Vim 7.4 is
#PATH=/Library/Frameworks/Python.framework/Versions/3.5/bin/:$PATH   #Where Py3 is

#alias ls='ls -FGlAhpi'
#alias l.='\ls -d .* -G'  #dotfiles without ls opts above & MacOS
#alias l.l='ls -d .* -G'   #dotfiles with ls opts above & MacOS
#alias lss='ls -al | less'
#alias lst='ls -ailhGtc'  # Sort by time
#alias lg='ls -al | grep ' #just add a term to search for
#alias lsn='ls -n'  # UID and PID not names
#alias lsz-a='ls -r'  # Rev Alphabetcial Name listing
#alias lsa-z='ls -ctr'  # Sort Time but Rev Aplhabetical
#alias lswc='ls -al | wc -l'  # Items in DIR via ls with word count
#alias lsl='ls -lah@e -G | less'

#alias less='less -FSRXc'  # Preferred 'less' implementation??

#alias hd="tail -n 35 /var/log/daily.out | grep /dev/disk1 | awk {'print \$5'}" #Mac HD Avail Space
#alias j='jobs -l'

#==============MacOS Networking=================#
#alias p3='ping -c 3 -s 1'
#alias fastping='ping -c 100 -s.2'
#alias dnsping="scutil --dns | tail -n1 | cut -c 14-26" #MacOS Reachable or Not Reachable
#alias dnsping2='scutil -r ${intip} 8.8.8.8'  #MacOS Reachable or Not Reachable
#alias routes='netstat -r'
#alias tcp='netstat -anp tcp'
#alias udp='netstat -anp udp'
#alias ports="sudo lsof -i | grep LISTEN && netstat -an | grep LISTEN"  #ports: listen connections x2
#alias listen='netstat -anp tcp | grep LISTEN'  # listen: All listen connections
#alias sock='lsof -i'  #All open TCP/IP Sockets
#alias loop='netstat -anp tcp | grep 127.0.0.1'  # Loopback interface tcp stats
#alias nface="scutil --nwi | grep interfaces: | cut -c 21-23"  #LINUX  netstat -r | grep default | awk '{print $8}'
#alias intip="ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'"
#alias intips="ifconfig $nface | grep inet | cut -d ' ' -f2"  #inet4 & inet6 intIP
#alias extip="dig +short myip.opendns.com @resolver1.opendns.com"
#alias myip="curl icanhazip.com"  #site curl ip.appspot.com is unreliable 
#alias ipcfg="nface | xargs ipconfig getpacket"  #ARG before COMMAND with xargs


#alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"
#==============MacOS Firewall=================#
#alias rules='sudo pfctl -sa | less'

#alias path='echo -e ${PATH//:/\\n}'  # path: Echo all executable Paths
#alias psname="ps -o comm= -p $1"
#alias flushDNS='dscacheutil -flushcache' # flushDNS: Flush out the DNS Cache
#alias term_size='echo "Rows=$(tput lines) Cols=$(tput cols)"'
##alias tdump="sudo tcpdump $nface >> ~/Desktop/tdump.txt" # TCPDUMP Active interface
#alias tdump="sudo tcpdump -i${nface} -nnvXXSs 1514 -c2000 -w ~/Desktop/tdump2k.pcap"
#alias tdumpping="sudo tcpdump -nnvXXSs 1514 icmp -c200 -w ~/Desktop/tdumpping.pcap"
## tcpdump with 9 second timeout so no need for Ctrl-c Need Work
##alias tdump="sudo timeout 9 bash -c tcpdump $nface >> ~/Desktop/tdump.txt" # TCPDUMP Active interface
#alias yt="youtube-dl $1 > ~/Downloads/$1"
#alias spk='say "What the hell do you want from me"'
#alias so='source ~/.bash_profile && cp ~/.bash_profile ~/.bash_profile.bak && cp ~/.bash_profile ~/Vim-rep/dotfiles/bash_profile.txt'
## To Source my .vimrc works but exits 1 due to Vundle ERR so next requires || 
#alias sovim='source .vimrc || cp .vimrc .vimrc.bak && cp .vimrc ~/Vim-rep/dotfiles/VIMRC.txt'
#alias vimcp='cp .vimrc .vimrc.bak && cp .vimrc ~/Desktop/VIMRC.txt'
#alias sotmux='tmux source-file ~/.tmux.conf && cp ~/.tmux.conf ~/.tmux.conf.bak && cp ~/.tmux.conf ~/Vim-rep/dotfiles/tmux.conf.txt'
#alias tmux3='tmux && tmux split-window -v -l 30 && tmux split-window -h'
#alias chrome="open -a \"Google Chrome\""
#alias ax="chmod 700"  ## Make executable by me only
#alias cpwd='pwd|tr -d "\n"|pbcopy'
#alias flush="sudo killall -HUP mDNSResponder"
#alias cpu="iostat"

#alias spk='say "What the hell do you want from me"'
#alias bashv="/usr/local/bin/bash --version | grep darwin | cut -c 19-30"

#spotlight () { mdfind "kMDItemDisplayName == '$@'wc"; } #Mac spotlight metadata search
#ql () { qlmanage -p "$*" >& /dev/null; }  # Quicklook any file in Preview
#cd() { builtin cd "$@" && ls; }  # Works with my ls alias for same list everywhere

#    Hosts file info
#ii()
##{
#	echo -e "\n${BlackYellowBG}You are logged on ${USER}${GREEN}" ; dig | tail -n 4
#	printf "${CYAN}ACTIVE Interface on my Mac==> " ; nface
#	printf "Public facing IP Address ==> " ; extip
#	printf "IP Reachable or not? ==> " ; scutil -r ${intip} 8.8.8.8
#	printf "My Internal IP==> " ; ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'
#	echo -e "\n${GreenBrownBG}Additionnal information:" ; uname -a | xargs -n 7
#	echo -e "\n${PURPLE}Users logged on:" ; w
#	echo -e "\n${BROWN}Machine stats :" ; uptime
#	echo -e "\n${GREEN}CPU Stats: " ; iostat
#	echo -e "\n${CYAN}Disk Usage:" ; df -h
#	printf "\n${GreenBrownBG}DNS Configuration:" ; scutil --dns | head -n 12
#	printf "${CYAN}Current date : $NC" ; date
#	echo
#}

#
# Type psman <cmd> and Opens Man Page in Preview.app
#psman()
##{
#man -t "${1}" | open -f -a /Applications/Preview.app/
#}


#===========Color Variables & Settings===========#
#=>osxdaily.com/2012/02/21/add-color-to-the-terminal-in-mac-os-x/
# 2 Color choices to Terminal NOW it works great!
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export TERM="xterm-color"
export TERM="xterm-256color"

# Simple Color Settings
BLACK='\033[0;30m'  #0;30=Lt,1;32=Dk
RED='\033[0;31m'  #0;31=Lt,1;31=Dk
GREEN='\033[0;32m' #0;32=Lt,1;32=Dk '\033[1;32m'
BROWN='\033[0;33m'  #0;33=Brown,1;33=Bright YELLOW
BLUE='\033[0;34m'  #0;34=Lt,1;34=Dk
PURPLE='\033[0;35m'  #0;35=Lt,1;35=Dk
CYAN='\033[0;36m'  #0;36=Lt,1;36=Dk
WHITE='\033[1;37m'  #0;37=Lt Gray but 1:37=White

# Some BOLD Color Settings
BOLDBLACK='\033[1;30m'  #0;30=Lt,1;32=Dk
BOLDRED='\033[1;31m'  #0;31=Lt,1;31=Dk
BOLDGREEN='\033[1;32m' #0;32=Lt,1;32=Dk '\033[1;32m'
BOLDYELLOW='\033[1;33m'  #0;33=Brown,1;33=Bright YELLOW
BOLDBLUE='\033[1;34m'  #0;34=Lt,1;34=Dk
BOLDPURPLE='\033[1;35m'  #0;35=Lt,1;35=Dk
BOLDCYAN='\033[1;36m'  #0;36=Lt,1;36=Dk

# Simple Color Backgrounds
BlackBG='\033[40m'
RBG='\033[41m'
GBG='\033[42m'
YBG='\033[43m'
BlueBG='\033[44m'
PBG='\033[45m'
CBG='\033[46m'
WBG='\033[47m'

# Mixed Colors(8 and 256) -BOLD element1 Easy to REV FGBG change 1 to 7
WhiteGrayBG='\033[1;47;88m'
GreenBrownBG='\033[1;100;92m'
BlackYellowBG='\033[1;103;30m' 
CyanGrayBG='\033[1;107;36m'
BlackGreenBG='\033[1;102;30m'
YellowMaroonBG='\033[1;88;226m'  # Yellow Text MaroonBG 256 Colors
NC="\033[0m"  # NO COLOR RESET back to Default
BLINK='\033[5;32;47m'  #Blinking GreenFG on GrayBG

# LESS man page colors (makes Man pages more readable).
export LESS_TERMCAP_mb=$'\033[01;31m'
export LESS_TERMCAP_md=$'\033[01;31m'
export LESS_TERMCAP_me=$'\033[0m'
export LESS_TERMCAP_se=$'\033[0m'
export LESS_TERMCAP_so=$'\033[01;44;33m'
export LESS_TERMCAP_ue=$'\033[0m'
export LESS_TERMCAP_us=$'\033[01;32m'

# tput SETAF Text 8 color variables
txtund=$(tput sgr 0 1)  # Underline
txtbld=$(tput bold)   # Bold
bldred=${txtbld}$(tput setaf 1) #  red
bldgrn=${txtbld}$(tput setaf 2) #  green
bldyel=${txtbld}$(tput setaf 3) #  yellow
bldblu=${txtbld}$(tput setaf 4) #  blue
bldmag=${txtbld}$(tput setaf 5) #  magenta
bldcyn=${txtbld}$(tput setaf 6) #  cyan
bldwht=${txtbld}$(tput setaf 7) #  white
reverse=${txtbld}$(tput rev) 	# reverse FGBG
txtrst=$(tput sgr0)   			# Reset
info=${bldwht}*${txtrst}   		# Feedback
pass=${bldblu}*${txtrst}
warn=${bldred}*${txtrst}
ques=${bldblu}?${txtrst}

#===============Evaluation Stuff=================#

myps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }
findPid () { lsof -t -c c "$@" ; }
#   memHogsTop, memHogsPs:  Find memory hogs
#   -----------------------------------------------------
alias memHogsTop='top -l 1 -o rsize | head -20'
alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'
#   cpuHogs:  Find CPU hogs
#   -----------------------------------------------------
alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'
alias ttop='top -R -F -s 10 -o rsize'  # Low Resource Top



#==================Seperator=====================#
#===================Misc To Remember=============#

# Sample Color Prompt Syntax "\033[fg;bgm\] symbolic \[\033[0m\]"
# Sample Color Prompt Syntax "\e[fg;bgm\] symbolic \[\e[0m\]"
#  mkdir dirname && cd $_   #  makes dir=dirname and cds to it
# Setting PATH for Python 3.5
# The original version is saved in .bash_profile.pysave