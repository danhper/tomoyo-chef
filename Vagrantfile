require 'fileutils'

DATA_DIR = ENV['TOMOYO_DATA_DIR'] || "../tomoyo_data"

if Dir["#{DATA_DIR}/{*,.keep}"].empty?
  FileUtils.mkpath(DATA_DIR)
  FileUtils.touch(File.join(DATA_DIR, ".keep"))
end

Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.network :private_network, ip: "192.168.3.4"
  # config.vm.network :forwarded_port, guest: 80, host: 8080

  config.vm.synced_folder ".", "/vagrant", :disabled => true
  config.vm.synced_folder DATA_DIR, "/tomoyo-nfs", :nfs => true
  config.bindfs.bind_folder "/tomoyo-nfs", "/home/tomoyo/data",
    :owner => "1111", :group => "1111", :'create-as-user' => true,
    :perms => "u=rwx:g=rx:o=rx", :'create-with-perms' => "u=rwx:g=rx:o=rx",
    :'chown-ignore' => true, :'chgrp-ignore' => true, :'chmod-ignore' => true

  config.omnibus.chef_version = "11.4.4"

  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.run_list = [
      "tomoyo::default"
    ]
    chef.arguments = '-l debug'
  end
end
