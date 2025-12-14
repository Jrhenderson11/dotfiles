zmodload zsh/zprof

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export QT_SCALE_FACTOR=1.3
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(evalcache git zsh-syntax-highlighting zsh-autosuggestions zsh-completions colored-man-pages colorize command-not-found ufw history pip ssh-agent sudo git-auto-fetch docker ubuntu)

# stop highlighting long strings
export ZSH_HIGHLIGHT_MAXLENGTH=60

# for zsh-completions https://github.com/zsh-users/zsh-completions
autoload -U compinit && compinit

#https://blog.mattclemente.com/2020/06/26/oh-my-zsh-slow-to-load.html
#https://blog.jldc.me/posts/speeding-up-zsh
#https://medium.com/wearetheledger/oh-my-zsh-made-for-cli-lovers-installation-guide-3131ca5491fb

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# PAGE UP AND DOWN  (see /etc/inputrc)
bindkey "^[[5~" beginning-of-line
bindkey "^[[6~" end-of-line

# Colours
source ~/.colours.sh

# ZSH Bookmarks
# https://vincent.bernat.ch/en/blog/2015-zsh-directory-bookmarks

MARKPATH='/home/james/.bookmarks'

bookmark() {
        [[ -d $MARKPATH ]] || mkdir -p $MARKPATH
        if (( $# == 0 )); then
            # When no arguments are provided, just display existing
            # bookmarks
            for link in $MARKPATH/*(N@); do
                local markname="$fg[green]${link:t}$reset_color"
                local markpath="$fg[blue]${link:A}$reset_color"
                printf "%-30s -> %s\n" $markname $markpath
            done
        else
            # Otherwise, we may want to add a bookmark or delete an
            # existing one.
            local -a delete
            zparseopts -D d=delete
            if (( $+delete[1] )); then
                # With `-d`, we delete an existing bookmark
                command rm $MARKPATH/$1
            else
                # Otherwise, add a bookmark to the current
                # directory. The first argument is the bookmark
                # name. `.` is special and means the bookmark should
                # be named after the current directory.
                local name=$1
                [[ $name == "." ]] && name=${PWD:t}
                ln -s $PWD $MARKPATH/$name
                hash -d -- ${name}=${PWD}
            fi
        fi
    }

for link ($MARKPATH/*(N@)) {
    hash -d -- ${link:t}=${link:A}
}

# ALIASES
source $HOME/.aliases

# Go settings
GOROOT=/usr/local/go
GOPATH=/home/james/go

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change (no screw you)
export PATH="$PATH:$HOME/.rvm/bin:/usr/lib/postgresql/9.5/bin/"
#source ~/.rvm/scripts/rvm

# Add metasploit to path
export PATH="$PATH:/tools/metasploit-framework/"


# add ruby bins dir
# PATH="$HOME/.rvm/gems/ruby-2.6.2@metasploit-framework/bin:$HOME/.rvm/gems/ruby-2.6.2@global/bin:$HOME/.rvm/rubies/ruby-2.6.2/bin:$PATH"
# PATH="$HOME/.rvm/gems/ruby-2.7.2@metasploit-framework/bin:$HOME/.rvm/gems/ruby-2.7.2@global/bin:$HOME/.rvm/rubies/ruby-2.7.2/bin:$PATH"

# GEM_HOME=/home/james/.rvm/gems/ruby-2.7.2
# GEM_PATH=/home/james/.rvm/gems/ruby-2.7.2:/home/james/.rvm/gems/ruby-2.7.2@global


# Add cargo bins for luverly bat
export PATH="$PATH:$HOME/.cargo/bin/"

# Add yellow .md colouring
export LS_COLORS=$LS_COLORS:'*.md=01;93:'

function powerline_precmd() {
	pwd > "${HOME}/.cwd";
    PS1="$(powerline-shell-cpp $?)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi

unsetopt share_history
setopt no_share_history
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

PATH="/home/james/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/james/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/james/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/james/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/james/perl5"; export PERL_MM_OPT;
