#!/bin/bash
# Daily Plan APK 构建脚本
# 使用方法: ./build-apk.sh

set -e

echo "📱 开始构建每日计划 APK..."

# 1. 安装依赖
echo "📦 安装npm依赖..."
npm install

# 2. 构建Web应用
echo "🔨 构建Web应用..."
npm run build

# 3. 同步到Android
echo "📱 同步到Android平台..."
npx cap sync android

# 4. 构建APK
echo "🔧 构建Android APK..."
cd android
chmod +x gradlew
./gradlew assembleDebug

# 5. 复制APK到根目录
echo "📋 复制APK到项目根目录..."
cp app/build/outputs/apk/debug/app-debug.apk ../DailyPlan.apk

cd ..

# 完成
echo ""
echo "✅ 构建完成！"
echo "📍 APK位置: $(pwd)/DailyPlan.apk"
echo ""
echo "安装到设备:"
echo "  adb install DailyPlan.apk"
