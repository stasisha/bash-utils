addSofrwareToInstallIfNotInstalled() {
  local SOFTWARE=$1
  local PACKAGE=$2

  if brew ls --versions "$PACKAGE" >/dev/null; then
    echo ''
  else
    echo "${SOFTWARE} ${PACKAGE}"
  fi
}

install-xcode(){
  command -v xcode-select >/dev/null 2>&1 || {
    echo >&2 "Installing xcode-select..."
    xcode-select --install
  }
}

install-brew(){
  command -v brew >/dev/null 2>&1 || {
    echo >&2 "Installing homebrew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  }
}

brew-install-if-not-installed() {
  local software=$1
  local caskSoftware=$2
  
  install-brew

  if [ -z "$software" ] && [ -z "$caskSoftware" ]; then
    echo "Nothing to install."
  else
    brew update

    if [ -n "$software" ]; then
      echo "Installing $software"
      brew install"$software"
    fi

    if [ -n "$caskSoftware" ]; then
      echo "Installing cask ${caskSoftware}"
      brew cask install "${caskSoftware}"
    fi

    brew cleanup
  fi
}

