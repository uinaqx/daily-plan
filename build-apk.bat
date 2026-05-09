#!/bin/bash
# Windows 批处理脚本 - Daily Plan APK 构建
# 使用方法: build-apk.bat

@echo off
echo 📱 开始构建每日计划 APK...

rem 1. 安装依赖
echo 📦 安装npm依赖...
call npm install

rem 2. 构建Web应用
echo 🔨 构建Web应用...
call npm run build

rem 3. 同步到Android
echo 📱 同步到Android平台...
call npx cap sync android

rem 4. 构建APK
echo 🔧 构建Android APK...
cd android
call gradlew.bat assembleDebug

rem 5. 复制APK到根目录
echo 📋 复制APK到项目根目录...
copy app\build\outputs\apk\debug\app-debug.apk ..\DailyPlan.apk

cd ..

rem 完成
echo.
echo ✅ 构建完成！
echo 📍 APK位置: %cd%\DailyPlan.apk
echo.
echo 安装到设备:
echo   adb install DailyPlan.apk
pause
