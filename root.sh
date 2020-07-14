#! /bin/bash
# Just upgrade mint
echo "Upgrading mint..."
ping -c 1 kernel.org > /dev/null
if [ $? != 0 ]; then 
	echo "Pas de connection réseau!"
	exit 1
fi 
echo "Connecté au réseau!"
echo "Attention!"
echo "Avant de mettre a jour Linux Mint il est recommandé de faire une sauvegarde de vos documents ! Pour cela vous pouvez utiliser le logiciel TimeShift pour le faire."
echo "Présentation du logiciel: https://www.youtube.com/watch?v=66sE2y9pQiQ"
echo "Continuer? [y/n]"
read rep 
if [ $rep != "y" ]; then 
	echo "Exiting..." 
	exit 1
fi

if [ $UID != 0 ]; then
	echo  "Ce script nécéssite d'être lancé en tant que root!"
	exit 1
fi
if [ ! -f "/usr/bin/mintinstall" ]; then 
	echo "Ce script ne peut que être exécuté sur Linux Mint! "
	exit 1
fi	
echo "Le système est pret! Lancement de la première partie de la mise à jour"
dpkg -l | grep chromium-browser > /dev/null 
if [ $? == 0 ]; then
	echo "Le navigateur chromium ne sera plus disponible après la mise à jour. Voulez vous le désinstaller? "
	echo "Vous pourrez le réinstaller avec le script Post-installation fourni avec ce script."
	read chromium
	if [ $chromium == "y" ]; then 
		echo "Désinstallation de chromium..."
		yes | apt autoremove chromium-browser > /dev/null 
	fi
fi
echo "Mise à jour des paquets déjà installés"
apt update > /dev/null
yes | apt upgrade 
yes | apt autoclean

echo "Vérification du paquet MintUpgrade"
if [ $(command -v "mintupgrade") ]; then 
	echo "Le paquet est déjà installé"
else
	echo "Le paquet va être installé"
	yes | apt install mintupgrade 
fi
