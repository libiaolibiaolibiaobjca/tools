PORTS=(10608)
FILE=tcp.stats


while true
do
    for p in ${PORTS[@]}; do
        echo -n `date +"%F %H:%M:%S"` >> $FILE
        echo -n $'\t'"$p"$'\t' >> $FILE
        echo -n $'\t'"总"$'\t' >> $FILE
        echo -n `netstat -ant |grep "$p"|wc -l` >> $FILE
        echo -n $'\t'"分"$'\t' >> $FILE
        echo `netstat -ant |grep "$p"|awk '{++S[$NF]} END {for (a in S) print a, S[a]}'|sort` >> $FILE
    done
    sleep 1
done
