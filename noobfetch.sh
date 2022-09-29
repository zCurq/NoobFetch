#!/bin/bash

cyan='\e[0;36m'
tp='\e[0m'

source /etc/os-release

if command -v lspci &> /dev/null ; then
  export gpu=$(lspci | grep "VGA\|3D" | cut -d ":" -f3)
else
  export gpu="GPU can't found."
fi

host="$mobovendor $name $version $mobo"

echo -e "
    ___   	~ Noob Fetch ~
   |_^_|  ==========================
   |   |  $cyan OS:$tp ${PRETTY_NAME}
  _|   |_ $cyan USER:$tp $(whoami)
  |__|__| $cyan RAM USAGE:$tp $(free -m | awk 'FNR==2{ print $0 }' | awk '{ print $3}') MB
          $cyan GPU:$tp $gpu 
          =========================="
