CURRFOLDER="$(pwd)"
echo $CURRFOLDER

TARGETFOLDER="../folder_22020527_5"
echo "Kopiere Dateien in Verzeichnis: $TARGETFOLDER"

mkdir $TARGETFOLDER
cp -r ./django              $TARGETFOLDER/django
cp -r ./react               $TARGETFOLDER/react
cp -r ./conf.d              $TARGETFOLDER/conf.d
cp  ./docker-compose.yml    $TARGETFOLDER/docker-compose.yml
cp  ./init-letsencrypt.sh   $TARGETFOLDER/init-letsencrypt.sh

cd $TARGETFOLDER


docker-compose kill
docker rm -vf $(docker ps -aq)
docker rmi -f $(docker images -aq)

# docker system prune -af

docker-compose up --build -d 

cd $CURRFOLDER

