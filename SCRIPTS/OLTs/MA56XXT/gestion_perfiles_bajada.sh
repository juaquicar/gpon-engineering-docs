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

function listar {
	clear
	echo -n "Buscando..."
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
}

if [ $# -eq 0 ]
then
	fun_entrar

else
	host=$1
	user=$2
	pass=$3

fi

echo "***********************************"
echo "*        OLT HUAWEI MA5603T       *"
echo "*          Grupo Afronta          *"
echo "***********************************"
echo "   ______________________________   "
echo "  +                             +   "
echo "  | 1. Crear perfil bajada      |   "
echo "  | 2. Eliminar perfil          |   "
echo "  | 3. Listar                   |   "
echo "  |                             |   "
echo "  | 4. Volver                   |   "
echo "  +_____________________________+   "
echo "                                    "
echo "***********************************"
echo -n  "Seleccione una opcion: "

read menuprincipal
case $menuprincipal
in
        1)
	clear
	listar
	echo -n "Introduce TID del nuevo perfil: "
	read id_perfil
	echo -n "Ancho de banda: "
	read ancho_banda
	echo -n "Velocidad Maxima: "
	read max
	echo -n "Velocidad Maxima asegurada: "
	read max_fijo
	echo -n "Prioridad del perfil [0,1,2,3,4,5,6,7]"
	read prioridad

	cmd0="q"
	cmd_enable="enable"
	cmd_config="config"
	cmd_dba_profile1="traffic table ip index $id_perfil cir $ancho_banda pir $ancho_banda priority $prioridad priority-policy local-Setting"
			  traffic table ip index 100 cir 102400 pir 102400 priority 0 priority-policy local-Setting

	cmd_intro=" "
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
			echo ${cmd_dba_profile1}
			sleep 4
			echo ${cmd_intro}
			
	) | telnet
	clear
	./gestion_perfiles_bajada.sh $1 $2 $3
	;;

	2)
	listar
	echo -n "Introduce el TID del perfil que desa eliminar: "
	read traffic_id
	
	cmd0="q"
	cmd_enable="enable"
	cmd_config="config"
	cmd_undo_traffic="undo traffic table ip index  $traffic_id"
	

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
			echo ${cmd_undo_traffic}
			sleep 3

			
	) | telnet
	clear
	./gestion_perfiles_bajada.sh $1 $2 $3
	;;

	3)
	clear
	listar
	echo "Pulse una tecla para continuar"
	read
	./gestion_perfiles_bajada.sh $1 $2 $3
	;;
	4)
	clear
	./script.sh $1 $2 $3
	;;

esac


