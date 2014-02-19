default['tomoyo']['packages'] = %w{
  build-essential
  curl
  libncurses-dev
  openssh-server
  vim
  wget
}

default['tomoyo']['usrlib_path'] = '/usr/lib64'
default['tomoyo']['tomoyo_path'] = "#{default['tomoyo']['usrlib_path']}/tomoyo"
