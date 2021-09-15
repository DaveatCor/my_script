#!/bin/bash

while true
do 
	
	hour=`date +"%H"`
	minute=`date +"%M"`

	if [[ "$hour" -ge "07" && "$hour$minute" -le "1130" ]]
	then 
		echo "Study $hour"
                sed -e '11 s/^#*/#/' -i ~/test.txt #Messager
		sed -e '12 s/^#*//' -i ~/test.txt #Youtube 
	elif [[ "$hour" == "13" || "$hour" == "15" || "$hour" == "17" || "$hour" == "19" || "$hour" == "20" ]]
	then 
		echo "Study  $hour"
		echo "disable chat"
		sed -e '11 s/^#*/#/' -i ~/test.txt  #Messager
		sed -e '12 s/^#*//' -i ~/test.txt  #Messager
	elif [[ "$hour" == "14" || "$hour" == "16" || "$hour" == "18" || [["$hour" == "21" && "$minute" -le "29"]] ]]
	then 
		echo "enable for play $hour"
		echo "enable chat $hour"
		echo "Disable chat at 8-9 $hour"
                sed -e '11 s/^#*//' -i ~/test.txt #Messager
		sed -e '12 s/^#*//' -i ~/test.txt #Youtube 

	elif [[ "$hour" == "22" || "$hour" == "23" ]]
	then
		echo "Disable all $hour"
		sed -e '11 s/^#*/#/' -i ~/test.txt
                sed -e '12 s/^#*/#/' -i ~/test.txt

	elif [[ "$hour" -ge "01" && "$hour$minute" -le "0650" ]]
	then
		echo "Disable $hour"
		sed -e '11 s/^#*/#/' -i ~/test.txt
                sed -e '12 s/^#*/#/' -i ~/test.txt
	fi
	echo "Current Hour : $hour$minute"

	sleep 15s
done
