#!/bin/bash
#convert sounds to .ogg format
#

# check for variable to be populated
if [ -z $1 ]; then
  echo $0 file-to-convert
  exit 1
fi

#check for oggenc to be installed
if [ ! -f /usr/bin/oggenc ]; then
  echo "Tools not installed,"
  echo "Run this command: sudo apt-get install vorbis-tools"
  exit 0
fi

#manipulate outfile name
out=$(echo $1 | awk -F \/ '{print $NF}' | awk -F . '{print $1}')

#convert
/usr/bin/oggenc -q 6 $1 -o $out\.ogg

#end
