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

if [ $# -eq 0 ]
then
	fun_entrar

else
	host=$1
	user=$2
	pass=$3

fi

echo "****************************************"
echo "*          OLT HUAWEI MA56XXT          *"
echo "*            Juanma Quijada            *"
echo "****************************************"
echo "   _________________________________    "
echo "  +                                 +   "
echo "  | 1. Gestion de ONT               |   "
echo "  | 2. Gestion de perfiles subida   |   "
echo "  | 3. Gestion de perfiles bajada   |   "
echo "  |                                 |   "
echo "  | 4. Salir                        |   "
echo "  +_________________________________+   "
echo "                                "
echo "****************************************"
echo -n  "Seleccione una opcion: "

read menuprincipal
case $menuprincipal
in
        1)

	./provisionar.sh $host $user $pass
	;;

	2)
	./gestion_perfiles_subida.sh $host $user $pass
	;;

	3)
	./gestion_perfiles_bajada.sh $host $user $pass
	;;

	4)
	clear
	exit
	;;

esac
