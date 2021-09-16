#!/bin/bash

while true
do 
	
	hour=`date +"%H"`
	minute=`date +"%M"`

	if [[ "${hour#0}" -ge "7" &&  "${hour#0}$minute" -le "1129" ]]
	then 
		echo "Morning Study ${hour#0}"
		if [[ "${hour#0}" == "8" || "${hour#0}" == "10" ]]
		then
			sed -e '11 s/^#*//' -i ~/test.txt #Messager
			echo "Enable messager"
		else
			sed -e '11 s/^#*/#/' -i ~/test.txt #Messager
			echo "Disable messager"
		fi
		sed -e '12 s/^#*//' -i ~/test.txt #Youtube  
	elif [[ "$hour" == "13" || "$hour" == "15" || "$hour" == "17" || "$hour" == "19" || "$hour" == "20" ]]
	then 
		echo "Afternoon Study  $hour"
		echo "disable chat"
		sed -e '11 s/^#*/#/' -i ~/test.txt  #Messager
	elif [[ "$hour" == "14" || "$hour" == "16" || "$hour" == "18" || ("$hour" == "21" && "$minute" -le "29") ]]
	then 
		echo "Afternoon enable for play $hour"
		echo "enable chat $hour"
		echo "Disable chat at 8-9 $hour"
                sed -e '11 s/^#*//' -i ~/test.txt #Messager
		sed -e '12 s/^#*//' -i ~/test.txt #Youtube 

	elif [[ "$hour" == "22" || "$hour" == "23" ]]
	then
		echo "At night Disable all $hour"
		sed -e '11 s/^#*/#/' -i ~/test.txt
                sed -e '12 s/^#*/#/' -i ~/test.txt

	elif [[ "${hour#0}" -ge "1" && "${hour#0}$minute" -le "650" ]]
	then
		echo "Mid night Disable $hour"
		sed -e '11 s/^#*/#/' -i ~/test.txt
                sed -e '12 s/^#*/#/' -i ~/test.txt
	fi
	echo "Current Hour : $hour$minute"

	sleep 15s
done
