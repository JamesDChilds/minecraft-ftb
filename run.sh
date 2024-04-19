#!/bin/sh
if [ ! -f /server/start.sh ]; then
    url="https://api.modpacks.ch/public/modpack/"$MODPACK"/"$RELEASE"/server/linux"
    filename="serverinstall_"$MODPACK"_"$RELEASE
    runInstall() {
        echo /server | ./$filename
    }
    curl -JLO $url && chmod +x $filename
    runInstall && rm $filename
    echo eula=true > /server/eula.txt
    sed -i '1s/bash/sh/' /server/start.sh
fi
cd server && ./start.sh
