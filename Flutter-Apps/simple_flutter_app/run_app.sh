#!/bin/bash

# Simple Flutter App Launcher Script
# This script provides easy commands to run the Flutter app on different platforms

echo "🚀 Simple Flutter App Launcher"
echo "================================"

# Function to check if Flutter is available
check_flutter() {
    if ! command -v flutter &> /dev/null; then
        echo "❌ Flutter is not installed or not in PATH"
        echo "Please install Flutter from: https://flutter.dev/docs/get-started/install"
        exit 1
    fi
}

# Function to run on web
run_web() {
    echo "🌐 Starting Flutter app on web..."
    echo "The app will open in your default browser"
    echo "Press Ctrl+C to stop the app"
    echo ""
    flutter run -d web-server --web-port 8080
}

# Function to run on mobile (Android/iOS)
run_mobile() {
    echo "📱 Starting Flutter app on mobile..."
    echo "Make sure you have a device connected or emulator running"
    echo "Press Ctrl+C to stop the app"
    echo ""
    flutter run
}

# Function to run on specific platform
run_platform() {
    local platform=$1
    echo "🖥️  Starting Flutter app on $platform..."
    echo "Press Ctrl+C to stop the app"
    echo ""
    flutter run -d $platform
}

# Function to build for production
build_app() {
    local platform=$1
    echo "🏗️  Building Flutter app for $platform..."
    
    case $platform in
        "web")
            flutter build web
            echo "✅ Web build completed! Check the 'build/web' directory"
            ;;
        "android")
            flutter build apk
            echo "✅ Android APK build completed! Check the 'build/app/outputs/flutter-apk' directory"
            ;;
        "ios")
            flutter build ios
            echo "✅ iOS build completed!"
            ;;
        "macos")
            flutter build macos
            echo "✅ macOS build completed!"
            ;;
        "windows")
            flutter build windows
            echo "✅ Windows build completed!"
            ;;
        "linux")
            flutter build linux
            echo "✅ Linux build completed!"
            ;;
        *)
            echo "❌ Unknown platform: $platform"
            echo "Supported platforms: web, android, ios, macos, windows, linux"
            ;;
    esac
}

# Function to show help
show_help() {
    echo "Usage: $0 [COMMAND]"
    echo ""
    echo "Commands:"
    echo "  web          Run the app on web platform"
    echo "  mobile       Run the app on mobile platform (Android/iOS)"
    echo "  android      Run the app on Android"
    echo "  ios          Run the app on iOS"
    echo "  macos        Run the app on macOS"
    echo "  windows      Run the app on Windows"
    echo "  linux        Run the app on Linux"
    echo "  build-web    Build the app for web production"
    echo "  build-android Build the app for Android production"
    echo "  build-ios    Build the app for iOS production"
    echo "  build-macos  Build the app for macOS production"
    echo "  build-windows Build the app for Windows production"
    echo "  build-linux  Build the app for Linux production"
    echo "  doctor       Run Flutter doctor to check setup"
    echo "  clean        Clean the Flutter build cache"
    echo "  test         Run tests (see ./run_tests.sh for test options)"
    echo "  help         Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 web           # Run on web"
    echo "  $0 mobile        # Run on mobile"
    echo "  $0 build-web     # Build for web"
    echo "  $0 test          # Run tests"
    echo ""
    echo "For detailed testing options, run: ./run_tests.sh help"
}

# Function to clean build cache
clean_build() {
    echo "🧹 Cleaning Flutter build cache..."
    flutter clean
    flutter pub get
    echo "✅ Build cache cleaned!"
}

# Main script logic
main() {
    check_flutter
    
    case $1 in
        "web")
            run_web
            ;;
        "mobile")
            run_mobile
            ;;
        "android")
            run_platform "android"
            ;;
        "ios")
            run_platform "ios"
            ;;
        "macos")
            run_platform "macos"
            ;;
        "windows")
            run_platform "windows"
            ;;
        "linux")
            run_platform "linux"
            ;;
        "build-web")
            build_app "web"
            ;;
        "build-android")
            build_app "android"
            ;;
        "build-ios")
            build_app "ios"
            ;;
        "build-macos")
            build_app "macos"
            ;;
        "build-windows")
            build_app "windows"
            ;;
        "build-linux")
            build_app "linux"
            ;;
        "doctor")
            echo "🔍 Running Flutter doctor..."
            flutter doctor
            ;;
        "clean")
            clean_build
            ;;
        "test")
            echo "🧪 Running tests..."
            echo "For detailed test options, run: ./run_tests.sh help"
            ./run_tests.sh help
            ;;
        "help"|"-h"|"--help"|"")
            show_help
            ;;
        *)
            echo "❌ Unknown command: $1"
            echo "Use '$0 help' to see available commands"
            exit 1
            ;;
    esac
}

# Run the main function with all arguments
main "$@"
