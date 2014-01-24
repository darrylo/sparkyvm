#! /usr/bin/env bash

# Update the repository, because it can be out-of-date, and be unable to find
# some packages.
sudo apt-get update

# Install apt-get-repository:
sudo apt-get -y install python-software-properties

# Add the ARM gcc repository, as well as the public key:
sudo add-apt-repository -y ppa:terry.guo/gcc-arm-embedded

# Re-update the repository, to get the info from the ARM gcc repository:
sudo apt-get update

# Install additional software.
#
# Note that, in addition to the tools needed to build the spark core,
# additional packages are installed:
#
#       screen
#       vim
#
sudo apt-get install -y gcc-arm-none-eabi make dfu-util git
sudo apt-get install -y screen vim
