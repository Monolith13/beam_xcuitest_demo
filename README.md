# About
This project contain iOS native UI-test for [Beam](https://beamreddit.com) app. Test based on XCUITest framework (engine) + XCfit (BDD) + Allure report (report).   


## Requirements

* macOS ≥ 10.13.4
* Xcode ≥ 9.4
* [Homebrew](https://brew.sh)
* Ruby ≥ 2.3 
* [JDK](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html) ≥ 8

## Preparation

* Install xcfit with this command:

	> sudo gem install xcfit

* Install carthage from homebrew

	> brew install carthage

* Install allure-commandline from homebrew

	> brew install allure

* Install bundler gem and gems from bundle

	> gem install bundler
	> cd ~/beam_xcuitest_demo
	> bundle install 

* Install swift dependencies via carthage

	> cd ~/beam_xcuitest_demo
	> carthage update

* Edit SampleConfig.swift with the required values and rename it to Config.swift ([API doc](https://github.com/reddit-archive/reddit/wiki/OAuth2) of reddit)

## Run tests

Local run tests

    > # First - manually boot iOS simulator e.g. iPhone 8 Plus 11.4
    > cd ~/beam_xcuitest_demo
    > xcodebuild -scheme "Xcode9-XCTest" -destination 'platform=iOS Simulator,name=iPhone 8 Plus,OS=11.4' build test CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO
    > allure serve ~/Library/Developer/Xcode/DerivedData/Beam**/Logs/Test

Run tests from CI

    > cd ~/beam_xcuitest_demo
    > bash ./ci/update.sh ${UPD_HOMEBREW} ${UPD_CARTHAGE} ${UPD_PODS} ${UPD_ALLURE} ${UPD_GEM}
    > bash ./ci/start,sh ${DEVICE} ${HEADLESS}
    
