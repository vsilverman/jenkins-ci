#!/usr/bin/env bash

echo "------------------------------"
echo "*** Verifying chromedriver ***"
if [ ! -f "chromedriver" ]; then
    OS="`uname`"
    case $OS in
      'Darwin')
        OS='Mac'
        curl -OL https://chromedriver.storage.googleapis.com/2.44/chromedriver_mac64.zip
        unzip chromedriver_mac64.zip
        rm chromedriver_mac64.zip
        ;;
      'Linux')
        OS='Linux'
        curl -OL https://chromedriver.storage.googleapis.com/2.44/chromedriver_linux64.zip
        unzip chromedriver_linux64.zip
        rm chromedriver_linux64.zip
        ;;
      'WindowsNT')
        OS='Windows'
        curl -OL https://chromedriver.storage.googleapis.com/2.44/chromedriver_win32.zip
        unzip chromedriver_win32.zip
        rm chromedriver_win32.zip
        ;;
      *) ;;
    esac
else
    echo "file 'chromedriver' already exists"
fi
