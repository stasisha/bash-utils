#!/bin/bash

install-brew(){
  command -v brew >/dev/null 2>&1 || {
    echo >&2 "Installing homebrew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  }
}

brew-install-if-not-installed() {
  local software=$1
  local caskSoftware=$2

  # removing already installed packages from the list
  for p in $(brew list); do
    software=${software//$p/}
  done;

  for p in $(brew list); do
    caskSoftware=${caskSoftware//$p/}
  done;  

  if [ -z "$software" ] && [ -z "$caskSoftware" ]; then
    echo "Nothing to install."
  else
    install-brew
    brew update

    if [ -n "$software" ]; then
      echo "Installing $software"
      brew install "$software"
    fi

    if [ -n "$caskSoftware" ]; then
      echo "Installing cask ${caskSoftware}"
      brew cask install "${caskSoftware}"
    fi

    brew cleanup
  fi
}
