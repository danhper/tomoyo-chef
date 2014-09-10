#
# Cookbook Name:: tomoyo
# Recipe:: reboot
#

tomoyo = node['tomoyo']

if tomoyo['reboot_on_install']
  ruby_block 'set reboot' do
    block do
      node.run_state[:reboot_delay] = 'now'
      node.default[:reboot][:auto_reboot] = 1
    end
    action :nothing
    subscribes :run, "execute[Update grub config]", :immediately
  end
  include_recipe "reboot::default"
end
