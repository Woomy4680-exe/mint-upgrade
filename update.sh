#! /bin/bash
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

