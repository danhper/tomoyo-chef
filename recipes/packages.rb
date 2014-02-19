#
# Cookbook Name:: tomoyo
# Recipe:: packages
#

tomoyo = node['tomoyo']

magic_shell_environment 'PATH' do
  value '/usr/local/bin:/usr/local/bin:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin'
end

# Setup apt
include_recipe "apt"

# Install required packages
tomoyo['packages'].each do |pkg|
  package pkg
end

