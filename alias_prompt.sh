function check-alias-and-accept {
  if [ $BUFFER ]; then

    ESCAPED_BUFFER=$(printf %s "$BUFFER" | sed 's/[][()\.^$?*+]/\\&/g')
    ALIAS=`alias -L | grep -e "=[\'\"]\?${ESCAPED_BUFFER}[\'\"]\?$"`

    if [ $ALIAS ]; then
      echo
      echo "Use the alias:"
      echo
      echo $ALIAS
      echo

      zle kill-whole-line
      zle reset-prompt
    else
      zle accept-line
    fi
  else
    zle accept-line
  fi
}

zle -N check-alias-and-accept
bindkey '^J' check-alias-and-accept
bindkey '^M' check-alias-and-accept
