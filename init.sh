#!/bin/bash - 
#===============================================================================
#
#          FILE: init.sh
# 
#         USAGE: ./init.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Jiadi Yue (Brady), jdyue19@gmail.com
#  ORGANIZATION: 
#       CREATED: 04/06/2015 10:49
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

ln -s ${SCRIPTPATH}/vim ~/.vim
ln -s ${SCRIPTPATH}/vimrc ~/.vimrc
ln -s ${SCRIPTPATH}/tmux.conf ~/.tmux.conf
[[ -f ~/.bashrc ]] && { mv ~/.bashrc ~/.bashrc_back }
ln -s ${SCRIPTPATH}/bashrc ~/.bashrc
