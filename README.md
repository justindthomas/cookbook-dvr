DVR Cookbook
============
This is a Chef cookbook that installs XBMC and MythTV software with kernel drivers for the HDHomerun network tuner (dvbhdhomerun-dkms). It also installs the Gnome desktop environment and configures auto-login for the 'htpc' user. Drivers for Intel Sandy/Ivy bridge graphics will also be installed.

The following PPAs and packages are installed by this cookbook:

- team-xbmc
- tfylliv-dvbhdhomerun
- glasen-intel-driver-quantal
- caffeine

Configuration files for Xorg and GDM are also installed.

The following standard packages are installed by this cookbook:

- gnome
- mythtv
- flashplugin-installer
- huludesktop (32-bit or 64-bit, depending on detected architecture)

The following packages are installed from the custom repositories noted above:

- xbmc
- dvbhdhomerun-dkms
- dvbhdhomerun-utils
- xserver-xorg-video-intel
- caffeine

Using the dvbhdhomerun kernel drivers appears to improve quality, but is quirky. To load channels, use the standard HDHomerun configuration in MythTV Backend and perform the channel scan. With the channels loaded, you can then delete those tuner entries and re-add them as dvbhdhomerun devices. For some reason, channel scanning does not work with the kernel drivers and loading the channel list from ScheduleDirect listings appears to fail as well (argh, MythTV).

Requirements
------------
The "htpc" user must already exist. Upon installation, GDM will be configured to automatically login as "htpc." On completion, the "htpc" user will need to be manually configured as a member of groups such as "mythtv" and "audio."

The "mythtv" database password will exist in "/etc/mythtv/mysql.txt" to use when configuring the PVR functionality of XBMC.

Attributes
------------
For automatically configuring network shares, the following attributes are required.

default["dvr"]["account"] 	The username required to authenticate to shares for this system.
default["dvr"]["password"]	The password associated with "account".
default["dvr"]["mounts"]	A list of IDs of data bag items in the "storage" data bag

The "storage" data bag must have attributes for: device, fstype and mount_point for each share. The ID of each share will be used in the attributes to associate a recipe with a set of file shares.
