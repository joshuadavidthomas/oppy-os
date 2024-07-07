#!/usr/bin/env bash

set -ouex pipefail

# NOTES:
# - for pyenv, not sure why this is needed? when i use aurora-dx
#   directly it works fine, but creating my own image inheriting from
#   it doesn't?
# - zlib-ng-compat & zlib-ng-compat-devel:
#   needed for python installation on Fedora 40
#   https://fedoraproject.org/wiki/Changes/ZlibNGTransition
rpm-ostree install \
  bzip2 \
  bzip2-devel \
  gcc \
  libffi-devel \
  make \
  openssl-devel \
  patch \
  readline-devel \
  sqlite \
  sqlite-devel \
  tk-devel \
  zlib-ng-compat \
  zlib-ng-compat-devel \
  xz-devel
