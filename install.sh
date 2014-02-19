#!/bin/sh

REPOSITORY="git@git.tuvistavie.com:tuvistavie/tomoyo-chef.git"

for cmd in "vboxmanage" "vagrant" "git" "gem"; do
  if ! eval "which $cmd > /dev/null"; then
    echo "'$cmd' command not found."; exit 1
  fi
done

if `gem list | grep berkshelf > /dev/null`; then
  echo 'berkshelf gem already installed, skipping.'
else
  echo 'Installing berkshelf gem...'
  gem install berkshelf
fi

for plugin in "vagrant-omnibus" "vagrant-bindfs" "vagrant-berkshelf"; do
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
