#!/bin/bash

###################################################### A propos #######################################################################################

#Title........: CapCleaner.sh
#Date.........: 08/07/2018
#Version......: 2.0
#Usage........: bash CapCleaner.sh
#Bash version : 4.4.23(1)
#Kali version : 4.17.0-kali3-amd64
#Nvidia drivers version : 390.77-1
#Nvidia cuda toolkit version : 8.0.44-4
#GPU : GeForce GTX 460M

###################################################### Fonctions utiles ###############################################################################

clear

intro10="
------------------------------------------------------------------------------------------------------------------------------------------------------

				#######################################################################.
				#               \033[34m\033[1m  Meckwells # 08/07/2018 # CapCleaner.sh       \033[0m	       #
				#  .................:            v2.x              :.................  #
				#  :                :..............................:                :  #
				#  :        A simple way to clean your *.cap storage folder         :  #
				#  :         Developped originally for Kali Linux distributions	    :  #
				#  :       	        Brought to you by Meckwells	            :  #
				#  :                                               .................:  #
				#  :                                               : \033[34m\033[1mMeckwells@2018\033[0m :  #
				#  :...............................................:................:  #
				#                     \033[34m\033[1mbash CapCleaner.sh\033[0m		               #
				\`######################################################################'

------------------------------------------------------------------------------------------------------------------------------------------------------"

	#### Maîtrise des signaux de sortie

function trapCtrlC() {

	echo -e " \033[31m\033[1m--------------------------------------------------- 		Arrêt du script        ---------------------------------------------------------------\033[0m"
	echo -e '\033[1m\n\E[2KCtrl+C pressed... Stopping CapCleaner...\033[0m'
	echo


	echo -e " \033[33m\033[1m => Open erased cap file list [Y/n] ? \033[0m "
	echo
	read suivant
	echo

			################ Limitation des choix utilisateurs suivant
			lim_varsuivant
			################ Limitation des choix utilisateurs suivant


	if [[ $suivant == "Y" ]] ; then
		gedit $cap_invalides
		gedit $cap_valides
	else
		echo -e " \033[32m\033[1m => Liste partielle des fichiers cap invalides lors de la dernière session disponible $cap_invalides... \033[0m "
		echo -e " \033[32m\033[1m => Liste partielle des fichiers cap valides lors de la dernière session disponible $cap_valides... \033[0m "
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

	#### Limitation choix utilisateur

echo -e "$intro10"
figlet -c "Crackinall 2018"
echo

echo -e "\033[33m\033[1m Select a folder to run CapCleaner [default : /root/fichierscap/*.cap]\033[0m  "
echo
read folder

echo
echo -e "\033[33m\033[1m Select a path for the erased cap file list : [Ex : /root/crackilogs/cap_invalides.txt] \033[0m  "
echo
read cap_invalides


echo
echo -e "\033[33m\033[1m Select a path for the valid cap file list : [Ex : /root/crackilogs/cap_valides.txt] \033[0m  "
echo
read cap_valides

echo
echo -e "\033[33m\033[1m Délai entre chaque itération : [ Ex : 0-1-2-3-4... ] \033[0m  "
echo
read delta


echo
echo -e "\033[32m\033[1m=> Analyse Pyrit de l'intégrité du handshake pour chaque fichier cap...\033[0m "
echo
	#### Boucle récursive d'analyse Pyrit pour chaque fichier du dossier sélectionné

echo -e "Liste des fichiers cap non valide effacés : " >> $cap_invalides
echo >> $cap_invalides

echo -e "Liste des fichiers cap valides conservés : " >> $cap_valides
echo >> $cap_valides

for file in $folder

	do

		chmod u+x $file
		echo
		echo
		pyrit -r $file analyze
		var_code=$?	
		echo $var_code
		echo
		echo -e "\033[34m\033[1m $file -------------------------------------------------------------- \033[0m"
		echo
if [[ ! $var_code == 0 ]]; then

		echo -e "\033[31m\033[1m 
				=> Handshake non valide, fichier cap inutilisable...\033[0m
			
			      	\033[31m\033[1m=> Nettoyage du fichier dans le dossier...\033[0m "
		echo		
		rm $file
		date >> $cap_invalides
		echo "$file" >> $cap_invalides

	else
		echo -e "
			$file : \033[32m\033[1m=> Handshake valide, fichier cap utilisable...\033[0m "
		echo
		date >> $cap_valides
		echo "$file" >> $cap_valides
	fi

		echo
		echo
		echo -e "\033[34m\033[1m $file -------------------------------------------------------------- \033[0m"
		sleep $delta
done

	#### Boucle récursive d'analyse Pyrit pour chaque fichier du dossier sélectionné

	#### Suppressions des fichiers .CSV et KISMET créés par Airodump
echo
echo -e " \033[33m\033[1m => Suppression des fichiers .CSV et KISMET [Y/n] ? \033[0m "
echo
read suivant

			################ Limitation des choix utilisateurs suivant
			lim_varsuivant
			################ Limitation des choix utilisateurs suivant


if [[ $suivant == "Y" ]] ; then

echo -e "\033[31m\033[1m => Suppression des fichiers .CSV & .netxml créés par Airodump-ng...\033[0m"
echo
echo -e "\033[33m\033[1m Select a folder to erase .csv files [default : /root/fichierscap/*.csv]\033[0m  "
echo
read foldercsv
echo
echo -e "\033[33m\033[1m Select a folder to erase netxml files [default : /root/fichierscap/*.netxml]\033[0m  "
echo
read foldernetxml
echo

	for file in $foldercsv

		do

			echo		
			rm $file
	done 

	for file in $foldernetxml

		do

			echo		
			rm $file
	done 

else
	echo
	echo -e " \033[33m\033[1m => fichiers netxml & .csv conservés dans le dossier $foldercsv \033[0m "
fi

	#### Suppressions des fichiers .CSV et KISMET créés par Airodump 


	#### Ouverture des listes de fichiers cap valides et / ou invalides

echo
echo -e " \033[33m\033[1m => Open erased cap file list [Y/n] ? \033[0m "
echo
read suivant

			################ Limitation des choix utilisateurs suivant
			lim_varsuivant
			################ Limitation des choix utilisateurs suivant


if [[ $suivant == "Y" ]] ; then
	gedit $cap_invalides
	gedit $cap_valides
else
	echo
	echo -e " \033[32m\033[1m => Liste des fichiers cap utilisés lors de la dernière session disponible $cap_valides... \033[0m "
	echo
		echo -e " \033[32m\033[1m => Liste des fichiers cap utilisés lors de la dernière session disponible $cap_invalides... \033[0m "
fi
echo

	#### Ouverture des listes de fichiers cap valides et / ou invalides


