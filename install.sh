#!/bin/sh

REPOSITORY="https://github.com/tuvistavie/tomoyo-chef.git"

for cmd in "vboxmanage" "vagrant" "git" "gem"; do
  if ! eval "which $cmd > /dev/null"; then
    echo "'$cmd' command not found."; exit 1
  fi
done

for plugin in "vagrant-bindfs"; do
  if eval "vagrant plugin list | grep $plugin > /dev/null"; then
    echo "$plugin already installed, skipping."
  else
    echo "Installing $plugin..."
    vagrant plugin install $plugin
  fi
done

git clone $REPOSITORY

cd tomoyo-chef

vagrant up
