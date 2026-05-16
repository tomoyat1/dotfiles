#Set EDITOR
export EDITOR="/usr/bin/nvim"

#ls aliases
alias ls="ls -p --color=auto"

alias kg="kubectl get"
alias kl="kubectl logs"
alias kd="kubectl describe"

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
autoload -Uz colors
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
export SAVEHIST=4000
setopt hist_find_no_dups
setopt hist_ignore_all_dups

#personal scripts
export PATH="$HOME/bin:$PATH"

#texlive
export PATH="/usr/local/texlive/2019/bin/x86_64-linux:$PATH"

#cargo
export PATH="$HOME/.cargo/bin:$PATH"

#local
export PATH="$HOME/.local/bin:$PATH"

#/usr/sbin
export PATH="/usr/sbin:$PATH"

#istioctl
export PATH="$HOME/.istioctl/bin:$PATH"

#gopath
export GOPATH=${GOPATH:-"$HOME/src/go"}
export PATH="$GOPATH/bin:$PATH"

#gem path
export PATH="$(gem environment gemdir)/bin:$PATH"

# OPAM configuration
. /home/tomoyat1/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

fpath=(~/.zsh/completion $fpath)

#completion
autoload -Uz compinit && compinit -u

setopt magic_equal_subst
setopt auto_menu
setopt mark_dirs
setopt complete_in_word

zstyle ':completion:*' verbose true
zstyle ':completion:*' completer _expand _complete _match _history _prefix
zstyle ':completion:*:default' menu select=2
# eval $(dircolors /etc/DIR_COLORS)
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
setopt COMPLETE_ALIASES

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey -v
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
bindkey -M vicmd 'k' up-line-or-beginning-search
bindkey -M vicmd 'j' down-line-or-beginning-search

if [ -n "$TMUX" ]; then
	export TERM=xterm-256color
fi

setopt extendedglob
setopt share_history
setopt extended_history
unsetopt equals

# sudo-last
sudo-last()
{
	sudo $(history | tail -1 | sed 's/\ .*\ \ //g')
}

if [ -e $TERM -o $TERM != screen-256color ]; then
      export TERM=xterm-256color
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/tomoyat1/.sdkman"
[[ -s "/home/tomoyat1/.sdkman/bin/sdkman-init.sh" ]] && source "/home/tomoyat1/.sdkman/bin/sdkman-init.sh"

autoload -U +X bashcompinit && bashcompinit

complete -o nospace -C $HOME/bin/terraform terraform

source <(kubectl completion zsh)

eval "$(direnv hook zsh)"

# kubernetes bounce pods in ns
function bounce_pods() {
	for d in $(kubectl get -n $1 deployment -oname); do
		kubectl rollout restart -n $1 $d
	done
	for d in $(kubectl get -n $1 daemonset -oname); do
		kubectl rollout restart -n $1 $d
	done
	for d in $(kubectl get -n $1 statefulset -oname); do
		kubectl rollout restart -n $1 $d
	done
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
. ~/.fzf-tab/fzf-tab.plugin.zsh

export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tomoyat1/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/tomoyat1/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tomoyat1/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/tomoyat1/google-cloud-sdk/completion.zsh.inc'; fi

