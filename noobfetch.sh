#!/bin/bash

cyan="\e[0;36m"
red="\033[1;31m"
tp="\e[0m"

source "/etc/os-release"

if command -v lspci &> /dev/null ; then
  export gpu=$(lspci | grep "VGA\|3D" | cut -d ":" -f3 | awk 'NR==1{print}')
else
  export gpu="Patato xD"
fi

host="$mobovendor $name $version $mobo"

echo -e "
\t\t~ Noob Fetch ~
\t==========================
   ${red}___${tp}   
  ${red}|_^_|	$cyan SHELL:\t $tp   ${SHELL}
  ${red}|   | $cyan OS:\t$tp    ${PRETTY_NAME}
  ${red}|   | $cyan CPU:\t$tp    $(lscpu | grep 'Model name' | cut -f 2 -d ":" | awk '{$1=$1}1') ($(awk '/model name/ { print($0) } ' "/proc/cpuinfo" | awk -F ":" '{print($2)}' | wc -l))
  ${red}|   | $cyan USER:\t$tp    ${USER}
  ${red}|   | $cyan RAM USAGE:$tp $(awk '($1 == "MemFree:") {print($2 / 1024)}' "/proc/meminfo") MB
 ${red}|__|__|$cyan GPU:\t$tp    $gpu

\t==========================
"
