# Cookbook Name:: main
# Recipe:: default


# Run apt-update
include_recipe 'apt::default'


# Install gksudo
apt_package 'gksu' do
  action :install
end


# Install Docker
docker_service 'default' do
  action [:create, :start]
end

# Install Hack font
# Font: https://github.com/chrissimpkins/Hack/issues/189#issuecomment-198649485
# Source: http://stackoverflow.com/a/9898849
# See also https://github.com/mikemackintosh/masterbaker-fonts/blob/master/recipes/ubuntu.rb
# See also http://stackoverflow.com/a/15757093
# See also https://docs.chef.io/dsl_recipe.html
if node[:platform_version].to_f >= 16.04
  apt_package 'fonts-hack-ttf' do
    action :install
  end
elsif ::Dir.exist?('/usr/share/fonts/truetype/hack/')
  Chef::Log.info('(up to date)')
else
  remote_file "#{Chef::Config[:file_cache_path]}/fonts-hack-ttf_2.019-1_all.deb" do
    source 'http://mirrors.kernel.org/ubuntu/pool/universe/f/fonts-hack/fonts-hack-ttf_2.019-1_all.deb'
    mode 0644
    checksum 'bb10200b4f5a941380a5e844f8e5783ea49a71f5b5462e33223007acc99a1607'
  end

  dpkg_package 'fonts-hack-ttf' do
    source "#{Chef::Config[:file_cache_path]}/fonts-hack-ttf_2.019-1_all.deb"
    action :install
  end
end

# Install git
package 'git' do
  action :install
end

# Install Node
if ::Dir.exist?('/usr/bin/node')
  Chef::Log.info('(up to date)')
else
  bash 'prep_for_node_6_x' do
    code <<-EOH
      curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
    EOH
  end
  
  package 'nodejs' do
    action :install
  end
end


# Install Sphinx documentation generator
# http://stackoverflow.com/a/23922391
apt_package 'python3-sphinx' do
  action :install
end

# Install VSCode
if ::Dir.exist?('/usr/share/code/')
  Chef::Log.info('(up to date)')
else
  remote_file "#{Chef::Config[:file_cache_path]}/visual-studio-code.deb" do
    source 'https://go.microsoft.com/fwlink/?LinkID=760868'
    mode 0644
    checksum '7acdfde556b0f08064429bedd2c0fee6ac7fdfa0b9ace151de9c245e84d43f20'
  end

  dpkg_package 'visual-studio-code' do
    source "#{Chef::Config[:file_cache_path]}/visual-studio-code.deb"
    action :install
  end
  
  # TODO: Attempt to install Visual Studio Code Settings Sync and download sync.

  # TODO: Include --disable-gpu at least for Ubuntu 14.04
  #  * Edit /usr/share/applications/code.desktop
  #    - [Desktop Entry]Exec
  #    - [Desktop Action new-window]Exec
end


# Set shell functions and aliases
file '/home/vagrant/.bash_aliases' do
  # Verfiy that --disable-gpu is needed on distros other than Ubuntu 14.04
  content <<-EOH
  code () { command -p code "$@" --disable-gpu ; }
  EOH
end

