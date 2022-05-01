# Lines configured by zsh-newuser-install
HISTFILE=~/.history
HISTSIZE=3000
SAVEHIST=3000
setopt notify # Show a message when the history is being written out
setopt inc_append_history # Append to history file, don't overwrite it
setopt share_history # Share history between sessions
setopt hist_ignore_dups # Don't record duplicates
setopt hist_find_no_dups # Don't record commands that were executed
setopt hist_reduce_blanks # Remove duplicate blank lines
bindkey -v
stty stop undef
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'
zstyle ':completion::complete:*' use-cache 1

autoload -Uz compinit
fpath+=~/.zfunc
compinit
# End of lines added by compinstall

if [ -f "/usr/share/zsh/site-functions/zsh-syntax-highlighting.zsh" ]; then
    source /usr/share/zsh/site-functions/zsh-syntax-highlighting.zsh
fi

export EDITOR=nvim
export GPG_TTY=$TTY
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/dev/flutter/bin:$PATH"
export MOZ_ENABLE_WAYLAND=1
export JDTLS_HOME="$HOME/.local/share/jdtls"
export _JAVA_AWT_WM_NONREPARENTING=1

if command -v cargo &> /dev/null; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi
if command -v go &> /dev/null; then
  export PATH="$(go env GOPATH)/bin:$PATH"
fi
if command -v yarn &> /dev/null; then
  export PATH="$(yarn global bin --offline):$PATH"
fi

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias psmem='ps auxf | sort -nr -k 4 | head -5'
alias pscpu='ps auxf | sort -nr -k 3 | head -5'
alias ls="exa"
alias cat="bat"

PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
