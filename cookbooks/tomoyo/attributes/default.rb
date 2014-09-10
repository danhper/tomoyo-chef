default['tomoyo']['packages'] = %w{ wget patch gcc make libncurses-dev }
default['tomoyo']['usrlib_path'] = '/usr/lib64'
default['tomoyo']['tomoyo_path'] = "#{default['tomoyo']['usrlib_path']}/tomoyo"
default['tomoyo']['reboot_on_install'] = false
