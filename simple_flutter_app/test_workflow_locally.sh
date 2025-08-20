#!/bin/bash

# Local Test Script for GitHub Actions Workflow
# This script tests the same commands that GitHub Actions will run

echo "🧪 Testing GitHub Actions Workflow Locally"
echo "=========================================="

# Check if we're in the right directory
if [ ! -f "pubspec.yaml" ]; then
    echo "❌ Error: Please run this script from the simple_flutter_app directory"
    exit 1
fi

# Function to check Flutter
check_flutter() {
    echo "🔍 Checking Flutter setup..."
    flutter --version
    flutter doctor
}

# Function to test unit tests
test_unit() {
    echo "🔬 Testing Unit Tests..."
    flutter test
}

# Function to test web
test_web() {
    echo "🌐 Testing Web..."
    flutter config --enable-web
    flutter test -d chrome
}

# Function to test Android (if emulator available)
test_android() {
    echo "📱 Testing Android..."
    
    # Check if emulator is running
    if flutter devices | grep -q "emulator"; then
        echo "✅ Emulator found, running integration tests..."
        flutter test integration_test/ -d emulator-5554
    else
        echo "⚠️  No emulator running. To test Android:"
        echo "   1. Start Android Studio"
        echo "   2. Open AVD Manager"
        echo "   3. Start an emulator"
        echo "   4. Run this script again"
    fi
}

# Function to test Patrol (if emulator available)
test_patrol() {
    echo "🚀 Testing Patrol..."
    
    # Check if emulator is running
    if flutter devices | grep -q "emulator"; then
        echo "✅ Emulator found, running Patrol tests..."
        flutter test integration_test/patrol_test.dart -d emulator-5554
    else
        echo "⚠️  No emulator running. To test Patrol:"
        echo "   1. Start Android Studio"
        echo "   2. Open AVD Manager"
        echo "   3. Start an emulator"
        echo "   4. Run this script again"
    fi
}

# Function to test dependencies
test_dependencies() {
    echo "📦 Testing Dependencies..."
    flutter pub get
    flutter pub deps
}

# Function to show help
show_help() {
    echo "Usage: $0 [COMMAND]"
    echo ""
    echo "Commands:"
    echo "  all           Run all tests (unit, web, android, patrol)"
    echo "  unit          Run unit tests only"
    echo "  web           Run web tests only"
    echo "  android       Run Android tests only (if emulator available)"
    echo "  patrol        Run Patrol tests only (if emulator available)"
    echo "  deps          Test dependencies"
    echo "  check         Check Flutter setup"
    echo "  help          Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 all        # Run all tests"
    echo "  $0 web        # Test web only"
    echo "  $0 check      # Check Flutter setup"
}

# Main script logic
main() {
    case $1 in
        "all")
            check_flutter
            test_dependencies
            test_unit
            test_web
            test_android
            test_patrol
            echo "✅ All local tests completed!"
            ;;
        "unit")
            test_unit
            ;;
        "web")
            test_web
            ;;
        "android")
            test_android
            ;;
        "patrol")
            test_patrol
            ;;
        "deps")
            test_dependencies
            ;;
        "check")
            check_flutter
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
