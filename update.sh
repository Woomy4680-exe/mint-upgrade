echo "Vérification des scripts..."
ping -c 1 kernel.org > /dev/null
if [ $? != 0 ]; then 
	echo "Pas de connection réseau!"
	exit 1
fi 
echo "Connecté au réseau!"

