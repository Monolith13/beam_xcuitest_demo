#!/bin/bash --login
# DEVICE - определяет на каком устройстве(ах) будут проводиться тесты.
# Value type: string
export DEVICE=$1

# HEADLESS - определяет режим запуска iOS симулятора - GUI (false) или non-GUI (true)
# Values: true, false
export HEADLESS=$2

echo "---------------------------------------------"
echo "Prepare files and folders"
echo "---------------------------------------------"
rm -rf ${WORKSPACE}/report
rm -rf ~/Library/Developer/Xcode/DerivedData/Beam**/Logs/Test
rm -rf ${WORKSPACE}/builds/
mkdir ${WORKSPACE}/report/

echo "---------------------------------------------"
echo "Check network connection"
echo "---------------------------------------------"
cd ${WORKSPACE}/
ruby ./ci/status.rb || exit 1

if [[ ${HEADLESS} == false ]]; then
    echo "---------------------------------------------"
    echo "Run iOS simulator"
    echo "---------------------------------------------"
    xcrun simctl boot alias_${DEVICE)
    sleep 30s
end

echo "---------------------------------------------"
echo "Run autotest"
echo "---------------------------------------------"
xcodebuild -scheme "Xcode9-XCTest" -destination 'platform=iOS Simulator,name=${DEVICE},OS=11.4' build test CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO

echo "---------------------------------------------"
echo "Add environment to report"
echo "---------------------------------------------"
cp -r ~/Library/Developer/Xcode/DerivedData/Beam**/Logs/Test ${WORKSPACE}/report/
ruby ./ci/update_env.rb ${DEVICE}

echo "---------------------------------------------"
echo "Quit simulators"
echo "---------------------------------------------"
xcrun simctl shutdown all

