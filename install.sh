#!/bin/bash

SHELL_DIR=$(cd "$(dirname "$0")";pwd)
DIR_NAME=${SHELL_DIR##*/}
INSTALL_DIR=$1
if [[ "X$INSTALL_DIR" == "X" ]]; then
  INSTALL_DIR=/usr/local/share/gof
fi
set -x

echo "install in $INSTALL_DIR"
rm -rf $INSTALL_DIR
mkdir -p $INSTALL_DIR
cp -r $SHELL_DIR $INSTALL_DIR
rm $INSTALL_DIR/$DIR_NAME/install.sh

rm /usr/local/bin/gof
ln -s $INSTALL_DIR/$DIR_NAME/format_go /usr/local/bin/gof
sed 's/${GOF_BIN}/gof/g' $INSTALL_DIR/$DIR_NAME/format_go_git > /usr/local/bin/gofgit
chmod u+x /usr/local/bin/gofgit
echo "install finish! try" '`gof main.go`'
