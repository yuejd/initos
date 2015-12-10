#!/bin/bash - 
#===============================================================================
#
#          FILE: init.sh
# 
#         USAGE: ./init.sh 
# 
#   DESCRIPTION: initial os with vimrc tmux bashrc
#        AUTHOR: Jiadi Yue (Brady), jdyue19@gmail.com
#  ORGANIZATION: 
#       CREATED: 04/06/2015 10:49
#===============================================================================

set -o nounset                              # Treat unset variables as an error

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

ln -s ${SCRIPTPATH}/vim ${HOME}/.vim
ln -s ${SCRIPTPATH}/vimrc ${HOME}/.vimrc
ln -s ${SCRIPTPATH}/tmux.conf ${HOME}/.tmux.conf
ln -s ${SCRIPTPATH}/tmux ${HOME}/.tmux
[ -e ${HOME}/.bashrc ] && mv ${HOME}/.bashrc ${HOME}/.bashrc_back
ln -s ${SCRIPTPATH}/bashrc ${HOME}/.bashrc

echo "completed"
