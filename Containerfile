ARG FEDORA_MAJOR_VERSION="${FEDORA_MAJOR_VERSION:-40}"
ARG SOURCE_IMAGE="aurora"
ARG SOURCE_SUFFIX="-dx"
ARG SOURCE_TAG="latest"

FROM ghcr.io/ublue-os/${SOURCE_IMAGE}${SOURCE_SUFFIX}:${SOURCE_TAG}

ARG FEDORA_MAJOR_VERSION

RUN mkdir -p /var/lib/alternatives \
  && rpm-ostree install \
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
  xz-devel \
  && ostree container commit

ENV PREFIX /tmp/python-build
RUN git clone https://github.com/pyenv/pyenv.git /tmp/pyenv \
  && /tmp/pyenv/plugins/python-build/install.sh \
  && tree /tmp/python-build \
  && /tmp/python-build/bin/python-build 3.12 /tmp/python \
  && /tmp/python --version

COPY system /
COPY build /tmp/build

## NOTES:
# - /var/lib/alternatives is required to prevent failure with some RPM installs
# - All RUN commands must end with ostree container commit
#   see: https://coreos.github.io/rpm-ostree/container/#using-ostree-container-commit
RUN mkdir -p /var/lib/alternatives \
  && bash -c ". /tmp/build/build.sh" \
  && rm -rf /tmp/* /var/* \
  && mkdir -p /var/tmp \
  && chmod -R 1777 /var/tmp \
  && ostree container commit
