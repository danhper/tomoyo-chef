#
# Cookbook Name:: tomoyo
# Recipe:: reboot
#

tomoyo = node['tomoyo']

if tomoyo['reboot_on_install']
  include_recipe "reboot::default"

  node.run_state[:reboot_delay] = 'now'

  chef_handler 'RebootHandler' do
    source "#{node['chef_handler']['handler_path']}/reboot_handler.rb"
    action :nothing
    subscribes :enable, "execute[Update grub config]"
  end
end
