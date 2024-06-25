#!/bin/bash

host="$(whoami)@$(uname -n)"
size=${#host}

repeat(){
    for ((i=1; i<=$1; i++)); do
        echo -n "$2"
    done
    echo
}

echo "$host"
repeat $size "-"

echo "Kernel Version:" $(uname -r)

echo "CPU: $(cat /proc/cpuinfo | grep "Model" | awk 'FNR == 1 {print substr($0, index($0,$4))}')"

cat /proc/meminfo | grep "MemTotal" | awk 'FNR ==1 {print "RAM: "$2 /1000000" GB"}'

#echo pkgs: $(pacman -Q | wc -l)
echo PKGS: $(dpkg -l | grep -c '^ii')

seconds="$(< /proc/uptime)"
seconds="${seconds/.*}";

hours="$((seconds/3600%24))"
mins="$((seconds/60%60))"

echo Uptime: $hours hours, $mins mins

# temperature query
echo "SOC Temp: $(/usr/bin/vcgencmd measure_temp | awk -F "[=']" '{ print $2 }')'C"
