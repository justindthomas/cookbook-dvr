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

Requirements
------------
The "htpc" user must already exist. Upon installation, GDM will be configured to automatically login as "htpc." On completion, the "htpc" user will need to be manually configured as a member of groups such as "mythtv" and "audio."

The "mythtv" database password will exist in "/etc/mythtv/mysql.txt" to use when configuring the PVR functionality of XBMC.
