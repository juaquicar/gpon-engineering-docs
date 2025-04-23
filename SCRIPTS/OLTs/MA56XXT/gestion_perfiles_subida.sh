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
	user="root"
	pass="admin"
	cmd0="q"
	cmd_enable="enable"
	cmd_config="config"

	cmd_display_dba_profile="display dba-profile all"
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
			echo ${cmd_display_dba_profile}
			sleep 2
	) | telnet > prueba.txt

	i=`cat prueba.txt |wc -l`
	sed -n 38,"$i"p prueba.txt
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
echo "  | 1. Crear perfil subida      |   "
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
	listar
	echo -n "Introduce TID del nuevo perfil: "
	read id_perfil
	echo -n "Nombre perfil: "
	read nombre
	echo -n "Tipo de perfil [type1, type2, type3]: "
	read tipo
	echo -n "Ancho de banda [assure, fixed]: "
	read ancho_banda
	echo -n "Velocidad Maxima: "
	read max
	echo -n "Velocidad Maxima asegurada: "
	read max_fijo

	cmd0="q"
	cmd_enable="enable"
	cmd_config="config"
	cmd_dba_profile1="dba-profile add profile-id $id_perfil profile-name $nombre $tipo $ancho_banda $max max $max_fijo"
	cmd_dba_profile2="dba-profile add profile-id 50 profile-name "OMCI_DBA" type2 assure 5056"
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
			sleep 4
			echo ${cmd_dba_profile2}
			sleep 4
			echo ${cmd_intro}
			
	) | telnet
	clear
	./gestion_perfiles_subida.sh $1 $2 $3
	;;

	2)
	listar
	echo -n "Introduce el id del perfil que desa eliminar: "
	read profi_id

	cmd0="q"
	cmd_enable="enable"
	cmd_config="config"
	cmd_undo_profile="dba-profile delete profile-id $profi_id"

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
			echo ${cmd_undo_profile}
			sleep 3

			
	) | telnet
	clear
	./gestion_perfiles_subida.sh $1 $2 $3
	;;
	3)
	clear
	listar
	echo "Pulse una tecla para continuar"
	read
	./gestion_perfiles_subida.sh $1 $2 $3
	;;

	4)
	clear
	./script.sh $1 $2 $3
	;;

esac

