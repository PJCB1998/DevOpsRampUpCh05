#!/bin/bash

os_version=$(cat /etc/os-release | grep PRETTY_NAME= | cut -d "=" -f 2)

release_number=$(cat /etc/os-release | grep VERSION= | cut -d "=" -f 2)

kernel_version=$(uname -r)

echo "OS version: $os_version"
echo "Release number: $release_number"
echo "Kernel version: $kernel_version"
