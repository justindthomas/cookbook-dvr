DVR Cookbook
============
Installs XBMC and MythTV software with kernel drivers for the HDHomerun network tuner (dvbhdhomerun-dkms). Also installs Gnome desktop environment and configures auto-login for the 'htpc' user. Drivers for Intel Sandy/Ivy bridge graphics will also be installed.

The following PPAs and packages are installed by this cookbook:

- team-xbmc
    * xbmc
- tfylliv-dvbhdhomerun
    * dvbhdhomerun-dkms
    * dvbhdhomerun-utils
- glasen-intel-driver-quantal
    * xserver-xorg-video-intel
- caffeine
    * caffeine

Configuration files for Xorg and GDM are also installed.

The following standard packages are installed by this cookbook:

- gnome
- mythtv
- flashplugin-installer
- huludesktop (32-bit or 64-bit, depending on detected architecture)

Requirements
------------
The "htpc" user must already exist. Upon installation, GDM will be configured to automatically login as "htpc." On completion, the "htpc" user will need to be manually configured as a member of groups such as "mythtv" and "audio."

The "mythtv" database password will exist in "/etc/mythtv/mysql.txt" to use when configuring the PVR functionality of XBMC.
