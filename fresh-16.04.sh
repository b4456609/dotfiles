#!/bin/bash

echo "#nodejs"
curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -

echo "#nodejs"
sudo apt-get install -y nodejs

echo "#java8 ppa"
sudo add-apt-repository -y ppa:webupd8team/java

echo "#spotify"
echo "# 1. Add the Spotify repository signing key to be able to verify downloaded packages"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886

echo "# 2. Add the Spotify repository"
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

echo "# Google Public Key downloading #"
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

echo "# Adding Google Chrome Repository #"
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

echo "# sublime"
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3

echo "# Repository update #"
sudo apt-get update
sudo apt upgrade -y

echo "#Install Google Chrome"
sudo apt-get install -y google-chrome-stable
sudo rm -f /etc/apt/sources.list.d/google.list

echo "# sublime"
sudo apt-get install -y sublime-text-installer

echo "# fcitx"
sudo apt-get install -y fcitx fcitx-chewing
sudo apt-get install -y build-essential libgtk2.0-dev

sudo gcc -shared -o sublime/libsublime-imfix.so sublime/sublime_imfix.c  `pkg-config --libs --cflags gtk+-2.0` -fPIC
sudo mv sublime/libsublime-imfix.so  /opt/sublime_text

echo "# replace sublime text "
sudo rm /usr/share/applications/sublime_text.desktop
sudo cp sublime/sublime_text.desktop /usr/share/applications

echo "# replace sublime text bin"
sudo rm /usr/bin/subl
sudo cp sublime/subl /usr/bin
sudo chmod +x /usr/bin/subl

echo "#spotify"
echo "# 4. Install Spotify"
sudo apt-get install spotify-client

echo "#java8 installer"
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
sudo apt-get install -y oracle-java8-installer
echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> $HOME/.profile

echo "#gradle"
MAIN=2
VERSION=13
wget https://services.gradle.org/distributions/gradle-$MAIN.$VERSION-bin.zip
sudo unzip -d /opt ./gradle-$MAIN.$VERSION-bin.zip
rm ./gradle*.zip

echo "export GRADLE_HOME=/opt/gradle-$MAIN.$VERSION" >> $HOME/.profile
echo 'export PATH=$PATH:$GRADLE_HOME/bin' >> $HOME/.profile

echo "org.gradle.daemon=true" >> $HOME/.gradle/gradle.properties

source ~/.profile


echo "#GIT"
sudo apt-get install -y git git-cola

git config --global user.name "Bernie"
git config --global user.email "b4456609@gmail.com"


echo "# docker"
curl -fsSL https://get.docker.com/ | sh
sudo gpasswd -a ${USER} docker

echo "# Install video player"
sudo apt-get install -y mpv

echo "# Install filezilla"
sudo apt-get install -y filezilla

echo "# dev tool"
sudo apt-get install -y zsh

echo "# clean tool"
sudo apt-get install -y bleachbit

echo "# vagrant "
echo "# Dependencies"
sudo apt-get install libqt4-opengl -y
VAGRANT="https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.deb"
echo "# Download vagrant"
wget "$VAGRANT" -P /tmp
echo "# Install vagrant"
sudo dpkg -i "/tmp/$(basename $VAGRANT)"

echo "# Install VirtualBox"
sudo apt-get install -y virtualbox ansible

echo "# Disable Guest Session on Unity"
sudo sh -c "echo 'allow-guest=false' >> /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf"
echo "# Enable one-click minimize"
gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ launcher-minimize-window true

echo "Cleaning Up" &&
sudo apt-get -f install &&
sudo apt-get -y autoremove &&
sudo apt-get -y autoclean &&
sudo apt-get -y clean

echo "# install oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "# intellij eclipse robomongo docker-compose virtualbox ansible"
echo "# https://robomongo.org/download"
echo "# https://docs.docker.com/compose/install/"
echo "# https://www.jetbrains.com/idea/#chooseYourEdition"
echo "# http://www.eclipse.org/downloads/packages/eclipse-ide-java-ee-developers/mars2"
echo "# http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/mars/2/eclipse-jee-mars-2-linux-gtk-x86_64.tar.gz&r=1"

echo "# sublime"
echo "# https://packagecontrol.io/installation"
echo "# sync settings"
echo "# https://gist.github.com/b4456609/f7742fe74eb8308be29d"

