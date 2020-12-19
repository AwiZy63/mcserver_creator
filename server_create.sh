#!/bin/bash

# 1. Installation des dépendences
# 2. Selection de la version

clear

if [[ ! -e /usr/lib/jvm/adoptopenjdk-8-hotspot-amd64/bin/java ]]; then

    echo -e 'Installation des dépendences en cours.. \n'
    sleep 2
    sudo apt install apt-transport-https ca-certificates wget dirmngr gnupg software-properties-common default-jre default-jdk -y
    wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | sudo apt-key add -
    sudo add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
    sudo apt update
    sudo apt install adoptopenjdk-8-hotspot -y
    sudo add-apt-repository "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main"
    sudo update-alternatives --set java /usr/lib/jvm/adoptopenjdk-8-hotspot-amd64/bin/java

    sleep 1

    clear

    echo -e "Installation des dépendences terminé ! \n"

    sleep 2
    clear

fi

# Selection de la version :

versionSelector="
[1] latest version (1.16.4)
[2] 1.16.4 
[3] 1.15.2 
[4] 1.14.4 
[5] 1.13.2 
[6] 1.12.2 
[7] 1.10.2 
[8] 1.9.4 
[9] 1.8.9 
[10] 1.8 
[11] 1.7.10

Selectionnez : "

while true; do

if [[ $retry ]]; then
read -p "Selectionnez un chiffre entre [1-11] :
${versionSelector}" versionSelected

else

read -p "Veuillez selectionner votre version de jeu parmis les suivantes [1-11] :
${versionSelector}" versionSelected

fi

    echo ""

    case $versionSelected in
    1)
        version="latest"
        break
        ;;
    2)
        version="1.16.4"
        break
        ;;
    3)
        version="1.15.2"
        break
        ;;
    4)
        version="1.14.4"
        break
        ;;
    5)
        version="1.13.2"
        break
        ;;
    6)
        version="1.12.2"
        break
        ;;
    7)
        version="1.10.2"
        break
        ;;
    8)
        version="1.9.4"
        break
        ;;
    9)
        version="1.8.9"
        break
        ;;
    10)
        version="1.8"
        break
        ;;
    11)
        version="1.7.10"
        break
        ;;
    *)
        clear
        retry=true
        ;;
    esac
done
sleep 1
clear
echo -e "Version selectionnée : $version \n"
sleep 1

clear

if [[ ! $version == "" ]]; then

    # Serveur forge
    read -p "Voulez vous installer forge sur votre serveur ? [o/N] " installForge

    case $installForge in
    [yY][eE][sS] | [yY] | [oO][uU][iI] | [oO])
        isForge=true
        ;;
    *)
        isForge=false
        ;;
    esac

    # Repertoire du serveur
    read -p "Entrez le nom de votre serveur. [defaut : minecraft_server] " setFolderName

    case $setFolderName in
    *)
        if [[ $setFolderName ]]; then
            folderName="$setFolderName"
        else
            folderName="minecraft_server"
        fi
        ;;
    esac

    mkdir $folderName
    cd $folderName

    ##############################################
    ############### SERVEUR LATEST ###############
    ##############################################

    if [[ $version == "latest" ]]; then

        # Installation du serveur
        if [[ $isForge == true ]]; then
            wget https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.16.4-35.1.13/forge-1.16.4-35.1.13-installer.jar
            java -jar forge-1.16.4-35.1.13-installer.jar --installServer
            rm forge-1.16.4-35.1.13-installer.jar*
            mv forge-1.16.4-35.1.13.jar server.jar
        else
            wget https://launcher.mojang.com/v1/objects/35139deedbd5182953cf1caa23835da59ca3d7cd/server.jar
        fi

    ##############################################
    ############### SERVEUR 1.16.4 ###############
    ##############################################

    elif [[ $version == "1.16.4" ]]; then

        # Installation du serveur
        if [[ $isForge == true ]]; then
            wget https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.16.4-35.1.13/forge-1.16.4-35.1.13-installer.jar
            java -jar forge-1.16.4-35.1.13-installer.jar --installServer
            rm forge-1.16.4-35.1.13-installer.jar*
            mv forge-1.16.4-35.1.13.jar server.jar
        else
            wget https://launcher.mojang.com/v1/objects/35139deedbd5182953cf1caa23835da59ca3d7cd/server.jar
        fi

    ##############################################
    ############### SERVEUR 1.15.2 ###############
    ##############################################

    elif [[ $version == "1.15.2" ]]; then

        # Installation du serveur
        if [[ $isForge == true ]]; then
            wget https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.15.2-31.2.47/forge-1.15.2-31.2.47-installer.jar
            java -jar forge-1.15.2-31.2.47-installer.jar --installServer
            rm forge-1.15.2-31.2.47-installer.jar*
            mv forge-1.15.2-31.2.47.jar server.jar
        else
            wget https://launcher.mojang.com/v1/objects/bb2b6b1aefcd70dfd1892149ac3a215f6c636b07/server.jar
        fi

    ##############################################
    ############### SERVEUR 1.14.4 ###############
    ##############################################

    elif [[ $version == "1.14.4" ]]; then

        # Installation du serveur
        if [[ $isForge == true ]]; then
            wget https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.14.4-28.2.23/forge-1.14.4-28.2.23-installer.jar
            java -jar forge-1.14.4-28.2.23-installer.jar --installServer
            rm forge-1.14.4-28.2.23-installer.jar*
            mv forge-1.14.4-28.2.23.jar server.jar
        else
            wget https://launcher.mojang.com/v1/objects/3dc3d84a581f14691199cf6831b71ed1296a9fdf/server.jar
        fi

    ############################################
    ############### SERVEUR 1.13 ###############
    ############################################

    elif [[ $version == "1.13.2" ]]; then

        # Installation du serveur
        if [[ $isForge == true ]]; then
            wget https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.13.2-25.0.219/forge-1.13.2-25.0.219-installer.jar
            java -jar forge-1.13.2-25.0.219-installer.jar --installServer
            rm forge-1.13.2-25.0.219-installer.jar*
            mv forge-1.13.2-25.0.219.jar server.jar
        else
            wget https://launcher.mojang.com/v1/objects/3737db93722a9e39eeada7c27e7aca28b144ffa7/server.jar
        fi

    ##############################################
    ############### SERVEUR 1.12.2 ###############
    ##############################################

    elif [[ $version == "1.12.2" ]]; then

        # Installation du serveur
        if [[ $isForge == true ]]; then
            wget https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.12.2-14.23.5.2854/forge-1.12.2-14.23.5.2854-installer.jar
            java -jar forge-1.12.2-14.23.5.2854-installer.jar --installServer
            rm forge-1.12.2-14.23.5.2854-installer.jar*
            mv forge-1.12.2-14.23.5.2854.jar server.jar
        else
            wget https://launcher.mojang.com/v1/objects/886945bfb2b978778c3a0288fd7fab09d315b25f/server.jar
        fi

    ##############################################
    ############### SERVEUR 1.10.2 ###############
    ##############################################

    elif [[ $version == "1.10.2" ]]; then

        # Installation du serveur
        if [[ $isForge == true ]]; then
            wget https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.10.2-12.18.3.2511/forge-1.10.2-12.18.3.2511-installer.jar
            java -jar forge-1.10.2-12.18.3.2511-installer.jar --installServer
            rm forge-1.10.2-12.18.3.2511-installer.jar*
            mv forge-1.10.2-12.18.3.2511-universal.jar server.jar
        else
            wget https://launcher.mojang.com/v1/objects/3d501b23df53c548254f5e3f66492d178a48db63/server.jar
        fi

    #############################################
    ############### SERVEUR 1.9.4 ###############
    #############################################

    elif [[ $version == "1.9.4" ]]; then

        # Installation du serveur
        if [[ $isForge == true ]]; then
            wget https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.9.4-12.17.0.2051/forge-1.9.4-12.17.0.2051-installer.jar
            java -jar forge-1.9.4-12.17.0.2051-installer.jar --installServer
            rm forge-1.9.4-12.17.0.2051-installer.jar*
            mv forge-1.9.4-12.17.0.2051-universal.jar server.jar
        else
            wget https://launcher.mojang.com/v1/objects/edbb7b1758af33d365bf835eb9d13de005b1e274/server.jar
        fi

    #############################################
    ############### SERVEUR 1.8.9 ###############
    #############################################

    elif [[ $version == "1.8.9" ]]; then

        # Installation du serveur
        if [[ $isForge == true ]]; then
            wget https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.8.9-11.15.1.2318-1.8.9/forge-1.8.9-11.15.1.2318-1.8.9-installer.jar
            java -jar forge-1.8.9-11.15.1.2318-1.8.9-installer.jar --installServer
            rm forge-1.8.9-11.15.1.2318-1.8.9-installer.jar*
            mv forge-1.8.9-11.15.1.2318-1.8.9-universal.jar server.jar
        else
            wget https://launcher.mojang.com/v1/objects/b58b2ceb36e01bcd8dbf49c8fb66c55a9f0676cd/server.jar
        fi

    ###########################################
    ############### SERVEUR 1.8 ###############
    ###########################################

    elif [[ $version == "1.8" ]]; then

        # Installation du serveur
        if [[ $isForge == true ]]; then
            wget https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.8-11.14.4.1577/forge-1.8-11.14.4.1577-installer.jar
            java -jar forge-1.8-11.14.4.1577-installer.jar --installServer
            rm forge-1.8-11.14.4.1577-installer.jar*
            mv forge-1.8-11.14.4.1577-universal.jar server.jar
        else
            wget https://launcher.mojang.com/v1/objects/a028f00e678ee5c6aef0e29656dca091b5df11c7/server.jar
        fi

    ##############################################
    ############### SERVEUR 1.7.10 ###############
    ##############################################

    elif [[ $version == "1.7.10" ]]; then

        # Installation du serveur
        if [[ $isForge == true ]]; then
            wget https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.7.10-10.13.4.1614-1.7.10/forge-1.7.10-10.13.4.1614-1.7.10-installer.jar
            java -jar forge-1.7.10-10.13.4.1614-1.7.10-installer.jar --installServer
            rm forge-1.7.10-10.13.4.1614-1.7.10-installer.jar*
            mv forge-1.7.10-10.13.4.1614-1.7.10-universal.jar server.jar
        else
            wget https://launcher.mojang.com/v1/objects/952438ac4e01b4d115c5fc38f891710c4941df29/server.jar
        fi

    else
        echo -e "error: annulation"
    fi

    clear

    # Acceptation de la EULA
    echo "eula=true" >eula.txt

    # Definition de la quantité de ram à allouer pour le serveur
    while :; do
        read -p "Combien de ram voulez vous allouer au serveur ? [en Go] " ramDefined
        len=${#ramDefined}
        numbervar=$(echo "$ramDefined" | tr -dc '[:digit:]')
        if [[ $len -ne ${#numbervar} ]]; then
            clear
            echo "$ramDefined n'est pas un nombre"
        elif [[ ! $ramDefined ]]; then
            clear
            echo "Entrez un nombre"
        else
            clear
            break
        fi
    done

    echo -e "java -Xmx${ramDefined}G -jar server.jar nogui" >startServer.sh
    chmod +x startServer.sh

    echo -e "\nInstallation terminée ! \n Pour lancer votre serveur faites ' cd ./${folderName} && ./startServer.sh '"

fi
