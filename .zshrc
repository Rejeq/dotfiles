# Prevent runnning zsh in tty
read pcomm < /proc/$PPID/comm
if [ "$pcomm" = "login" ]; then
  exec bash
fi

# Autostart tmux session if not already inside one
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  tmuxSessionName="${USER}_session"

  # Create a new session if it doesn't exist
  if ! tmux has-session -t $tmuxSessionName 2> /dev/null; then
    # In WSL tmux in startup gives error, this fix should work.
    # Detail: https://github.com/microsoft/WSL/issues/2530
    if $(uname -r | grep -qi microsoft); then
      systemd-tmpfiles --create
    fi

    exec tmux new-session -s $tmuxSessionName
  else
    exec tmux attach-session -t $tmuxSessionName
  fi
fi

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

alias :q="exit"
alias xdo=xdg-open

alias ll="ls -la"
alias la="ls -a"

if command -v exa >> /dev/null; then
   alias ls="exa --icons"
   alias tree="exa --icons --tree"
fi

# Fast cd to Android sdcard directory
if [[ -n ${TERMUX_VERSION+x} ]]; then
  alias hd="cd /sdcard/"
  alias hdd="cd /sdcard/Download/"
fi

if command -v vncserver >> /dev/null; then
  kvnc()
  {
    if [[ -z "$1" ]]; then
      vncserver -kill $DISPLAY
    else
      vncserver -kill $1
    fi
  }
  alias vnc="vncserver -localhost"
  alias lvnc="vncserver -list"
  alias rvnc="kvnc;vnc"
fi

alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"
alias ......="cd ../../../../../"

# cd
setopt AUTO_CD              # Go to folder path without using cd.
setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

# History
setopt APPEND_HISTORY            # Append session history to the history file on exit
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.

setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt EXTENDED_GLOB        # Use extended globbing syntax.
setopt INTERACTIVE_COMMENTS # Allow comments even in interactive shells

bindkey -e
export KEYTIMEOUT=1

# Search using arrows
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# Go to beginning and end of line using HOME and END keys
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

export ZSH_CONFIG_DIR=$XDG_CONFIG_HOME/zsh/

# Pretty ls colors
eval "$(dircolors $ZSH_CONFIG_DIR/solarized-256dark.dircolors)"

# git clone --depth 1 https://github.com/zsh-users/zsh-completions.git "$ZSH_COMP_HOME"
export ZSH_COMP_HOME="$ZSH_CONFIG_DIR/plugins/zsh-completions"
fpath=($ZSH_COMP_HOME/src $fpath)
source $ZSH_CONFIG_DIR/completion.zsh

# git clone --depth 1 https://github.com/romkatv/powerlevel10k.git "$P10K_HOME"
export P10K_HOME="$ZSH_CONFIG_DIR/plugins/powerlevel10k"
[[ ! -f $P10K_HOME/powerlevel10k.zsh-theme ]] || source $P10K_HOME/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_SH_HOME"
export ZSH_SH_HOME="$ZSH_CONFIG_DIR/plugins/zsh-syntax-highlighting"
[[ ! -f $ZSH_SH_HOME/zsh-syntax-highlighting.zsh ]] || source $ZSH_SH_HOME/zsh-syntax-highlighting.zsh

if command -v zoxide >> /dev/null; then
  eval "$(zoxide init zsh)"
fi
