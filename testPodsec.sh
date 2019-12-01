#!/usr/bin/env sh

sw_version=$(swift --version | head -n 1 | cut -d ' ' -f 4)
podspec=$(ls *.podspec)
pod lib lint "${podspec}" --no-clean --verbose --swift-version="${sw_version}" --use-libraries --allow-warnings