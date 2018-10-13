#!/bin/bash

clear

###################################################### A propos #######################################################################################

#Title........: (DPC) dicos_pyrit_concatenator.sh
#Date.........: 08/07/2018
#Version......: 2.0
#Usage........: bash dicos_pyrit_concatenator.sh
#Bash version : 4.4.23(1)
#Kali version : 4.17.0-kali3-amd64
#Nvidia drivers version : 390.77-1
#Nvidia cuda toolkit version : 8.0.44-4
#GPU : GeForce GTX 460M

###################################################### Fonctions utiles ###############################################################################

intro10="
------------------------------------------------------------------------------------------------------------------------------------------------------

				########################################################################
				# \033[34m\033[1m  Meckwells # 08/07/2018 # dicos_pyrit_concatenator (DPC).sh\033[0m         #
				#  .................:            v2.x              :.................  #
				#  :                :..............................:                :  #
				#  : A simple way to auto concatenate your small dicos file < 100MO :  #
				#  :			                                            :  #
				#  :         	#Bash version : 4.4.23(1)			    :  #
				#  :		#Kali version : 4.17.0-kali3-amd64                  :  #
				#  :		#Nvidia drivers version : 390.77-1	            :  #
				#  :		#Nvidia cuda toolkit version : 8.0.44-4             :  #
				#  :		#GPU : GeForce GTX 460M	            		    :  #
				#  :                                               .................:  #
				#  :                                               : \033[34m\033[1mMeckwells@2018\033[0m :  #
				#  :...............................................:................:  #
				#                     \033[34m\033[1mbash dicos_pyrit_concatenator (DPC).sh\033[0m	       #
				\`######################################################################'

------------------------------------------------------------------------------------------------------------------------------------------------------"

	#### Maîtrise des signaux de sortie

function trapCtrlC() {

	echo -e " \033[31m\033[1m--------------------------------------------------- 		Arrêt du script        ---------------------------------------------------------------\033[0m"
	echo -e '\033[1m\n\E[2KCtrl+C pressed... Stopping CapCleaner...\033[0m'
	echo


	echo -e " \033[33m\033[1m => Open erased dico file list [Y/n] ? \033[0m "
	echo
	read suivant
	echo

			################ Limitation des choix utilisateurs suivant
			lim_varsuivant
			################ Limitation des choix utilisateurs suivant


	if [[ $suivant == "Y" ]] ; then
		gedit $dico_invalides
		gedit $dico_valides
	else
		echo -e " \033[32m\033[1m => Liste partielle des fichiers dico invalides lors de la dernière session disponible $dico_invalides... \033[0m "
		echo -e " \033[32m\033[1m => Liste partielle des fichiers dico valides lors de la dernière session disponible $dico_valides... \033[0m "
	fi
	echo
	echo -e " \033[31m\033[1m---------------------------------------------------- 		Arrêt du script        ---------------------------------------------------------------\033[0m"
	echo
	sleep 2
	exit
 	trap trapCtrlC 2
}

trap trapCtrlC 2

	#### Maîtrise des signaux de sortie
	
	
	#### Limitation choix utilisateur

function lim_varsuivant {

while [ -z $suivant ]
do 
	echo -e " \033[36m\033[1mMauvais choix, veuillez réessayer... :\033[0m " 
	echo
	read suivant
done

while [ $suivant != "n" ] && [ $suivant != "Y" ] 
do 
	echo -e " \033[36m\033[1mMauvais choix, veuillez réessayer... :\033[0m "
	echo
	read suivant
done

}

echo -e "$intro10"
figlet -c "DPC   -   2018"
echo

echo -e "\033[33m\033[1m Select a folder to run DPC [default : /root/Dictionnaires/mini/*]\033[0m  "
echo
read folder
echo

echo -e "\033[33m\033[1m Select a folder to save DPC logs [default : /root/crackilogs]\033[0m  "
echo
read logs
echo
mkdir $logs
var_code=$?
echo

while [[ ! $var_code == 0 ]]; do

	echo
	echo -e "\033[33m\033[1m Dossier non créé, veuilez sélectionner un autre chemin [default : /root/crackilogs] :\033[0m  "
	echo
	echo -e "\033[33m\033[1m Select a folder to save DPC logs [default : /root/crackilogs]\033[0m  "
	echo
	read logs
	echo
	mkdir $logs
	var_code=$?
done

echo
echo -e "\033[32m\033[1m Logs folder created...\033[0m  "

echo
echo -e "\033[33m\033[1m Select a path for the valid dicos file list : [Ex : /root/crackilogs/dico_valides.txt] \033[0m  "
echo
read dico_valides

echo
echo -e "\033[33m\033[1m Select a path for the erased dicos file list : [Ex : /root/crackilogs/dico_invalides.txt] \033[0m  "
echo
read dico_invalides

echo
echo -e "\033[33m\033[1m Délai entre chaque itération : [ Ex : 0-1-2-3-4... ] \033[0m  "
echo
read delta

echo -e "Liste des fichiers dicos non valides : " >> $dico_invalides
echo >> $dico_invalides

echo
echo -e "\033[32m\033[1m=> Début du transfert des dictionnaires sélectionnés dan la BDD Pyrit...\033[0m "
echo
	#### Boucle récursive d'analyse Pyrit pour chaque fichier du dossier sélectionné

for file in $folder

	do

		echo
		echo
		pyrit -i $file import_passwords
		var_code=$?	
		echo $var_code
		echo
		echo -e "\033[34m\033[1m $file -------------------------------------------------------------- \033[0m"
		echo

if [[ ! $var_code == 0 ]]; then

		echo -e "\033[31m\033[1m => Fichier dictionnaire non importé dans la BDD et inutilisable...\033[0m"
		echo		
		#rm $file
		date >> $dico_invalides
		echo "$file" >> $dico_invalides
	else
		echo -e "
			$file : \033[32m\033[1m=> Fichier dictionnaire importé dans la BDD Pyrit et utilisable...\033[0m "
		echo
		date >> $dico_valides
		echo "$file" >> $dico_valides
		echo
	fi

		echo
		echo
		echo -e "\033[34m\033[1m $file -------------------------------------------------------------- \033[0m"
		sleep $delta
done

	#### Boucle récursive d'analyse Pyrit pour chaque fichier du dossier sélectionné
