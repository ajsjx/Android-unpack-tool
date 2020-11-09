#!/bin/bash

echo "你正在使用危险操作，这将清除所有out目录及转换后的文件"
echo "这将恢复工具为初始状态"
echo "开始清理"

sudo rm -rf ./BR/*
sudo rm -rf ./DAT/*
sudo rm -rf ./IMG/*
sudo rm -rf ./Payload/*
sudo rm -rf ./ZIP/*

echo "清理完成"
