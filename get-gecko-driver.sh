#!/usr/bin/env bash

echo "-----------------------------"
echo "*** Verifying geckodriver ***"
if [ ! -f "geckodriver" ]; then
    OS="`uname`"
    case $OS in
      'Darwin')
        OS='Mac'
        curl -OL https://github.com/mozilla/geckodriver/releases/download/v0.18.0/geckodriver-v0.18.0-macos.tar.gz
        tar xvfz geckodriver-v0.18.0-macos.tar.gz
        rm geckodriver-v0.18.0-macos.tar.gz
        ;;
      'Linux')
        OS='Linux'
        curl -OL https://github.com/mozilla/geckodriver/releases/download/v0.18.0/geckodriver-v0.18.0-linux64.tar.gz
        tar xvfz geckodriver-v0.18.0-linux64.tar.gz
        rm geckodriver-v0.18.0-linux64.tar.gz
        ;;
      'WindowsNT')
        OS='Windows'
        curl -OL https://github.com/mozilla/geckodriver/releases/download/v0.18.0/geckodriver-v0.18.0-win64.tar.gz
        tar xvfz geckodriver-v0.18.0-win64.tar.gz
        rm geckodriver-v0.18.0-win64.tar.gz
        ;;
      *) ;;
    esac
else
    echo "file 'geckodriver' already exists"
fi