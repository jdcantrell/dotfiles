#!/bin/bash
set -e

CONFIG_FILES=(bashrc bash_profile inputrc vimrc gitconfig)

reset=$(   tput sgr0 )
bold=$(    tput bold )
green=$(   tput setaf 2 || tput AF 2 )
txtgrn=$reset$green
bldgrn=$bold$green

TARGET=$PWD
SRC=$(dirname "${0%}")

for FILE in "${CONFIG_FILES[@]}"
do
  ln -s "$SRC/$FILE" "$TARGET/.$FILE"
  echo "${txtgrn}$TARGET/.$FILE$reset -> $SRC/$FILE"
done

read -r -p "Install local env bashrc? [y/n] " INSTALL_ENV
case "$INSTALL_ENV" in
  [yY][eE][sS]|[yY])
    case "$OSTYPE" in
      darwin*)
        ln -s "$SRC/bash.osx" "$TARGET/.bash.local"
        echo "${txtgrn}$TARGET/.bash.local$reset -> $SRC/bash.osx"
        ;;
      linux*)
        ln -s "$SRC/bash.fedora" "$TARGET/.bash.local"
        echo "${txtgrn}$TARGET/.bash.local$reset -> $SRC/bash.fedora"
        ;;
      # solaris*) echo "SOLARIS" ;;
      # bsd*)     echo "BSD" ;;
      # msys*)    echo "WINDOWS" ;;
      *)
        echo "No local env bashrc to install for $OSTYPE"
        ;;
    esac
    ;;
  *)
    echo "Okay, skipping local env bashrc."
    ;;
esac

if [ ! -d "$HOME/.vim" ]; then
  read -r -p "Install vundle? [y/n] " INSTALL_VUNDLE
  case "$INSTALL_VUNDLE" in
    [yY][eE][sS]|[yY])
      git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
      ;;
    *)
      echo "Okay, skipping vundle install."
      ;;
  esac
fi

echo "${bldgrn}Done!${reset}"
