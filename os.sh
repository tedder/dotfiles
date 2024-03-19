#!/bin/bash

OS=$(awk -F= '/^NAME/{print $2}' /etc/os-release)
#echo $OS
if [[ $OS == *"Ubuntu"* ]]; then
  echo $OS
fi

