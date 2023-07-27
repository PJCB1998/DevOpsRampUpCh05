#!/bin/bash

if systemctl is-active cups.service
then
  echo "CUPS is running"
else
  echo "CUPS is not running"
fi
