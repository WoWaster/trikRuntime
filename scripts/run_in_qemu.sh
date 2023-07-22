#!/bin/bash
set -euxo pipefail

echo "Installing Debian packages"
apt-get update
apt-get install --yes --no-install-recommends build-essential qt5-qmake qtbase5-dev qtmultimedia5-dev libqt5svg5-dev qtscript5-dev rsync libusb-1.0-0-dev python3-dev libqt5serialport5-dev libudev-dev libqt5svg5-dev qtwayland5 qtbase5-private-dev qttools5-dev-tools ccache

echo "Checking available tools"
uname -a
rsync --version
qmake --version && qmake -query
python3 --version
which g++
g++ --version
ccache --version

qmakeConfig="CONFIG+=release CONFIG+=trik_nopython CONFIG+=tests CONFIG+=noPch CONFIG+=ccache"

echo "Configuring with QMake"
qmake $qmakeConfig .

echo "Running qmake_all"
make -j $(nproc) qmake_all

echo "Making project"
make -j $(nproc) all

echo "Running unit tests"
make -k check TESTARGS="-platform offscreen"
