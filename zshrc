function autoauth()
{
	name=bup0072
	pass=`gpg --decrypt ~/private/univ-pass.txt.gpg 2>/dev/null`

	unset https_proxy
	if [ -z $1 ]; then
		echo "Nothing to do"
	elif [ $1 = "DO-NET" ]; then
		# DO-NET
		curl 'https://do-net.doshisha.ac.jp:10443/cgi-bin/adeflogin.cgi' -H 'Referer: https://do-netmac.doshisha.ac.jp:10443/page/auth.html' -H 'Origin: https://do-netmac.doshisha.ac.jp:10443' -H 'Content-Type: application/x-www-form-urlencoded' --data "name2=$name&pass=$pass&suffix=@doshisha.ac.jp&name=$name@doshisha.ac.jp&ok=Log+in" 1>/dev/null 2>&1
		export UNIV_AUTHENTICATED="DO-NET"
	elif [ $1 = "WL-RM" ]; then

		# WL-RM
		curl 'https://do-net.drm.doshisha.ac.jp:10443/cgi-bin/adeflogin.cgi' -H 'Referer: https://do-netmac.drm.doshisha.ac.jp:10443/page/auth.html' -H 'Origin: https://do-netmac.drm.doshisha.ac.jp:10443' -H 'Content-Type: application/x-www-form-urlencoded' --data "name2=$name&pass=$pass&suffix=@doshisha.ac.jp&name=$name@doshisha.ac.jp&ok=Log+in" 1>/dev/null 2>&1
		export UNIV_AUTHENTICATED="WL-RM"
	fi
}

function univ-proxy()
{
	if [ UNIV_AUTHENTICATED != "DO-NET" ]; then
		autoauth "DO-NET"
	fi
	export http{,s}_proxy=bup0072:`gpg --decrypt ~/private/univ-pass.txt.gpg 2>/dev/null`@proxy.doshisha.ac.jp:8080
}

function rohm-proxy()
{
	if [ UNIV_AUTHENTICATED != "WL-RM" ]; then
		autoauth "WL-RM"
	fi
	export http{,s}_proxy=bup0072:`gpg --decrypt ~/private/univ-pass.txt.gpg 2>/dev/null`@proxyr.drm.doshisha.ac.jp:8080
}

function rohm-proj-proxy()
{
	export http{,s}_proxy=proxyr.drm.doshisha.ac.jp:8080
	unset UNIV_AUTHENTICATED
}

function auto-proxy()
{
	openvpn_pid=`pgrep openvpn`
	if [ $openvpn_pid ]; then
		unset http{,s}_proxy
		return 0
	fi
	ssid=$(nmcli|awk '/wlp4s0/ {print $4}')
	if [ -z $ssid ]; then
		return 0
	fi
	if expr $ssid : "DO-NET" > /dev/null; then
		univ-proxy
	elif expr $ssid : "WL-RM" > /dev/null; then
		rohm-proxy
	elif expr $ssid : "technologica" > /dev/null; then
		rohm-proj-proxy
	else
		unset http{,s}_proxy
		unset UNIV_AUTHENTICATED
	fi
}

#function auto-proxy-all()
#{
#	for w in $(tmux list-windows|cut -d: -f1); do
#		tmux send-keys -t tomoyat1:$w "auto-proxy\n"
#	done
#}

function openvpn-start()
{
	sudo systemctl start openvpn-client@tomoyat1.com
	auto-proxy
}

alias vpnup="openvpn-start"

function openvpn-stop()
{
	sudo systemctl stop openvpn-client@tomoyat1.com
	auto-proxy
}
alias vpndown="openvpn-stop"

function openvpn-restart()
{
	openvpn-stop
	openvpn-start
}

#Set EDITOR
export EDITOR="/usr/bin/nvim"

#ls aliases
alias ls="ls -p --color=auto"

#sudo aliases
alias suod="sl"

#archive-date
alias archive-date="date +%Y%m%d%H%M"

#pbcopy
alias pbcopy="xsel --clipboard --input"

# neovim
alias vim="nvim"

#neomutt
alias mutt="neomutt"

#ls -l
alias l="ls -al"

#VISUAL variable for default visudo editor
export VISUAL="/usr/bin/nvim"

#prompt
autoload -Uz vcs_info
autoload -U colors
colors
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' formats '%{'${fg_bold[green]}'%}(%b)%{'$reset_color'%}'
setopt prompt_subst
precmd () {
	LANG=en_US.UTF-8 vcs_info
}
RPROMPT='%~ ${vcs_info_msg_0_}'

#history
export HISTSIZE=2000
export HISTFILE="$HOME/.history"

export SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups

#tomos toolchain
export PATH="$HOME/opt/i686/bin:$PATH"

#personal scripts
export PATH="$HOME/bin:$PATH"

#stack
export PATH="$HOME/.local/bin:$PATH"

#texlive
export PATH="/usr/local/texlive/2016/bin/x86_64-linux:$PATH"

#cargo
export PATH="$HOME/.cargo/bin:$PATH"

#local
export PATH="$HOME/.local/bin:$PATH"

#sculd ENV
export CAMPH_SCHED_URL=https://cal.camph.net/private/schedule.json
export CAMPH_SCHED_USER=camphor
export CAMPH_SCHED_PASS=borYgrsnVzDV6L4cBAua

#gopath
export GOPATH=${GOPATH:-"$HOME/src/go"}
export PATH="$GOPATH/bin:$PATH"

#yarn path
export PATH="$(yarn global bin --offline):$PATH"

#tomoyat1-t alias
alias tomoyat1-t="mosh t@tomoyat1.com -- /usr/home/t/bin/tmux-starter"

# alias ws-tomoyat1="mosh ws -- /home/tomoyat1/bin/tmux-starter"
# alias ws-tomoyat1-vpn="mosh ws-vpn -- /home/tomoyat1/bin/tmux-starter"
# above two aliases combined!
function ws-tomoyat1()
{
	gw=${$(route -n | awk '$1 == "0.0.0.0" && $8 == "tun0" {print $2; exit}'):-"NULL"}
	if [ $gw = "10.13.37.1" ]; then
		mosh ws-vpn -- /home/tomoyat1/bin/tmux-starter
	else
		mosh ws -- /home/tomoyat1/bin/tmux-starter
	fi
}

alias freebsd-current="mosh tomoyat1@10.2.0.2 -- /home/tomoyat1/bin/tmux-starter"
alias freebsd-userobjaccounting="mosh tomoyat1@10.2.4.2 -- /home/tomoyat1/bin/tmux-starter"

fpath=(~/.zsh/completion $fpath)

#completion
autoload -U compinit promptinit
compinit -u

setopt magic_equal_subst
setopt auto_menu
setopt mark_dirs
setopt complete_in_word

zstyle ':completion:*' verbose true
zstyle ':completion:*' completer _expand _complete _match _history _prefix
zstyle ':completion:*:default' menu select=2
eval $(dircolors /etc/DIR_COLORS)
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:messages' format '%{'${fg_bold[blue]}'%}%d%{'$reset_color'%}'
zstyle ':completion:*:warnings' format '%{'${fg_bold[red]}'%}No matches for: %{'${fg_bold[yellow]}'%}%d%{'$reset_color'%}'
zstyle ':completion:*:descriptions' format '%{'${fg_bold[green]}'%}%d%{'$reset_color'%}'
#zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*' group-name ''
setopt menu_complete

promptinit; prompt gentoo


autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
bindkey -M vicmd 'k' up-line-or-beginning-search
bindkey -M vicmd 'j' down-line-or-beginning-search

if [ -e $TMUX ]; then
	export TERM=xterm-256color
fi


#. /etc/profile.d/vte-2.91.sh

setopt extendedglob
unsetopt equals

eval `keychain --agents ssh,gpg --quiet --eval ~/.ssh/id_rsa`
. ~/.keychain/$HOST-sh
. ~/.keychain/$HOST-sh-gpg

export GPG_TTY=`tty`

auto-proxy
# sudo-last
sudo-last()
{
	sudo $(history | tail -1 | sed 's/\ .*\ \ //g')
}
# gen-pass
function gen-pass() {
	cat /dev/urandom | tr -dc 0-9a-zA-Z | fold -$1 | head -10
}
