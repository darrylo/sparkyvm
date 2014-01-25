sparkyvm -- An experimental Vagrant virtual machine for Spark Core firmware development
=======================================================================================

This project is designed to easily create a linux virtual machine for use as a
[Spark Core](https://www.spark.io) firmware development system.  A
provisioning file is provided that automatically downloads the various
required development tools and dependencies, such as the ARM GNU gcc
toolchain.  Scripts are also provided to download and build the firmware.
Note that this configures a basic virtual machine **without a GUI**;
everything is done via a command-line login.

[Vagrant](http://www.vagrantup.com) is used, because it provides a near
no-brainer way of easily creating and configuring virtual machines.

Currently (as of January 24, 2014), a minimal 64-bit Ubuntu 12.10
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

You also need a significant amount of disk space.  The virtual machine is
configured to use an 80GB virtual hard disk.  Initially, only around 2GB will
be used, but disk space will be automatically allocated as needed, up to 80GB.
So, you need to insure that you have at least, say, 805GB of free disk space
(the extra 5GB is there as a safety margin).



Initial Setup and Usage
-----------------------

The easiest thing to do is to download this repository and extract the files
into a convenient location.  Then, in a command-line window (e.g., `cmd.exe`
on windows), chdir to the directory containing the `Vagrantfile` config
file, and run:

    vagrant up

When the above is run for the first time, it will download the minimal virtual
machine (from `http://files.vagrantup.com/precise64.box`), configure it, and
then automatically download and install the additional tools (such as the
cross-compiler).  Please note that this can take a **LONG** time, as the base
virtual machine is around 305MB, and the additional software is another 94+MB.
You will see no messages while the large virtual machine is being downloaded,
although you will see messages while the additional software is being
installed.

For example, if your internet connection can download the virtual machine at
500KB/sec, it'll take ~10-11 minutes to download it; you'll see nothing
happening during this time, and you'll just have to be patient:

    $ vagrant up
    Bringing machine 'default' up with 'virtualbox' provider...
    [default] Importing base box 'precise64'...
    [default] Matching MAC address for NAT networking...
    [default] Setting the name of the VM...
    [default] Clearing any previously set forwarded ports...
    [default] Creating shared folders metadata...
    [default] Clearing any previously set network interfaces...
    [default] Preparing network interfaces based on configuration...
    [default] Forwarding ports...
    [default] -- 22 => 2222 (adapter 1)
    [default] Booting VM...
    [default] Waiting for machine to boot. This may take a few minutes...

Once the virtual machine has been downloaded and installed, you will
see more messages appear:

    [default] Machine booted and ready!
    [default] The guest additions on this VM do not match the installed version of
    VirtualBox! In most cases this is fine, but in rare cases it can
    cause things such as shared folders to not work properly. If you see
    shared folder errors, please update the guest additions within the
    virtual machine and reload your VM.

    Guest Additions Version: 4.2.0
    VirtualBox Version: 4.3
    [default] Mounting shared folders...
    [default] -- /vagrant
    ...

For now, you can ignore the above warning regarding the guest additions.

After this, you will see lots of messages, in real-time, showing the software
installation progress.

Eventually, the installation will finish, and you will again see a command
prompt.

**At this point, the linux virtual machine has been installed and is now fully
up and running.**


Things to note
--------------

* You can connect to the virtual machine using:

        vagrant ssh

  No password is necessary, and you can logout via the normal `exit`.  Note
  that you do not need to install any other ssh software; vagrant has
  everything you need.

* You should connect via `vagrant ssh`.  By default, the virtual machine is
  hidden behind a NAT firewall, and you normally cannot connect to it from the
  outside.  Of course, this being linux, you can change that, but that's
  beyond the scope of this project; you're on your own if you want to do that.

* The directory containing the "Vagrantfile" can be accessed inside the
  virtual machine, via the path `/Vagrant`.

* To suspend the virtual machine, do:

        vagrant suspend

* To restart a suspended virtual machine, do:

        vagrant up

  or:

        vagrant resume

* To shut down the virtual machine:

        vagrant halt

  You can, of course, use the regular linux commands to shut down the system.

* To destroy and annihilate the virtual machine and reclaim all disk space:

        vagrant destroy

* To obtain the Spark firmware source code, a convenience script has been
  provided.  To use it, chdir to some convenient location, and then run:

        /vagrant/firmware-init

  This will create a directory called `spark` in the current directory, and
  download the source files below that.

* To build the firmware, run:

        /vagrant/firmware-build

  This assumes that the current directory is the one where you just ran
  `/vagrant/firmware-init` (the directory that contains the `spark`
  directory).

* Flashing the firmware from the USB interface in virtual machine hasn't been
  tested, and might not work.  It's probably best to flash from the host
  system.

  To help with this, you can put the spark firmware build tree on the host
  system.  You can take advantage of `/vagrant` for this.  While builds below
  `/vagrant` are slower than builds on the virtual machine's hard disk, the
  firmware doesn't take that long to build.

  Example:

        cd /vagrant
        /vagrant/firmware-init
        /vagrant/firmware-build

  At this point, the new firmware can be found as
  `/vagrant/spark/core-firmware/build/core-firmware.bin`.  However, because
  `/vagrant` is shared between the linux guest and the virtualbox host, you
  can use the host to transfer the new firmware to the core.



