#
# Cookbook Name:: tomoyo
# Recipe:: packages
#

tomoyo = node['tomoyo']

# Setup apt or yum depending on OS
if platform_family?("rhel")
  include_recipe "yum::epel"
else
  include_recipe "apt"
end

# Install required packages
tomoyo['packages'].each do |pkg|
  package pkg
end
