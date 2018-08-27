# About
This project contain iOS native UI-test for [Beam](https://beamreddit.com) app.

## Requirements

* macOS ≥ 10.13.4
* Xcode ≥ 9.4
* [Homebrew](https://brew.sh)
* Ruby ≥ 2.3 
* [JDK](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html) ≥ 8

## Preparation

* Install carthage from homebrew
* Install allure report from homebrew
* Install bundler gem and gems from bundle
* Install swift dependencies via carthage
* Edit SampleConfig.swift with the required values and rename it to Config.swift ([API doc](https://github.com/reddit-archive/reddit/wiki/OAuth2) of reddit)

## Run tests

Local run tests

    # First - manually boot iOS simulator e.g. iPhone 8 Plus 11.4
    cd ~/beam_xcuitest_demo
    xcodebuild -scheme "Xcode9-XCTest" -destination 'platform=iOS Simulator,name=iPhone 8 Plus,OS=11.4' build test CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO


Run tests from CI
    
    bash ./ci/update.sh ${UPD_HOMEBREW} ${UPD_CARTHAGE} ${UPD_PODS} ${UPD_ALLURE} ${UPD_GEM}
    bash ./ci/start,sh ${DEVICE} ${HEADLESS}
    
