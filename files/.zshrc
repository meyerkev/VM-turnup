# Pip and Python
export PATH=/opt/homebrew/bin/:/opt/homebrew/Cellar/python@3.9/3.9.10/libexec/bin/:${PATH}
alias python=python3


if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/meyerkev/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/meyerkev/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/meyerkev/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/meyerkev/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/Users/meyerkev/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

add_ssh_key () {
  ssh-add -l | grep "$(ssh-keygen -lf $1)" 2>/dev/null 1>/dev/null
  if [ $? -ne 0 ]; then
    ssh-add $1
  fi
}

add_ssh_keys () {
  add_ssh_key ~/.ssh/id_rsa
}

add_ssh_keys

eval $(thefuck --alias)
