#!/bin/bash
#
# ~colder.bash -- Bash support for myself.
#

if [[ "$USER" != "colder" && "$USER" != "mes" ]]; then
    return
fi

# I like ☃ rather than ♪. lol
function precmd() {
    PS1="$(user_at_host)$(prompt_pwd)☃ "
}

# Use for ruby 1.9 encoding.
export LC_CTYPE=en_US.UTF-8

# export CLICOLOR="cons25"

# Compile as 64bit. Mac os x has upgrade to 64bit after snow leopard.
export ARCHFLAGS="-arch x86_64"

# My soft bin path. To avoid sudo(/usr/local).
export PATH=$HOME"/.usr/bin":$PATH

# Set default editor.
# if editor="$(which mvim)"; [[ -s $editor ]]; then
#   export EDITOR="$editor -f"
#   export VISUAL="$editor"
#   export GEM_OPEN_EDITOR="$editor"
#   export GIT_EDITOR="$editor -f"
# el
if editor="$(which mate)"; [[ -s $editor ]]; then
  export EDITOR="$editor"
  export VISUAL="$editor"
  export GEM_OPEN_EDITOR="$editor"
  export GIT_="$editor"
fi

# Active ruby version manager.
rvm=$HOME"/.rvm/scripts/rvm" && [[ -s $rvm ]] && . $rvm

# Active node version manager.
nvm=$HOME"/.nvm/nvm.sh" && [[ -s $nvm ]] && . $nvm
export PATH="node_modules/.bin":$PATH

# FIXME: This script is too slowly. Wait 280north upgrade it.
# Active narwhal enviriment.
# activate=$HOME"/.usr/narwhal/bin/activate" && [[ -s $activate ]] && . $activate
export NARWHAL_ENGINE=jsc
export CAPP_BUILD="$HOME/Documents/Github/cappuccino/Build"

export DYLD_LIBRARY_PATH="/usr/local/oracle/instantclient_10_2"
export PATH=$DYLD_LIBRARY_PATH:$PATH
export SQLPATH="/usr/local/oracle/instantclient_10_2"
# export TNS_ADMIN="/usr/local/oracle/network/admin"
# export NLS_LANG="AMERICAN_AMERICA.UTF8"

# export PATH="/Applications/eclipse/sdks/android-sdk-mac_86":$PATH
