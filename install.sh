#!/bin/bash

SHELL_DIR=$(cd "$(dirname "$0")";pwd)
DIR_NAME=${SHELL_DIR##*/}
INSTALL_DIR=$1
if [[ "X$INSTALL_DIR" == "X" ]]; then
  echo "usage: ./install.sh [TARGET_PATH]"
  exit -1
fi

mkdir -p $INSTALL_DIR
cp -r $SHELL_DIR $INSTALL_DIR
rm $INSTALL_DIR/$DIR_NAME/install.sh

rm /usr/local/bin/gof
ln -s $INSTALL_DIR/$DIR_NAME/format_go /usr/local/bin/gof
echo "install finish! try" '`gof main.go`'
