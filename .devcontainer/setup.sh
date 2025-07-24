#!/bin/bash

# 安装依赖
sudo apt-get update
sudo apt-get install -y openjdk-17-jdk wget unzip ninja-build libgtk-3-dev

# 安装 Android SDK（命令行工具）
mkdir -p $HOME/android-sdk
cd $HOME/android-sdk
wget https://dl.google.com/android/repository/commandlinetools-linux-10406996_latest.zip -O cmdline-tools.zip
unzip cmdline-tools.zip -d latest
rm cmdline-tools.zip
export ANDROID_SDK_ROOT=$HOME/android-sdk
echo 'export ANDROID_SDK_ROOT=$HOME/android-sdk' >> ~/.bashrc
export PATH="$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/emulator"
echo 'export PATH="$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/emulator:$PATH"' >> ~/.bashrc

# 清理舊版 flutter（如有）
sudo rm -rf /usr/local/bin/flutter
sudo rm -rf /usr/bin/flutter
sudo rm -rf /opt/flutter

# 安装 Flutter 2.17.1 SDK（Dart 2.17.0）
cd ~
wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.24.1-stable.tar.xz
mkdir -p $HOME/flutter
tar xf flutter_linux_3.24.1-stable.tar.xz -C $HOME
export PATH="$HOME/flutter/bin:$PATH"
echo 'export PATH="$HOME/flutter/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

# Flutter doctor 检查
flutter doctor