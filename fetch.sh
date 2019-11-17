echo $(whoami)@$(uname -n)

echo "Kernel Version:" $(uname -r)

echo "CPU: $(cat /proc/cpuinfo | grep "model name" | awk 'FNR == 1 { print $4 " " $6}')"

cat /proc/meminfo | grep "MemTotal" | awk 'FNR ==1 {print "RAM: "$2 /1000000" GB"}'

echo pkgs: $(pacman -Q | wc -l)

seconds="$(< /proc/uptime)"
seconds="${seconds/.*}";

hours="$((seconds/3600%24))"
mins="$((seconds/60%60))"

echo Uptime: $hours hours, $mins mins
