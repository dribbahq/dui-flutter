#!/bin/sh

cd $CI_WORKSPACE 

# Install Flutter using git.
git clone https://github.com/flutter/flutter.git --depth 1 -b stable $HOME/flutter
export PATH="$PATH:$HOME/flutter/bin"

flutter precache --ios
echo "Installed flutter to `pwd`/flutter"

# Install Flutter dependencies.
flutter pub get

# Generate GQL Schema Files
flutter pub run build_runner build --delete-conflicting-outputs

# Install CocoaPods using Homebrew.
HOMEBREW_NO_AUTO_UPDATE=1
brew install cocoapods
pod --version

# cd ios && pod install # run `pod install` in the `ios` directory.

# Install CocoaPods dependencies.
# cd ios
# arch -x86_64 pod update # run `pod install` in the `ios` directory.
# arch -x86_64 pod install # run `pod install` in the `ios` directory.

flutter build ipa -t lib/main.dart

find ios/Pods -name 'Pods-Runner-frameworks.sh' -type f -exec sed -i '' 's/source="$(readlink "${source}")"/source="$(readlink -f "${source}")"/' {} \;

exit 0