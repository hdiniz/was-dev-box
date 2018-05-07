#!/bin/sh

echo "Installing tools"
apt-get update
apt-get install -y default-jre maven git vim unzip
echo "dash dash/sh boolean false" | debconf-set-selections
dpkg-reconfigure -p critical dash
