#
# Cookbook Name:: dvr
# Recipe:: default
#
# Copyright 2013, justinthomas.name
#
# All rights reserved - Do Not Redistribute
#

apt_repository "team-xbmc" do
  uri "http://ppa.launchpad.net/team-xbmc/ppa/ubuntu"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "91E7EE5E"
end

apt_repository "tfylliv-dvbhdhomerun" do
  uri "http://ppa.launchpad.net/tfylliv/dvbhdhomerun/ubuntu"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "1FA11754"
end

apt_repository "glasen-intel-driver-quantal" do
  uri "http://ppa.launchpad.net/glasen/intel-driver/ubuntu"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "066ADE1D"
end

apt_repository "caffeine" do
  uri "http://ppa.launchpad.net/caffeine-developers/ppa/ubuntu"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "569113AE"
end

package "gnome" do
  action :install
end

template "/etc/gdm/custom.conf" do
  source "custom.conf.erb"
  mode 0644
  owner "root"
  group "root"
end

template "/etc/X11/xorg.conf" do
  source "xorg.conf.erb"
  mode 0644
  owner "root"
  group "root"
end

package "xserver-xorg-video-intel" do
  action :install
end

package "dvbhdhomerun-dkms" do
  action :install
end

package "dvbhdhomerun-utils" do
  action :install
end

package "mythtv" do
  action :install
end

package "xbmc" do
  action :install
end

package "flashplugin-installer" do
  action :install
end

package "curl" do
  action :install
end

directory "/usr/local/packages" do
  owner "root"
  group "root"
  mode 00755
  action :create
end

hulu = ['a'].pack('P').length  > 4 ? "huludesktop_amd64.deb" : "huludesktop_i386.deb"

execute "huludownload" do
  command "curl http://download.hulu.com/#{hulu} >/usr/local/packages/#{hulu}"
  creates "/usr/local/packages/#{hulu}"
  action :run
end

package "huludesktop" do
  provider Chef::Provider::Package::Dpkg
  source "/usr/local/packages/#{hulu}"
  action :install
end
