# tomoyo-chef

Cookbook to install and configure TOMOYO Linux using chef.

## Dependencies

* [Vagrant](http://www.vagrantup.com/downloads.html)
* [Virtualbox](https://www.virtualbox.org/wiki/Downloads)
* [Berkshelf](http://berkshelf.com/) (`gem install bershelf`)

Then, install vagrant plugins:

```
vagrant plugin install vagrant-omnibus
vagrant plugin install vagrant-bindfs
vagrant plugin install vagrant-berkshelf
```

## Usage

To launch the VM, just type

```
vagrant up
```

This can take a while the first time.

The first time you launch the VM, you will have to run 

```
vagrant reload
```

to reboot the VM in order to have the Linux kernel loaded with proper options.

When the VM is launched, use 

```
vagrant ssh
```

to access it.
