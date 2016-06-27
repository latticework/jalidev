# jalidev
Linux development environment for Jali projects.

## Prerequisites
Install and configure Chef:

1. Install __ChefDK__, [here](https://downloads.chef.io/chef-dk/)
1. Install the __Chef Vagrant-Omnibus__ plugin

   > `vagrant plugin install vagrant-omnibus`
1. Install the __Vagrant-Berkshelf__ plugin

   > `vagrant plugin install vagrant-berkshelf`


### Note to NodeJS users
> On __Windows 10__ you need to be a part of the `Administrators` group and 
> always run `vagrant` from a console as administrator. You possibly can add the 
> `SeCreateSymbolicLinkPrivilege` to your account. However your account can't 
> "look" like an admin account or will get a stripped down Windows security 
> token like administrators do but can't "run as administrator". You would 
> have to either disable User Account Control (UAC) or make sure your account 
> does not have any of the restricted priviliges. See article `Windows Vista 
> Application Development Requirements for User Account Control Compatibility` 
> section [New Technologies for Windows][vistauac_topic3] subsection `Access 
> Token Changes` for more information and a list of restricted privileges. 
> [HT](http://superuser.com/a/839608)
> 
> To add privileges to create simlinks: 
> 1.  Open a windows security policy editor
>     * On __Windows 10 Professional or Enterprise__ open `secpol.msc`
>     * On __Windows 10 Home__ download `polsedit` from [here](http://www.southsoftware.com/) 
>       and open `polseditx64.exe` 
> 2.  Add your user to `SeCreateSymbolicLinkPrivilege`

## Usage
[//]: # ( See http://stackoverflow.com/a/37661469/2240669 )
1. Clone jalidev:

   > `git clone --depth=1 --branch=master https://github.com/latticework/jalidev.git 
   > <your-project-name>`
1. Navigate to the `<your-project-name>` directory

   > `cd <your-project-name>`
1. Add new git origin. E.g.:

   > `git remote add origin https://github.com/<your-user-name>/<your-project-name>.git`
1. Rename all references of `jalidev` to `your-project-name` in the 
   `Vagrantfile`. _Note that this will become the name of your virtual machine, 
   and you can only have one._
1. Open a console window (perhaps as Administrator), cd to the project folder 
   and run Vagrant:

   > `vagrant up`
1. Wait for Vagrant and Chef initializations to complete before using new the 
   virtual machine.


[vistauac_topic3]: https://msdn.microsoft.com/en-us/library/bb530410.aspx#vistauac_topic3