# 🚀 GitHub Actions Workflow for Flutter Tests

This directory contains GitHub Actions workflows that automatically test your Flutter app on multiple platforms.

## 📋 Available Workflows

### 1. **`flutter_tests_simple.yml`** (Recommended)
- **Purpose**: Comprehensive testing across all platforms
- **Triggers**: Push, Pull Request, Manual dispatch
- **Platforms**: Android, iOS, Web, macOS, Windows, Linux

### 2. **`flutter_tests.yml`** (Advanced)
- **Purpose**: Full testing with dependencies and advanced features
- **Note**: This is a more complex workflow with additional features

## 🎯 What Gets Tested

### **Unit Tests & Analysis**
- ✅ **Static Analysis**: `flutter analyze`
- ✅ **Unit Tests**: `flutter test --coverage`
- ✅ **Code Coverage**: Uploaded to Codecov

### **Integration Tests**
- ✅ **Android**: Integration tests on Android emulator
- ✅ **iOS**: Integration tests on iOS simulator
- ✅ **Web**: Integration tests on web platform
- ✅ **Desktop**: Tests on macOS, Windows, and Linux

### **Patrol Tests**
- ✅ **Advanced Testing**: Using Patrol framework
- ✅ **Cross-Platform**: All supported platforms
- ✅ **Complex Scenarios**: Advanced user interaction testing

### **Build Verification**
- ✅ **Web Build**: `flutter build web`
- ✅ **Android Build**: `flutter build apk --debug`
- ✅ **Platform Builds**: All supported platforms

## 🚀 How to Use

### **Automatic Triggers**
The workflow runs automatically on:
- **Push** to `main`, `master`, or `develop` branches
- **Pull Request** to `main`, `master`, or `develop` branches

### **Manual Trigger**
1. Go to **Actions** tab in your GitHub repository
2. Select **Flutter Tests** workflow
3. Click **Run workflow**
4. Choose platform (optional)
5. Click **Run workflow**

### **Platform Selection**
When manually triggering, you can choose:
- **all**: Run tests on all platforms
- **android**: Android tests only
- **ios**: iOS tests only
- **web**: Web tests only
- **desktop**: Desktop platform tests only

## 📱 Test Platforms

### **Mobile Platforms**
- **Android**: Ubuntu runner with Android emulator
- **iOS**: macOS runner with iOS simulator

### **Web Platform**
- **Web**: Ubuntu runner with web-server device
- **Browser Testing**: Chrome-based testing

### **Desktop Platforms**
- **macOS**: Native macOS runner
- **Windows**: Windows runner
- **Linux**: Ubuntu runner with GTK dependencies

## ⏱️ Timeouts & Performance

### **Test Timeouts**
- **Unit Tests**: No timeout (fast execution)
- **Integration Tests**: 10-15 minutes per platform
- **Build Tests**: 10 minutes per platform

### **Parallel Execution**
- **Independent Jobs**: Each platform runs independently
- **Faster Results**: No waiting for other platforms
- **Resource Efficiency**: Optimal use of GitHub runners

## 📊 Test Results & Reports

### **GitHub Summary**
- **Test Results**: Summary of all test outcomes
- **Coverage Report**: Code coverage information
- **Platform Status**: Success/failure for each platform

### **Artifacts**
- **Coverage Data**: LCOV coverage reports
- **Build Outputs**: Generated build files
- **Test Logs**: Detailed test execution logs

### **Codecov Integration**
- **Coverage Tracking**: Automatic coverage upload
- **Trend Analysis**: Coverage over time
- **Quality Gates**: Coverage thresholds

## 🔧 Configuration

### **Environment Variables**
```yaml
env:
  FLUTTER_VERSION: '3.19.0'  # Flutter SDK version
```

### **Runner Requirements**
- **Ubuntu**: `ubuntu-latest` for most tests
- **macOS**: `macos-latest` for iOS and macOS tests
- **Windows**: `windows-latest` for Windows tests

### **Dependencies**
- **Flutter**: Latest stable channel
- **Java**: JDK 17 for Android tests
- **Android SDK**: Latest Android tools
- **Xcode**: Latest iOS development tools

## 🐛 Troubleshooting

### **Common Issues**

#### 1. **Android Emulator Fails**
```bash
# Check Android SDK setup
echo $ANDROID_HOME
ls -la $ANDROID_HOME

# Verify emulator creation
$ANDROID_HOME/tools/bin/avdmanager list avd
```

#### 2. **iOS Simulator Issues**
```bash
# Check available simulators
xcrun simctl list devices

# Verify simulator creation
xcrun simctl create "Test Device" "iPhone 15 Pro" "iOS17.0"
```

#### 3. **Web Tests Fail**
```bash
# Enable web support
flutter config --enable-web

# Check web device
flutter devices
```

#### 4. **Build Failures**
```bash
# Clean and rebuild
flutter clean
flutter pub get
flutter build web
```

### **Debug Steps**
1. **Check Workflow Logs**: Detailed logs in GitHub Actions
2. **Verify Dependencies**: Ensure all required tools are available
3. **Test Locally**: Run tests locally before pushing
4. **Check Platform Support**: Verify platform-specific requirements

## 📈 Monitoring & Metrics

### **Success Metrics**
- **Test Pass Rate**: All tests should pass
- **Coverage Goals**: Aim for >80% code coverage
- **Build Success**: All platform builds should succeed
- **Execution Time**: Tests complete within timeouts

### **Quality Gates**
- **Unit Tests**: Must pass 100%
- **Integration Tests**: Must pass on all platforms
- **Build Tests**: All platforms must build successfully
- **Coverage**: Maintain minimum coverage threshold

## 🚀 Best Practices

### **Workflow Design**
1. **Independent Jobs**: Each platform runs independently
2. **Fast Feedback**: Unit tests run first
3. **Resource Efficiency**: Use appropriate runners
4. **Error Handling**: Graceful failure handling

### **Test Organization**
1. **Clear Naming**: Descriptive job and step names
2. **Logical Grouping**: Related tests grouped together
3. **Proper Dependencies**: Minimal job dependencies
4. **Timeout Management**: Appropriate timeouts for each step

### **Maintenance**
1. **Regular Updates**: Keep Flutter version current
2. **Dependency Updates**: Update GitHub Actions versions
3. **Platform Testing**: Test on all supported platforms
4. **Documentation**: Keep workflow documentation current

## 🔗 Related Resources

### **GitHub Actions**
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Flutter GitHub Actions](https://github.com/subosito/flutter-action)
- [Android Setup Action](https://github.com/android-actions/setup-android)

### **Flutter Testing**
- [Flutter Testing Guide](https://docs.flutter.dev/testing)
- [Integration Testing](https://docs.flutter.dev/cookbook/testing/integration/introduction)
- [Patrol Framework](https://patrol.leancode.co/)

### **Code Coverage**
- [Codecov Documentation](https://docs.codecov.io/)
- [LCOV Format](https://github.com/linux-test-project/lcov)

---

## 🎉 **Ready to Use!**

Your GitHub Actions workflow is now configured to:
- ✅ **Automatically test** on every push and PR
- ✅ **Run on all platforms** (Mobile, Web, Desktop)
- ✅ **Provide detailed reports** and coverage data
- ✅ **Handle errors gracefully** with proper timeouts
- ✅ **Generate artifacts** for debugging and analysis

**Happy Testing! 🧪✨**
