#!/bin/bash

file=$1
filename=`basename $file`
PYREVERSE="$(which pyreverse)"
PY_FLAG="-A -S --ignore=test"
#PY_FLAG="-k --ignore=test"
DOT="$(which dot)"

# -A�������࣬-S����������-p���ɵ��ļ������������classes_$file.dot
# fienaem.ext: ${file%.*} ${file##*.}
$PYREVERSE $PY_FLAG -p ${filename%.*} $file

# read dot by 'xdot'(ubuntu), 'dotty'(windows)
DOTFILE="classes_${filename%.*}"
#$DOT -Tpng $DOTFILE.dot > $DOTFILE.png
dot -Tjpg $DOTFILE.dot > $DOTFILE.jpg
