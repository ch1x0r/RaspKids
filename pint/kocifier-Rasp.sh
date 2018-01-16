#!/usr/bin/env bash

shopt -s extglob
set -o errtrace
set -o errexit

function raspbian_update_packages {
#upgrading kernel without updating grub dependencies
#sudo apt-mark hold grub2-common grub-common

sudo apt-get -y update && sudo apt-get -y upgrade
}


function raspbian_install_software {
  software=( $(curl -sSL https://raw.githubusercontent.com/Ch1x0r/kocifier/raspkids_dev/raspkids_packages) )

  # change this link to the raspkids_packages

  for package in ${software[*]}
  do
    sudo apt-get -y install $package
  done
}


function remove_keyboard_packages {
  sudo apt-get remove fcitx*
}

function raspbian_kocify {
  raspbian_update_packages
  raspbian_install_software
  # R:Change the wallpaper using commands
  # R:Install Kids Ruby
  # R:Change regional formats 
  # R:locales - Change the timezone to Mexico City = dpkg-reconfigure locals es-MX  manually or add to script but a manual selection - find alternate
  # R:Configure input methods
  # R:remove_keyboard_packages
  # R:install then remove keyboard packages?
  # A:Does the ubuntu-keyboard-english or ubuntu-keybord-spanish solve this? (list of packages)
  # R:Install Language Pack support for Spanish
  # A:language-pack-es-base language-pack-gnome-es language-pack-kde-es (list of packages)
  
  
}

##########################
# Raspbian customization #
##########################

raspbian_kocify

