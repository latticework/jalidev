# jalidev
Linux development environment for Jali projects.

## Prerequisites
On all platforms
* Install and configure Chef
    1. Install __ChefDK__, [here](https://downloads.chef.io/chef-dk/).
    1. Install the __Chef Vagrant-Omnibus__ plugin
    > `vagrant plugin install vagrant-omnibus`
    1. Install the __Vagrant-Berkshelf__ plugin
    > `vagrant plugin install vagrant-berkshelf`

On __Windows 10__
* Add rights to create symlinks.
    1.  Open a windows security policy editor
        * On __Windows 10 Professional or Enterprise__ open `secpol.msc`
        * On __Windows 10 Home__ download `polsedit` from [here](http://www.southsoftware.com/) 
          and open `polseditx64.exe` 
    2.  Add your user to `SeCreateSymbolicLinkPrivilege`