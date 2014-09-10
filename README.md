# tomoyo-chef

Cookbook to install and configure TOMOYO Linux (version 2.5.0).

The cookbook does not reinstall the kernel, so the Linux kernel should already support TOMOYO Linux for it to work. The cookbook does the following.

* Install dependencies
* Install TOMOYO user tools
* Initialize TOMOYO Linux
* Setup GRUB to start kernel with `security=tomoyo`

## Cookbook usage

Just include `tomoyo::default` to your recipe.

You can customize the following:

```ruby
node['tomoyo']['packages'] = %w{ wget patch gcc make libncurses-dev }
node['tomoyo']['usrlib_path'] = '/usr/lib64'
node['tomoyo']['tomoyo_path'] = "#{node['tomoyo']['usrlib_path']}/tomoyo"
node['tomoyo']['reboot_on_install'] = false
```

## Vagrant usage

### Dependencies

* [Vagrant](http://www.vagrantup.com/downloads.html)
* [Virtualbox](https://www.virtualbox.org/wiki/Downloads)

### Automatic install

Just run 

```
curl -L https://raw.github.com/tuvistavie/tomoyo-chef/master/install.sh | sh
```

and when everything is done `cd` in the directory, restart the VM and you are done.

```
cd tomoyo-chef
vagrant reload
```

### Manual install

Install berkshelf and vagrant plugins:

```
gem install berkshelf
vagrant plugin install vagrant-omnibus
vagrant plugin install vagrant-bindfs
```

Clone the repository and launch the box. This can take a while the first time.

```
git clone https://github.com/tuvistavie/tomoyo-chef.git
cd tomoyo-chef
vagrant up
```

Then, reload the VM in order to have the Linux kernel loaded with proper options.

```
vagrant reload
```

