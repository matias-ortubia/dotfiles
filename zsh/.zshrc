
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate 
zstyle :compinstall filename '/home/matias/.zshrc'
# Interactive completion menu
zstyle ':completion:*' menu select
# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# Colors in completion menu
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install

source .key_bindings.zsh

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  zsh-history-enquirer
)

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi


export BAT_THEME="Catppuccin Mocha"

# Alias

alias ls='ls --color=auto'
alias la="ls -a"
alias ll="ls -lh"
alias lla="ls -lAh"



# Plugins / Tools

eval "$(starship init zsh)"

autoload -Uz add-zsh-hook
_run_once_fastfetch() {
 fastfetch
 add-zsh-hook -d precmd _run_once_fastfetch
}
add-zsh-hook precmd _run_once_fastfetch
export NPM_CONFIG_PREFIX="$HOME/.npm-global"
export PATH="$HOME/.npm-global/bin:$PATH"
exec 3>&2

# Prints "Uhm, actually..." before every error (commented because it gave some problems)
#exec 2> >(while IFS= read -r line; do print -u3 "Uhm, actually \U1F913\U261D: $line"; done)

export PATH="$HOME/.local/bin:$PATH"

eval "$(zoxide init zsh)"
source `npm root -g`/zsh-history-enquirer/zsh-history-enquirer.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


#export LS_COLORS='di=38;2;137;180;250:ln=38;2;137;220;235:ex=38;2;166;227;161:pi=38;2;249;226;175:so=38;2;203;166;247:or=38;2;243;139;168:mi=38;2;243;139;168:*.tar=38;2;243;139;168:*.tgz=38;2;243;139;168:*.gz=38;2;243;139;168:*.zip=38;2;243;139;168:*.7z=38;2;243;139;168:*.rar=38;2;243;139;168:*.jpg=38;2;245;194;231:*.jpeg=38;2;245;194;231:*.png=38;2;245;194;231:*.gif=38;2;245;194;231:*.webp=38;2;245;194;231:*.svg=38;2;245;194;231:*.mp3=38;2;137;220;235:*.wav=38;2;137;220;235:*.flac=38;2;137;220;235:*.mp4=38;2;245;194;231:*.mkv=38;2;245;194;231:*.avi=38;2;245;194;231'
export LS_COLORS="$(vivid generate catppuccin-mocha)"


