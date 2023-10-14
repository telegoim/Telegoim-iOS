#!/bin/zsh

function generateCode() {
    python3 -u build-system/Make/Make.py \
            --overrideXcodeVersion \
            generateProject \
            --configurationPath="build-system/appstore-configuration.json" \
            --codesigningInformationPath=build-system/fake-codesigning
}

function ipa() {
    python3 -u build-system/Make/Make.py \
            --overrideXcodeVersion \
            build \
            --configurationPath="build-system/appstore-configuration.json" \
            --codesigningInformationPath=build-system/fake-codesigning \
            --configuration=release_arm64 \
            --buildNumber=11001
}

