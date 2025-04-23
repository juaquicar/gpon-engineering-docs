#!/bin/bash
clear
function fun_entrar {
	clear
	echo -n "Direccion del host: "
	read host      #Direccion de la cabecera
	echo -n "Usuario: "
	read user      #Usuario telnet de la cabecera
	echo -n "Password: "
	read pass
}

function fun_listar {
clear
cmd0="q"
cmd_enable="enable"
cmd_config="config"
cmd_display_board="display board 0/0"
cmd_intro="\n"

	echo -n "Buscando..."
	
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
		echo ${cmd_display_board}
		sleep 4
		echo ${cmd_intro}
		sleep 2
		) | telnet > listar_ont.txt
		clear
echo "  F/S/P   ONT         SN         Control     Run      Config   Match    Protect"
echo "          ID                     flag        state    state    state    side"
echo "  -----------------------------------------------------------------------------"
cat listar_ont.txt | grep  "0/ 0/*" | grep "active"
echo " "
rm listar_ont.txt
}


if [ $# -eq 0 ]
then
	fun_entrar

else
	host=$1
	user=$2
	pass=$3

fi








#menu

menu=1
until [ $menu -eq 4 ]
do
	echo "************************"
        echo "*  OLT HUAWEI MA5603T  *"
	echo "*     Grupo Afronta    *"
        echo "************************"
	echo "   __________________ "
	echo "  +                  +"
	echo "  | 1. Registrar ONT |"
	echo "  | 2. Eliminar  ONT |"
	echo "  | 3. Listar ONTs   |"
	echo "  |                  |"
	echo "  | 4. Volver        |"
	echo "  +__________________+"
	echo " "
	echo "************************"
	echo -n  "Seleccione una opcion: "
		read menu
		case $menu
		in
        	1)
			clear
			echo "**********************"
                        echo "*    Alta cliente    *"
                        echo "**********************"
			echo " "
			echo  -n "Board:[0,1,2,3,4,5,6,7,8,9,10,11,12]: "
			read tarjeta1

			cmd0="q"
			cmd_enable="enable"
			cmd_config="config"
			cmd_interface_gpon="interface gpon 0/0"
			echo -n "Puerto GPON [0,1,2,3,4,5,6,7]: "
			read puerto1
			cmd_display_board="display ont autofind $puerto1"
			cmd_intro="\n"
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
				echo ${cmd_interface_gpon}
				sleep 4
				echo ${cmd_display_board}
				sleep 2
			) | telnet > prueba.txt
			clear
			echo "**********************"
                        echo "*    Alta cliente    *"
                        echo "**********************"

			

			if [ -z `cat prueba.txt | grep  "Ont SN" | cut -d ":" -f 2` ]
				then
					echo "No se ha localizado ninguna ONT disponible"
					echo "Pulse una tecla para continuar"
					read
					./aprovisionar.sh $1 $2 $3
				else
					echo " SN"
					echo " ------------------"
					cat prueba.txt | grep  "Ont SN" | cut -d ":" -f 2
					rm prueba.txt
			

			echo " "
			echo -n "ONU: "
			read id1
			echo -n "Numero de serie (SN) de una ONT [XXXXXXXXXXXXXXXX]: "
			read sn1
			#Listado de comandos de la OLT dar de alta
			cmd0="q"
			cmd_enable="enable"
			cmd_config="config"
			cmd3="interface gpon 0/0"
			cmd4="ont add $puerto1 $id1 sn-auth $sn1 omci ont-lineprofile-id 10 ont-srvprofile-id 10 desc ont-registrada"
			cmd5="quit"
			cmd6="service-port 1$id1 vlan 100 gpon 0/$tarjeta1/$puerto1 ont $id1 gemport 1 multi-service user-vlan 100 tag-transform translate inbound traffic-table index 100 outbound traffic-table index 100"
			cmd7="service-port 2$id1 vlan 200 gpon 0/$tarjeta1/$puerto1 ont $id1 gemport 2 multi-service user-vlan 200 tag-transform translate inbound traffic-table index 101 outbound traffic-table index 101"
			cmd8="service-port 5$id1 vlan 500 gpon 0/$tarjeta1/$puerto1 ont $id1 gemport 3 multi-service user-vlan 500 tag-transform translate inbound traffic-table index 102 outbound traffic-table index 102"

			#Conexion telnet
			(echo open ${host}
				sleep 1
				echo ${user}
				sleep 2
				echo ${pass}
				sleep 2
				echo ${cmd0}
				sleep
				echo ${cmd_enable}
				sleep 3
				echo ${cmd_config}
				sleep 3
				echo ${cmd3}
				sleep 3
				echo ${cmd4}
				sleep 3
				echo ${cmd5}
				sleep 4
				echo ${cmd6}
				sleep 4
				echo ${cmd7}
				sleep 4
				echo ${cmd8}
				sleep 4
			) | telnet
			clear
			echo " "
			echo " "
			echo "La ONT  " $sn1 " se ha registrado en el puerto " $puerto1 " con el OID " $id1 
			echo " "
			echo -n "Pulse una tecla para volver al menu"
			read
			clear
		fi
		;;

		2)
		clear
		echo "**********************"
		echo "*  Eliminar cliente  *"
		echo "**********************"
		echo " "
		fun_listar
		echo -n "Puerto GPON [0,1,2,3,4,5,6,7]: "
		read puerto
		echo -n "ONT ID: "
		read id

		#Listado de comandos de la OLT para eliminar
		cmd0="q"
		cmd1="enable"
		cmd2="config"
		cmd9="undo service-port 1$id"
		cmd10="undo service-port 2$id"
		cmd11="undo service-port 5$id"
		cmd12="quit"
		cmd13="interface gpon 0/0"
		cmd14="ont delete $puerto $id"
			(echo open ${host}
				sleep 1
				echo ${user}
				sleep 1
				echo ${pass}
				sleep 2
				echo ${cmd0}
				sleep 2
				echo ${cmd1}
				sleep 2
				echo ${cmd2}
				sleep 2
				echo ${cmd9}
				sleep 2
				echo ${cmd10}
				sleep 2
				echo ${cmd11}
				sleep 2
				echo ${cmd13}
				sleep 2
				echo ${cmd14}
				sleep 2
			) | telnet
		clear
		echo " "
		echo " "
		echo "La ONT con OID " $id " se ha eliminado correctamente"
		echo " "
		echo -n "Pulse una tecla para volver al menu"
		read
		clear
		;;

		3)
		
		fun_listar
		echo "Pulse una tecla para continuar."		
		read
		clear
		./aprovisionar.sh $host $user $pass		
		;;

		4)
		./script.sh $host $user $pass
		;;
esac
done

