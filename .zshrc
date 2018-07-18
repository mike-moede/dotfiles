# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# auto load .nvmrc and apply when cd into a directory that has an .nvmrc
# this must be loaded before the zsh-nvm plugin
export NVM_AUTO_USE=true


# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    docker
    vi-mode
    archlinux
    zsh-autosuggestions
    # custom plugins #
    # https://github.com/lukechilds/zsh-nvm
    zsh-nvm)

source $ZSH/oh-my-zsh.sh

#############################
#     USER CONFIGURATION    #
#############################

# Export these user specific environment variables in your ~/.zshenv
# in order for these aliases to work. Set them to empty string if not
# applicable:
    # export GITHUB_ACCOUNT=
    # export BITBUCKET_ACCOUNT=
    # export NPM_TOKEN=

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

function pe() {
    echo "ERROR: $1" >&2
    exit 1
}

function edit-config {
    config_file=~/.config/${1}/config
    if [[ -f "${config_file}" ]]; then
        vim $config_file
    else
        echo "${config_file}"
        echo "no config file found for ${1}" >&2
    fi
}

## RUST
export PATH=~/.cargo/bin:$PATH
RUST_SRC_PATH=~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
## end RUST

## GOLANG
export GOPATH=~/code/go
# add go bin folder to path so that compiled bin files can be
# executed from anywhere using terminal
export PATH="$PATH:$GOPATH/bin"
## END GOLANG



# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias h="cd ~"
alias ec="edit-config"
alias ecp="ec polybar"
alias ez="vim ~/.zshrc"
alias vz="vim ~/.zshrc"
alias sz="source ~/.zshrc"
alias gs="git status"
alias gau"git add -u"
alias gcm="git commit -m"
alias gb="git branch"
alias gd="git diff"
alias gds="git diff --staged"
alias gcb="git checkout -b"
alias gc="git commit --verbose"
alias gbl="git branch -l"
alias gp="git push"
alias gpp="quick-git-check-in"
alias glv="git log | vim -"
alias gl="git log"
alias clone=clone
alias pbcopy="xclip -selection clipboard"
alias pbpaste="xclip -selection clipboard -o"
alias restart="shutdown -r now"
## reload xresources
alias xrl="xrdb ~/.Xresources"
alias nr="node run.js"
alias kl="kubectl"
alias pacman="sudo pacman"
alias x="chmod +x"

alias y="yadm"
alias ya="yadm add"
alias yau="yadm add -u" # add only unstaged files
alias yc="yadm commit --verbose"
alias yca="yadm commit --amend"
alias ycm="yadm commit -m"
alias yp="yadm push"
alias ypf="yadm push -f"
alias ys="yadm status"
alias ye="yadm encrypt"
alias yd="yadm diff"
alias yds="yadm diff --staged"
alias yaf="yadm add ~/.yadm/files.gpg"
alias yafp="yadm add ~/.yadm/files.gpg ~/.yadm/encrypt && yadm commit -m 'encrypt' && yadm push"
alias token=~/.ssh/token

alias setup-run="bash ~/.local/bin/setup/install"
alias setup-edit="vim ~/.local/bin/setup/install"
alias update="bash ~/.local/bin/setup/update"
alias tools="cd ~/.local/bin/tools/ && ll"

alias npmis="npm install --save"
alias npmisd="npm install --save-dev"

alias cat="ccat"
alias ls="exa"
alias ll="exa -la"
alias gimme="sudo pacman -S"
alias bgf="~/.fehbg"
alias bgn="update_background"

alias c="cd ~/code && ll"
alias cgbb="cd ~/code/go/src/bitbucket.org/wtsdevops && ll"
alias cggh="cd $GOPATH/src/github.com/$GITHUB_ACCOUNT && ll"

# leave this function with the _ prefix and aliased below without
# the prefix. Without them zsh errors on sourcing because grep
# is referencing an alias in this function. ( my grep is grep plus some
# formatting flags)
_sshg() {
    cat ~/.ssh/config | grep "Host $1"
}
# quickly grep ssh hosts from config file
alias grepssh=_sshg

#switch between different AWS accounts
alias work-mode="switch-aws-creds.sh work"
alias other-mode="switch-aws-creds.sh other"
alias check-mode="aws s3 ls"


## CUSTOM KEY BINDINGS ##
## zsh vi-mode settings
# remaps ESC to fd
bindkey -M viins 'fd' vi-cmd-mode
bindkey 'lk' autosuggest-accept


## Robo3t -mongo-client-
export PATH=/usr/bin/robo3t/bin:$PATH

## vimgolf
export PATH="$PATH:/home/$USER/.gem/ruby/2.5.0/gems/vimgolf-0.4.8/bin"
## end vimgolf

export PATH=~/.local/bin/work:$PATH
export PATH=~/.local/bin:$PATH
export PATH=~/.local/bin/tools:$PATH
export PATH=/opt/idea-IC-171.4424.56/bin:$PATH
export PATH=~/.cargo/bin:$PATH

## NPM TOKEN SETUP
export NPM_TOKEN=$NPM_TOKEN

export EDITOR=vim

export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=$PATH:/home/$USER/.local/bin

## Kubernetes
command -v kubectl >/dev/null 2>&1
if [[ $? == 0 ]]; then
    source <(kubectl completion zsh)
fi

## Azure
if [[ -f /home/$USER/.local/bin/azure-cli/az.completion ]]; then
    source /home/$USER/.local/bin/azure-cli/az.completion
fi

## VIM POWERLINE
if [[ -r ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
    source ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
fi

