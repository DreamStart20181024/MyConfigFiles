#!/bin/bash

#更新软件
echo '开始，检测软件并更新'
sudo pacman -Syyu
if [[ $? -eq 0]]
    then
        echo '软件更新完成'
    else
        echo '软件更新失败，重新执行'
        sudo pacman -Syyu
    fi


#更换软件源
echo '开始检测国内源'
sudo pacman-mirrors -i -c China -m rank
echo '软件源更换完成'

# 添加Arch 软件源
echo "./Config/ArchSource.txt" >> /etc/pacman.conf

# 更新软件秘钥，并更新软件
sudo pacman -Syyu & sudo pacman -S archlinuxcn-keyring


#安装Google拼音输入法
echo '开始安装Google拼音输入法'
sudo pacman -S fcitx-im fcitx-configtool fcitx-googlepinyin
echo '输入法安装完成'
