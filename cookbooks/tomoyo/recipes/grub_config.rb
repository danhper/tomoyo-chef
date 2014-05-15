#
# Cookbook Name:: tomoyo
# Recipe:: grub_config
#

# Update /etc/default/grub
template "grub" do
  source "grub.erb"
  path "/etc/default/grub"
  action :nothing
  subscribes :create, "execute[Tomoyo init]"
end

# Update grub configuration
execute "Update grub config" do
  command "grub-mkconfig -o /boot/grub/grub.cfg"
  action :nothing
  subscribes :run, "template[grub]"
end
