# 🚀 Quick Start Guide

Get your Simple Flutter App running in minutes!

## ⚡ Quick Commands

### 1. Install Dependencies
```bash
flutter pub get
```

### 2. Run on Web (Fastest way to test)
```bash
./run_app.sh web
```
Then open your browser to `http://localhost:8080`

### 3. Run on Mobile
```bash
./run_app.sh mobile
```
Make sure you have a device connected or emulator running.

## 🌐 Web Platform (Recommended for testing)

The web platform is the fastest way to test your app:

```bash
# Using the launcher script
./run_app.sh web

# Or manually
flutter run -d web-server --web-port 8080
```

## 📱 Mobile Platform

### Android
```bash
./run_app.sh android
```

### iOS
```bash
./run_app.sh ios
```

## 🖥️ Desktop Platforms

### macOS
```bash
./run_app.sh macos
```

### Windows
```bash
./run_app.sh windows
```

### Linux
```bash
./run_app.sh linux
```

## 🏗️ Build for Production

### Web
```bash
./run_app.sh build-web
```

### Android APK
```bash
./run_app.sh build-android
```

## 🧹 Troubleshooting

### Clean Build Cache
```bash
./run_app.sh clean
```

### Check Flutter Setup
```bash
./run_app.sh doctor
```

## 📱 What You'll See

The app features:
- ✨ Beautiful gradient background
- 🎨 Modern Material Design 3 UI
- 📱 Responsive design that adapts to screen size
- 🔢 Interactive counter with beautiful buttons
- 📊 Platform information display
- 🎭 Smooth animations and transitions

## 🎯 Next Steps

1. **Customize Colors**: Edit the `ColorScheme` in `main.dart`
2. **Add Features**: Modify the feature grid in `_buildFeaturesGrid()`
3. **Change Icons**: Update the icons in the feature items
4. **Add Pages**: Extend the bottom navigation functionality

## 🆘 Need Help?

- Run `./run_app.sh help` for all available commands
- Check the main [README.md](README.md) for detailed documentation
- Visit [Flutter documentation](https://docs.flutter.dev/)

---

**Happy Fluttering! 🚀**
