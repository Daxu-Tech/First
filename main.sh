#!/bin/bash


function permanantAlias(){

        echo "alias $1='${*:2}'" >> ~/.bashrc
        source ~/.bashrc
	source ~/.bashrc
}

	echo "Type keyword you want : "
        read -e short
        echo "Type actual keyword : "
        read -e actual
        permanantAlias $short $actual
