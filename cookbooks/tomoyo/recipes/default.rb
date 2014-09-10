#
# Cookbook Name:: tomoyo
# Recipe:: default
#

# Install needed packages
include_recipe "tomoyo::packages"

# Install tomoyo user space tools
include_recipe "tomoyo::tomoyo_tools"

# Configure the system
include_recipe "tomoyo::init"

# Configure GRUB
include_recipe "tomoyo::grub_config"

# Reboot if necessary
include_recipe "tomoyo::reboot"
