#!/usr/bin/bash

menu(){
	echo "Menu de opciones:"
	echo "1: Listar contenido de un fichero"
	echo "2: Crear txt con contenido personalizado"
	echo "3: Comparar dos ficheros"
	echo "4: Ejemplo de uso con awk"
	echo "5: Ejemplo de uso con grep"
	echo -e "6: Salir \n"
}

action1_print(){
	dir_path=""
	read -p "Introduce la dirección de la carpeta > " dir_path
	if [ -d "$dir_path" ]; then
		ls -lah "$dir_path"
	else
		echo "Error: $dir_path no es un directorio valido o no existe"
	fi
}

action2_create(){
	text=""
	read -rep "$( echo -e 'Ingresa el texto que quieras guardar\n> ')" text
	echo "$text" > "$(pwd)/archivo.txt"
	echo "Archivo creado: $(pwd)/archivo.txt"
	echo "Contenido: $(cat $(pwd)/archivo.txt)"
}

action3_diff(){
	file1_path=""
	file2_path=""
	read -p "$( echo -e 'Introduce la dirección del primer archivo\n> ')" file1_path
	if [ ! -f $file1_path ]; then
		while true
		do
			read -p "$( echo -e 'Error: No encontrado, intentalo de nuevo\n> ')" file1_path
			if [ -f $file1_path ]; then
				break
			fi
		done
	fi
	read -p "$( echo -e 'Introduce la dirección del segundo archivo\n> ')" file2_path
	if [ ! -f $file2_path ]; then
		while true
		do
			read -p "$( echo -e 'Error: No encontrado, intentalo de nuevo\n> ')" file2_path
			if [ -f $file2_path ]; then
				break
			fi
		done
	fi
	echo -e "\n"
	diff "$file1_path" "$file2_path"
}

action4_awk(){
	echo "Commando: lspci | awk '/Audio/ {print NR,\$1}'"	
	lspci | awk '/Audio/ {print NR,$1}'
}

action5_grepping(){
	echo "Commando: uname -a | grep --color="auto" 'Linux'"
	uname -a | grep --color="auto" 'Linux'
}

while true
do	
clear
menu
read -p ">> " opt
clear
case $opt in 
	1)
		action1_print
		echo -e "\n[Presiona enter para continuar]"
		read -r 
	;;
	2)
		action2_create
		echo -e "\n[Presiona enter para continuar]"
		read -r 
	;;
	3)
		action3_diff
		echo -e "\n[Presiona enter para continuar]"
		read -r 
	;;
	4)
		action4_awk
		echo -e "\n[Presiona enter para continuar]"
		read -r 
	;;
	5)
		action5_grepping
		echo -e "\n[Presiona enter para continuar]"
		read -r 
	;;
	6)
		echo "Exiting..."
		exit 0
	;;
	*)
		echo "Opción no valida"
		echo -e "\n[Presiona enter para continuar]"
		read -r 
	;;
esac
done