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

# Set default editor as mate if there is.
which mate &>/dev/null && mate="$(which mate)"
if [[ -s $mate ]]; then
    export EDITOR="$mate"
    export VISUAL="$mate"
    export GEM_OPEN_EDITOR="$mate"
    export GIT_EDITOR="$mate"
fi

# My soft bin path. To avoid sudo(/usr/local).
export PATH=$HOME"/.usr/bin":$PATH

# Active ruby version manager.
rvm=$HOME"/.rvm/scripts/rvm" && [[ -s $rvm ]] && . $rvm

# Active node version manager.
nvm=$HOME"/.nvm/nvm.sh" && [[ -s $nvm ]] && . $nvm

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
