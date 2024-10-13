export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

export DISPLAY=":0"

export TERMINAL=alacritty

export VISUAL=nvim
export EDITOR="$VISUAL"
export MANPAGER='nvim +Man!'

export HISTSIZE=250000
export SAVEHIST=250000
export HISTFILE=~/.zsh_history

export ANDROID_USER_HOME=$XDG_CONFIG_HOME/.android
export ANDROID_AVD_HOME=$ANDROID_USER_HOME/avd
export ANDROID_HOME=$HOME/Android/Sdk/
export JAVA_HOME=/opt/android-studio/jbr/

export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
