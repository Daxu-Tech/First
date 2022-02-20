#!/bin/bash


function permanantAlias(){

        echo "alias $1='${*:2}'" >> ~/.bashrc
        source ~/.bashrc
	source ~/.bashrc
}


function LogMonitor(){

        now=$(date +'%b %d')
        addError="/var/log/apache2/error.log"
        addSys="/var/log/syslog"
        last=$(sudo tail -1 $addSys | awk '{print $1, $2}')
        echo ":$last:"
        echo ":$now:"
        if [ "$now" != "$last" ]
        then
                echo "No new Logs. This is your logs from yesterday"
                sudo cat /var/log/syslog | grep "$last" | more

        else
                echo "Yours New Logs are : "
                sudo cat /var/log/syslog | grep "$now" | more

        fi

}

echo "what you want to achieve? "
echo " 1.Permanent Alias"
echo " 2.Log Monitoring"
read choice


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

   3)
	Scan
	;;

   *)
	echo "Error"

esac
