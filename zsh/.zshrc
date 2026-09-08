
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

ZSH_PLUGIN_DIR="$HOME/.local/share/zsh/plugins"
eval "$(zoxide init zsh)"
echo 'source `npm root -g`/zsh-history-enquirer/zsh-history-enquirer.plugin.zsh' >> ~/.zshrc
source "$ZSH_PLUGIN_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$ZSH_PLUGIN_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

source `npm root -g`/zsh-history-enquirer/zsh-history-enquirer.plugin.zsh
source `npm root -g`/zsh-history-enquirer/zsh-history-enquirer.plugin.zsh
source `npm root -g`/zsh-history-enquirer/zsh-history-enquirer.plugin.zsh
source `npm root -g`/zsh-history-enquirer/zsh-history-enquirer.plugin.zsh
source `npm root -g`/zsh-history-enquirer/zsh-history-enquirer.plugin.zsh
source `npm root -g`/zsh-history-enquirer/zsh-history-enquirer.plugin.zsh
source `npm root -g`/zsh-history-enquirer/zsh-history-enquirer.plugin.zsh
source `npm root -g`/zsh-history-enquirer/zsh-history-enquirer.plugin.zsh
source `npm root -g`/zsh-history-enquirer/zsh-history-enquirer.plugin.zsh
