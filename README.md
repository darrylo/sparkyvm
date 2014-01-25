sparkyvm -- An experimental Vagrant virtual machine for Spark Core firmware development
=======================================================================================

This project is designed to easily create a linux virtual machine for use as a
[Spark Core](https://www.spark.io) firmware development system.  A
provisioning file is provided that automatically downloads the various
required development tools and dependencies, such as the ARM GNU gcc
toolchain.  Scripts are also provided to download and build the firmware.

[Vagrant](http://www.vagrantup.com) is used, because it provides a near
no-brainer way of easily creating and configuring virtual machines.

Currently (as of January 24, 2014), a minimal 64-bit Unbuntu 12.10
installation is used.  The core virtual machine is obtained from the Vagrant
web site, and then various programs are automatically installed via apt-get.


In addition to the tools listed in [the Spark Core
Firmware](https://community.spark.io/t/the-spark-core-firmware/532) thread in
the forums, these additional software packages are installed:

* screen
* vim


Requirements
------------

You need to download and install the following:

* [Vagrant](http://www.vagrantup.com).

* [VirtualBox](https://www.virtualbox.org/).  You should also be able to
  use vmware, but that hasn't been tested; it may or may not work.



