#!/bin/bash

#更新软件
echo '开始，检测软件并更新'
sudo pacman -Syyu
echo '软件更新完成'

#更换软件源
echo '开始检测国内源'
sudo pacman-mirrors -i -c China -m rank
echo '软件源更换完成'

#安装搜狗输入法 fcitx-im 不适用于Gnome3桌面
echo '开始安装搜狗输入法'
sudo pacman -S fcitx-im fcitx-configtool fcitx-sogoupinyin
echo '搜狗输入法安装完成'
