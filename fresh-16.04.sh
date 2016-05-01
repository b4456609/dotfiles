#!/bin/bash

#java8 ppa
sudo add-apt-repository -y ppa:webupd8team/java

#ansible ppa
sudo apt-add-repository -y ppa:ansible/ansible

#spotify
# 1. Add the Spotify repository signing key to be able to verify downloaded packages
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886

# 2. Add the Spotify repository
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

# Google Public Key downloading #
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

# Adding Google Chrome Repository #
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

# sublime
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3

# Add Virtualbox Repository
$ sh -c "echo 'deb http://download.virtualbox.org/virtualbox/debian '$(lsb_release -cs)' contrib non-free' > /etc/apt/sources.list.d/virtualbox.list"
# Import Oracle Public Key
$ wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -

# Repository update #
sudo apt-get update
sudo apt upgrade -y

#Install Google Chrome
sudo apt-get install -y google-chrome-stable

#nodejs
curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -

#java8 installer
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
sudo apt-get install -y oracle-java8-installer
echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> $HOME/.profile

#gradle
MAIN=2
VERSION=13
wget https://services.gradle.org/distributions/gradle-$MAIN.$VERSION-bin.zip
sudo unzip -d /opt ./gradle-$MAIN.$VERSION-bin.zip
rm ./gradle*.zip

echo "export GRADLE_HOME=/opt/gradle-$MAIN.$VERSION" >> $HOME/.profile
echo 'export PATH=$PATH:$GRADLE_HOME/bin' >> $HOME/.profile

echo "org.gradle.daemon=true" >> $HOME/.gradle/gradle.properties

source ~/.profile


#GIT
sudo apt-get install -y git git-cola

git config --global user.name "Bernie"
git config --global user.email "b4456609@gmail.com"

#nodejs
sudo apt-get install -y nodejs

#spotify
# 4. Install Spotify
sudo apt-get install spotify-client

#ansible
sudo apt-get install -y ansible

# docker
curl -fsSL https://get.docker.com/ | sh
sudo gpasswd -a ${USER} docker

# Install Media Codecs
sudo apt-get install -y ubuntu-restricted-extras

# Install video player
sudo apt-get install -y mpv

# Install filezilla
sudo apt-get install -y filezilla

# Install VirtualBox
sudo apt-get install -y virtualbox-5.0

# dev tool
sudo apt-get install -y zsh

# clean tool
sudo apt-get install -y bleachbit

# sublime
sudo apt-get install -y sublime-text-installer

# fcitx
sudo apt-get install -y fcitx fcitx-chewing
sudo apt-get install -y build-essential libgtk2.0-dev

# Setting Fcitx as the default input method!
im-switch -s fcitx -z default

sudo gcc -shared -o sublime/libsublime-imfix.so sublime/sublime_imfix.c  `pkg-config --libs --cflags gtk+-2.0` -fPIC
sudo mv sublime/libsublime-imfix.so  /opt/sublime_text

# replace sublime text 
sudo rm /usr/share/applications/sublime-text.desktop
sudo cp sublime/sublime-text.desktop /usr/share/applications

# replace sublime text bin
sudo rm /usr/bin/subl
sudo cp sublime/subl /usr/bin

# vagrant 
# Dependencies
sudo apt-get install libqt4-opengl -y
VAGRANT="https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.deb"
# Download vagrant
wget "$VAGRANT" -P /tmp
# Install vagrant
sudo dpkg -i "/tmp/$(basename $VAGRANT)"


# Disable Guest Session on Unity
sudo sh -c "echo 'allow-guest=false' >> /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf"
# Enable one-click minimize
gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ launcher-minimize-window true

echo "Cleaning Up" &&
sudo apt-get -f install &&
sudo apt-get -y autoremove &&
sudo apt-get -y autoclean &&
sudo apt-get -y clean

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# intellij eclipse sublime robomongo docker-compose
# https://robomongo.org/download
# https://docs.docker.com/compose/install/


