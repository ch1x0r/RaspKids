#!/usr/bin/env bash

shopt -s extglob
set -o errtrace
set -o errexit

function pint_update_packages {
#upgrading kernel without updating grub dependencies
#sudo apt-mark hold grub2-common grub-common

sudo apt-get -y update && sudo apt-get -y upgrade
}


function pint_install_software {
  software=( $(curl -sSL https://raw.githubusercontent.com/Ch1x0r/kocifier/pint/pint_packages ) )

  # change this link to the pint_package or list of packages - currently pointing at github for the packages list...

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
  # A:You could create a desktop or theme... the KOC desktop or something... the KOC theme
  
  # R:Install Kids Ruby
  # A:please provide more information
  
  # R:Change regional formats 
  # A: 
  
  # R:locales - Change the timezone to Mexico City = dpkg-reconfigure locals es-MX  manually or add to script but a manual selection - find alternate
  # A:
  
  # R:Configure input methods
  # A:
  
  # R:remove_keyboard_packages
  # A: Yes. Done
  
  # R:Install then remove keyboard packages?OK - remove fcitx*
  # A:Does install the packages for the ubuntu-keyboard-english or ubuntu-keybord-spanish to solve this (list of packages)
  
  # R:Install Language Pack support for Spanish
  # A:language-pack-es-base language-pack-gnome-es language-pack-kde-es (list of packages)
  
  
}

##########################
# Raspbian customization #
##########################

raspbian_kocify

