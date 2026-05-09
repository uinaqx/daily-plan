# 每日计划 · 高级版

一个跨平台的每日计划工具，支持 Web 浏览器和 Android 手机 APK。

## 功能特性

- ✅ 添加、完成、删除每日任务
- ⏱️ 记录每个任务的预计分钟数
- 📊 自动统计任务总数、已完成数量、预计总时长和已完成时长
- 🔄 环形进度展示当天完成率
- 📈 近 7 天完成率趋势图
- 📅 本月完成情况热力图视图
- 🌓 深色/浅色主题自动切换
- 💾 自动保存到本地存储
- 📱 完美的移动端响应式设计
- 🔔 支持 Android APK 独立安装使用

## 技术架构

- **前端**: 原生 HTML + CSS + JavaScript
- **构建工具**: Vite
- **移动端**: Capacitor (打包为 Android APK)
- **数据存储**: 浏览器 localStorage / Android SharedPreferences

## 快速开始

### Web 版本

直接在浏览器中打开 `index.html` 文件，或启动本地服务：

```bash
# 使用 Python 启动服务
python -m http.server 8000

# 访问 http://localhost:8000
```

### Android APK 版本

#### 方式一：使用构建脚本（推荐）

在有网络的环境下运行：

**macOS / Linux:**
```bash
chmod +x build-apk.sh
./build-apk.sh
```

**Windows:**
```batch
build-apk.bat
```

构建完成后，APK 文件会生成在项目根目录：`DailyPlan.apk`

#### 方式二：手动构建

```bash
# 1. 安装依赖
npm install

# 2. 构建 Web 应用
npm run build

# 3. 添加 Android 平台
npx cap add android

# 4. 同步到 Android
npx cap sync android

# 5. 打开 Android Studio
npx cap open android

# 6. 在 Android Studio 中点击 Build > Build Bundle(s) / APK(s) > Build APK(s)
```

#### 方式三：使用 Gradle 直接构建

```bash
cd android
./gradlew assembleDebug
```

APK 文件位置：`android/app/build/outputs/apk/debug/app-debug.apk`

## 安装 APK 到手机

```bash
# 使用 ADB 安装
adb install DailyPlan.apk

# 或直接传输 APK 文件到手机，通过文件管理器安装
```

## 项目结构

```
daily-plan/
├── index.html              # 主应用文件
├── vite.config.js          # Vite 配置
├── package.json            # npm 依赖配置
├── capacitor.config.json    # Capacitor 配置
├── build-apk.sh           # Linux/Mac 构建脚本
├── build-apk.bat          # Windows 构建脚本
├── dist/                   # Vite 构建输出目录
│   └── index.html
└── android/                # Android 原生项目
    ├── app/
    │   ├── src/main/
    │   │   ├── assets/public/   # Web 应用资源
    │   │   ├── java/             # Java 源码
    │   │   └── res/             # Android 资源
    │   └── build.gradle
    └── build.gradle
```

## 数据存储

任务数据保存在设备的本地存储中：

- **Web 版本**: `localStorage`
- **Android 版本**: 应用私有存储 (SharedPreferences)

数据格式：
```json
{
  "id": "唯一ID",
  "text": "任务内容",
  "minutes": 预计分钟数,
  "done": false,
  "createdAt": "创建时间"
}
```

## 数据同步说明

- 同一设备上数据自动保持同步
- Web 版本和 APK 版本使用不同的存储空间
- 如需跨设备同步，可导出 JSON 数据备份

## 开发相关

### 调试 Android 应用

```bash
# 启动 Android Studio
npx cap open android

# 或使用命令行
adb logcat -s Capacitor
```

### 更新 Web 应用后重新打包

```bash
npm run build
npx cap sync android
```

## 浏览器兼容性

- Chrome 80+
- Firefox 75+
- Safari 13+
- Edge 80+

## 许可证

MIT License

## 更新日志

### v2.0.0
- ✨ 新增 Android APK 支持
- 🎨 优化移动端响应式设计
- 📱 添加底部导航栏
- 🔧 改进触摸交互体验
- ⚡ 性能优化
