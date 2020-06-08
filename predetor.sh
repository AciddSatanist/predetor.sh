#!/bin/bash


figlet PREDETOR

echo "[*]Start the operation..."

read -p "[*]Target:" tar1

read -p "[*]Protocol:" tar2

#read -P "[*]port:" tar3

echo "[*]Aim the:" $tar2"://"$tar1

echo "[*]lock and load"
 
cd log

sudo whatweb $tar1 >> $tar1.txt 

tar3=$(grep -o '[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*' $tar1.txt)

gnome-terminal -- bash -c "nikto -h $tar2\://$tar1; bash"

gnome-terminal -- bash -c "dirb $tar2\://$tar1; bash"

gnome-terminal -- bash -c "sudo nmap -sS -sV -A -p- $tar3; bash"

#gnome-terminal --tab -e "nikto -h $tar2\://$tar1"

#gnome-terminal --tab -e "dirb $tar2\://$tar1"

#gnome-terminal --tab -e "sudo nmap -sS -sV -A -p- $tar3"

echo "[*][*][*][*]"
