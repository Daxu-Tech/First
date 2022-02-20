#!/bin/bash


function permanantAlias(){

        echo "alias $1='${*:2}'" >> ~/.bashrc
        source ~/.bashrc
	source ~/.bashrc
}

function Scan(){
        sudo nmap -sS 198.168.1.0/24 -oG scan.txt
        cat scan.txt | grep Host | cut -d ' ' -f2 | sort -u
}

echo " What you want to perform ? "
echo " 1.Permanent Alias"
echo " 2.Scan a network"
read choice


case $choice in

   1)
	echo "Type keyword you want : "
        read -e short
        echo "Type actual keyword : "
        read -e actual
        permanantAlias $short $actual
	;;

   2)
	LogMonitor
	;;

   *)
	echo "Error"
	;;

esac
