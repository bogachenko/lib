#!/bin/bash

# Android aarch64
# Author: Bogachenko Vyacheslav <bogachenkove@gmail.com>

pkg install root-repo x11-repo
pkg upgrade
termux-change-repo
pkg install tor vim iw htop cmake make git
