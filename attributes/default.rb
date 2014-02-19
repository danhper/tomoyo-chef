if platform_family?("rhel")
  default['tomoyo']['packages'] = %w{ wget patch gcc make ncurses-devel }
else
  default['tomoyo']['packages'] = %w{ wget patch gcc make libncurses-dev }
end
default['tomoyo']['usrlib_path'] = '/usr/lib64'
default['tomoyo']['tomoyo_path'] = "#{default['tomoyo']['usrlib_path']}/tomoyo"
