#
# Cookbook Name:: tomoyo
# Recipe:: packages
#

tomoyo = node['tomoyo']

# Setup apt
include_recipe "apt"

# Install required packages
tomoyo['packages'].each do |pkg|
  package pkg
end
