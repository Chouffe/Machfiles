# AUTO TMUX
if [[ -z "$TMUX" ]] ;then
    ID="`tmux ls | grep -vm1 attached | cut -d: -f1`" # get the id of a deattached session
    if [[ -z "$ID" ]] ;then # if not available create a new one
        tmux new-session
    else
        tmux attach-session -t "$ID" # if available attach to it
    fi
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set name of the theme to load.
set -g pane-border-fg black
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="af-magic"
ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME="norm"
# ZSH_THEME="alanpeabody"
# ZSH_THEME="aussiegeek"
# ZSH_THEME="Soliah"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(git lein autojump sudo tmux jsontools python cabal)
# virtualenvwrapper
# plugins=(aws pass docker git gitfast git-extras tig fasd extract lein sudo tmux jsontools python cabal brew web-search zsh-autosuggestions zsh-syntax-highlighting dotenv)
plugins=(aws pass docker git gitfast git-extras tig fasd extract lein sudo tmux jsontools python cabal brew web-search zsh-autosuggestions zsh-syntax-highlighting zsh-completions)

export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Virtualenvwrapper
# source /usr/local/bin/virtualenvwrapper.sh
# source ~/.local/bin/virtualenvwrapper.sh
# source /usr/local/bin/virtualenvwrapper.sh

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_COMPLETION_TRIGGER=''
bindkey '^T' fzf-completion
bindkey '^I' $fzf_default_completion

### Added by the Heroku Toolbelt
# export PATH="/usr/local/heroku/bin:$PATH"

# # Android SDK
# export ANDROID_HOME=/opt/android-sdk-linux
# export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

#so as not to be disturbed by Ctrl-S ctrl-Q in terminals:
# stty -ixon

# Right Prompt
# RPROMPT="$FG[013]%D{%H:%M}%{$reset_color%}$FG[015] %D{»} %{$reset_color%}$FG[014]%D{%m/%d}%{$reset_color%}"
# RPROMPT=""

# added by travis gem
# [ -f /home/chouffe/.travis/travis.sh ] && source /home/chouffe/.travis/travis.sh

# kubectl autocompletion
# source <(kubectl completion zsh)

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
# [[ -f /home/chouffe/udemy/aws/lambda/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/chouffe/udemy/aws/lambda/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
# [[ -f /home/chouffe/udemy/aws/lambda/node_modules/tabtab/.completions/sls.zsh ]] && . /home/chouffe/udemy/aws/lambda/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
# [[ -f /home/chouffe/udemy/aws/lambda/node_modules/tabtab/.completions/slss.zsh ]] && . /home/chouffe/udemy/aws/lambda/node_modules/tabtab/.completions/slss.zsh
#
#
#
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/chouffe/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/chouffe/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/chouffe/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/chouffe/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<


# Configure pinentry to use the correct TTY
gpg-connect-agent updatestartuptty /bye >/dev/null

# Fix Ctrl-U
bindkey \^U backward-kill-line
# Fix Ctrl-W
# backward-kill-dir () {
#     local WORDCHARS=${WORDCHARS/\/}
#     zle backward-kill-word
# }
# zle -N backward-kill-dir

# rbenv initialization
# eval "$(rbenv init -)"
# eval "$(~/.rbenv/bin/rbenv init - bash)"

# direnv hook
eval "$(direnv hook zsh)"

# show_virtual_env() {
#   if [ -n "$CONDA_DEFAULT_ENV" ]; then
#     echo "($(basename $CONDA_DEFAULT_ENV))"
#   fi
# }
# export show_virtual_env
# PS1='$(show_virtual_env)'$PS1

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# eval "$(pyenv init -)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/arthur/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/arthur/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/arthur/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/arthur/google-cloud-sdk/completion.zsh.inc'; fi

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,functions,aliases,exports,bindings,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
