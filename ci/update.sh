#!/bin/bash --login

# UPD_HOMEBREW - обновление всех brew-зависимостей
# Values: true, false
export UPD_HOMEBREW=$1
if [[ ${UPD_HOMEBREW} == true ]];  then
  echo "---------------------------------------------"
  echo "Updating brew-dependencies"
  echo "---------------------------------------------"
  brew upgrade
fi

# UPD_CARTHAGE - обновление node js
# Values: true, false
export UPD_CARTHAGE=$2
if [[ ${UPD_CARTHAGE} == true ]];  then
  echo "---------------------------------------------"
  echo "Updating carthage-dependencies"
  echo "---------------------------------------------"
  cd ${WORKSPACE}/
  carthage update
fi

# UPD_PODS - обновление appium-server
# Values: true, false
export UPD_PODS=$3
if [[ ${UPD_PODS} == true ]];  then
  echo "---------------------------------------------"
  echo "Updating cocoapods dependencies"
  echo "---------------------------------------------"
  cd ${WORKSPACE}/
  pod update
fi

# UPD_ALLURE - обновление allure-commandline
# Values: true, false
export UPD_ALLURE=$4
if [[ ${UPD_ALLURE} == true ]] && [[ ${UPD_HOMEBREW} == false ]];  then
  echo "---------------------------------------------"
  echo "Updating allure-commandline"
  echo "---------------------------------------------"
  brew upgrade allure
fi

# UPD_GEM - обновление python зависимостей
# Values: true, false
export UPD_GEM=$5
if [[ ${UPD_GEM} == true ]];  then
  echo "---------------------------------------------"
  echo "Updating rubygems-dependencies"
  echo "---------------------------------------------"
  cd ${WORKSPACE}/
  bundle update
fi
