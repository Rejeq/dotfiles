# Prevent runnning zsh in tty
read pcomm < /proc/$PPID/comm
if [ "$pcomm" = "login" ]; then
  exec bash
fi

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

# export DISPLAY=":1"
export VISUAL=nvim
export EDITOR="$VISUAL"
export MANPAGER='nvim +Man!'

# OhMyZsh setup
export DISABLE_AUTO_UPDATE=true
export ZSH="$HOME/.oh-my-zsh"
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
export ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-syntax-highlighting z)

# [[ -a "/etc/zsh_command_not_found" ]] && source /etc/zsh_command_not_found

source $ZSH/oh-my-zsh.sh
# Looks like it enabled by default
# setopt histignorespace

export HISTFILESIZE=250000
export HISTSIZE=250000

alias :q="exit"

alias xdo=xdg-open

if command -v exa >> /dev/null; then
   alias ls="exa --icons"
   alias la="exa --icons -a"
   alias tree="exa --icons --tree"
fi

if [[ -n ${TERMUX_VERSION+x} ]]; then
  # Fast cd to Android sdcard dir
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

# Pretty ls colors
eval `dircolors ~/.solarized-256dark.dircolors`

# Load powelevel10k theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsth.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/go/bin:$PATH"
