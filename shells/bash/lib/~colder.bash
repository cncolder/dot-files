#!/bin/bash
#
# ~colder.bash -- Bash support for myself.
# 
# This script use for myself. Start with '~' to ensure it's the last script. So that I can overwrite the others.

# It make these things:
# 1. Replace prompt with ☃ because I'm Colder.
# 2. Set default editor as mate if there is.
# 3. Add ~/.usr/bin to PATH.
# 4. Active rvm
# 5. Active nvm.

#

if [[ "$USER" != "colder" && "$USER" != "mes" ]]; then
    return
fi

# I like ☃ rather than ♪. lol
function precmd() {
    PS1="$(user_at_host)$(prompt_pwd)☃ "
}

# My soft bin path. To avoid sudo(/usr/local).
export PATH=$HOME/.usr/bin:$PATH

# Set default editor.
if editor="$(which mate)"; [[ -s $editor ]]; then
  export EDITOR="$editor"
  export VISUAL="$editor"
  export GEM_OPEN_EDITOR="$editor"
  export GIT_EDITOR="$editor"
fi

# Active ruby version manager.
rvm=$HOME/.rvm/scripts/rvm && [[ -s $rvm ]] && . $rvm # Load RVM into a shell session *as a function*
export PATH=$HOME/.rvm/bin:$PATH # Add RVM to PATH for scripting

# Active node version manager.
nvm=$HOME/.nvm/nvm.sh && [[ -s $nvm ]] && . $nvm
export PATH=node_modules/.bin:$PATH

### Added by the Heroku Toolbelt
export PATH=/usr/local/heroku/bin:$PATH

# n
# export N_PREFIX=$HOME/.usr
