set dotenv-load := true
set unstable := true

# List all available commands
[private]
default:
    @just --list

build-iso:
    #!/usr/bin/env bash
    VARIANT=$(gum choose "base" "dx" "dx-nvidia")
    case ${VARIANT} in
        base) IMAGE_SUFFIX= ;;
        dx) IMAGE_SUFFIX=-dx ;;
        dx-nvidia)  IMAGE_SUFFIX=-dx-nvidia ;;
    esac
    mkdir -p ./output
    sudo docker run --rm --privileged --volume ./output:/build-container-installer/build --pull=always \
        ghcr.io/jasonn3/build-container-installer:latest \
        IMAGE_REPO=ghcr.io/joshuadavidthomas \
        IMAGE_NAME=oppy-os${IMAGE_SUFFIX} \
        IMAGE_TAG=latest \
        VARIANT=Silverblue
