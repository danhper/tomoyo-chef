#
# Cookbook Name:: tomoyo
# Recipe:: init
#

tomoyo = node['tomoyo']

execute "Tomoyo init" do
  command "#{tomoyo['tomoyo_path']}/init_policy"
  action :nothing
  subscribes :run, "execute[Install tomoyo-tools]"
end
