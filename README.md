Wheel easy install
==================
Ok this isnt super easy but if you have vagrant installed then this cannot get much easier.

Requirements
------------
* [Virtual Box](https://www.virtualbox.org/ "VirtualBox")
* [Vagrant](http://vagrantup.com/ "Vagrant")

Running
-------
* Clone the project wherever you like.
* open cmd or terminal (depending on your OS, I use Cygwin on windows)
* cd into the vagrant folder that came with the project
* run "vagrant up"
* once vagrant and puppet have finished doing their work you should be able to see wheel running on [http://10.0.0.2](http://10.0.0.2 "default host only address")

If you're feeling really lazy
---------------------------
use the script below to get the project checked out and running
```bash
#mkdir and cd into that directory first please!
git clone git://github.com/SnatchFrigate/Wheel-Easy-Install.git .
cd ./vagrant
vagrant up
```

Notes
-----
A virual host of wheel.local has already been configured. To use this add the following to your hosts file.

```
10.0.0.2 wheel.local #wheel easy install
```
Just in case you don't know the paths, i have provided them below.
* Windows = c:\windows\system32\drivers\etc\hosts
* Linux = /etc/hosts
* Mac = To be honest I'm not a Mac user but I'm pretty sure the path would be similar to Linux.

You can also change the IP address of the machine be changing "config.vm.network" in vagrant/Vagrantfile. Just remember to update the hosts file to the new IP