#!/usr/bin/env bash

set -ouex pipefail

curl -Lo /etc/yum.repos.d/keyd.repo https://copr.fedorainfracloud.org/coprs/alternateved/keyd/repo/fedora-"${FEDORA_MAJOR_VERSION}"/alternateved-keyd-fedora-"${FEDORA_MAJOR_VERSION}".repo

rpm-ostree install keyd

systemctl enable keyd

rm -f /etc/yum.repos.d/keyd.repo
