#!/usr/bin/env bash

set -ouex pipefail

curl -Lo /etc/yum.repos.d/yadm.repo https://download.opensuse.org/repositories/home:TheLocehiliosan:yadm/Fedora_"${FEDORA_MAJOR_VERSION}"/home:TheLocehiliosan:yadm.repo

rpm-ostree install yadm

rm -f /etc/yum.repos.d/yadm.repo
