#! /bin/bash
if [ $UID == 0 ]; then 
	echo "Ce script ne doit pas être lancé en tant que root"
	exit 1 
fi
SCRIPTDIR="$HOME/woomy-update-mint"
echo "Téléchargement des scripts..."
ping -c 1 kernel.org > /dev/null
if [ $? != 0 ]; then 
	echo "Pas de connection réseau!"
	exit 1
fi 
echo "Connecté au réseau!"
if [ -d "$HOME/woomy-update-mint" ]; then
	echo "Suppresion du dossier $SCRIPTDIR"
	rm -rf "$HOME/woomy-update-mint"
fi
mkdir $SCRIPTDIR
cd $SCRIPTDIR
echo "Download ${SCRIPTDIR}/root.sh script"
curl https://raw.githubusercontent.com/Woomy4680-exe/mint-upgrade/master/root.sh > $SCRIPTDIR/root.sh
echo "Afin d'installer la mise à jour, un accès root est requis. Entez votre mot de passe afin de lancer le script."
sudo echo "Accès recu!"
if [ $? == 1 ]; then 
	exit 1
fi
