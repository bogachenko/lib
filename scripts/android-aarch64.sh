#!/bin/bash

# Android aarch64
# Author: Bogachenko Vyacheslav <bogachenkove@gmail.com>

pkg install root-repo x11-repo
pkg upgrade
termux-change-repo
pkg install --no-install-recommends tor vim iw htop cmake make git speedtest-go php openssh python tsu ruby wget curl hwinfo termux-api termux-tools termux-auth