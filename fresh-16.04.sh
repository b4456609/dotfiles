#!/bin/bash

ECLIPSE="http://eclipse.stu.edu.tw/technology/epp/downloads/release/neon/R/eclipse-jee-neon-R-linux-gtk-x86_64.tar.gz"
INTELLIJ="https://download.jetbrains.com/idea/ideaIC-2016.1.3.tar.gz"
SIMPLENOTE="https://github.com/Automattic/simplenote-electron/releases/download/v1.0.2/simplenote-1.0.2.deb"
VAGRANT="https://releases.hashicorp.com/vagrant/1.8.4/vagrant_1.8.4_x86_64.deb"
#Gradle
MAIN=2
VERSION=13
echo "#nodejs"
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs

mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
echo "export PATH=~/.npm-global/bin:$PATH" >> $HOME/.profile
source ~/.profile

echo "#java8 ppa"
sudo add-apt-repository -y ppa:webupd8team/java

#echo "#spotify"
#echo "# 1. Add the Spotify repository signing key to be able to verify downloaded packages"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886

#echo "# 2. Add the Spotify repository"
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

echo "# Google Public Key downloading #"
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

echo "# Adding Google Chrome Repository #"
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

echo "# ansible ppa"
sudo apt-add-repository -y ppa:ansible/ansible

sudo add-apt-repository ppa:webupd8team/atom -y

echo "# Repository update #"
sudo apt-get update
sudo apt upgrade -y

sudo apt-get install -y atom

echo "#Install Google Chrome"
sudo apt-get install -y google-chrome-stable
sudo rm -f /etc/apt/sources.list.d/google.list

echo "#spotify"
echo "# 4. Install Spotify"
sudo apt-get install -y spotify-client

echo "#java8 installer"
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
sudo apt-get install -y oracle-java8-installer
echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> $HOME/.profile
source ~/.profile

echo "#GIT"
sudo apt-get install -y git

git config --global user.name "Bernie"
git config --global user.email "b4456609@gmail.com"

echo "#gradle"
wget https://services.gradle.org/distributions/gradle-$MAIN.$VERSION-bin.zip
sudo unzip -d /opt ./gradle-$MAIN.$VERSION-bin.zip
rm ./gradle*.zip

echo "export GRADLE_HOME=/opt/gradle-$MAIN.$VERSION" >> $HOME/.profile
echo 'export PATH=$PATH:$GRADLE_HOME/bin' >> $HOME/.profile

echo "org.gradle.daemon=true" >> $HOME/.gradle/gradle.properties

source ~/.profile

echo "# docker"
curl -fsSL https://get.docker.com/ | sh
sudo gpasswd -a ${USER} docker

echo "# Install video player"
sudo apt-get install -y mpv

echo "# Install filezilla"
sudo apt-get install -y filezilla

#File Compressors
sudo apt-get install -y p7zip-rar p7zip-full unace unrar zip unzip sharutils rar uudeview mpack arj cabextract file-roller

#virtualbox
sudo apt-get install -y virtualbox

echo "# dev tool"
sudo apt-get install -y zsh

echo "# clean tool"
sudo apt-get install -y bleachbit

echo "# vagrant "
echo "# Dependencies"
sudo apt-get install libqt4-opengl -y
echo "# Download vagrant"
wget "$VAGRANT" -P /tmp
echo "# Install vagrant"
sudo dpkg -i "/tmp/$(basename $VAGRANT)"

echo "# Install VirtualBox"
sudo apt-get install -y ansible

echo "#simplenote"
echo "# Download simplenote"
wget "$SIMPLENOTE" -P /tmp
echo "# Install simplenote"
sudo dpkg -i "/tmp/$(basename $SIMPLENOTE)"

mkdir ~/pf

echo "ide"
wget "$INTELLIJ" -P ~
tar -C ~/pf -zxvf $(basename $INTELLIJ)

wget "$ECLIPSE" -P ~
tar -C ~/pf -zxvf $(basename $ECLIPSE)

echo "Cleaning Up" &&
sudo apt-get -f install &&
sudo apt-get -y autoremove &&
sudo apt-get -y autoclean &&
sudo apt-get -y clean

echo "# install oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

