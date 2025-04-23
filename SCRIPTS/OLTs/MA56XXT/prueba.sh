#!/bin/bash
clear


	host=192.168.88.25
	user="root"
	pass="admin"
	cmd0="q"
	cmd_enable="enable"
	cmd_config="config"

	cmd_traffic="display traffic table ip from-index 0"
	cmd_intro=""
		(echo open ${host}
			sleep 1
			echo ${user}
			sleep 1
			echo ${pass}
			sleep 1
			echo ${cmd0}
			sleep 2
			echo ${cmd_enable}
			sleep 3
			echo ${cmd_config}
			sleep 3
			echo ${cmd_traffic}
			sleep 2
			echo ${cmd_intro}
			sleep 2
	) | telnet > prueba.txt
	clear
	i=`cat prueba.txt |wc -l`

	sed -n 42,"$i"p prueba.txt

