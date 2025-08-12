#!/bin/bash

# Simple Flutter App Test Runner Script
# This script provides easy commands to run different types of tests

echo "🧪 Simple Flutter App Test Runner"
echo "=================================="

# Function to check if Flutter is available
check_flutter() {
    if ! command -v flutter &> /dev/null; then
        echo "❌ Flutter is not installed or not in PATH"
        echo "Please install Flutter from: https://flutter.dev/docs/get-started/install"
        exit 1
    fi
}

# Function to run unit tests
run_unit_tests() {
    echo "🔬 Running unit tests..."
    flutter test
}

# Function to run integration tests
run_integration_tests() {
    local device=$1
    if [ -z "$device" ]; then
        echo "📱 Running integration tests on default device..."
        flutter test integration_test/
    else
        echo "📱 Running integration tests on device: $device"
        flutter test integration_test/ -d "$device"
    fi
}

# Function to run Patrol tests
run_patrol_tests() {
    local device=$1
    if [ -z "$device" ]; then
        echo "🚀 Running Patrol tests on default device..."
        flutter test patrol_test.dart
    else
        echo "🚀 Running Patrol tests on device: $device"
        flutter test patrol_test.dart -d "$device"
    fi
}

# Function to run all tests
run_all_tests() {
    local device=$1
    echo "🧪 Running all tests..."
    
    echo "1. Running unit tests..."
    flutter test
    
    echo "2. Running integration tests..."
    if [ -z "$device" ]; then
        flutter test integration_test/
    else
        flutter test integration_test/ -d "$device"
    fi
    
    echo "3. Running Patrol tests..."
    if [ -z "$device" ]; then
        flutter test patrol_test.dart
    else
        flutter test patrol_test.dart -d "$device"
    fi
    
    echo "✅ All tests completed!"
}

# Function to list available devices
list_devices() {
    echo "📱 Available devices:"
    flutter devices
}

# Function to run tests with coverage
run_tests_with_coverage() {
    echo "📊 Running tests with coverage..."
    flutter test --coverage
    echo "Coverage report generated in coverage/lcov.info"
    echo "To view HTML coverage report, run: genhtml coverage/lcov.info -o coverage/html"
}

# Function to clean test cache
clean_test_cache() {
    echo "🧹 Cleaning test cache..."
    flutter clean
    flutter pub get
    echo "✅ Test cache cleaned!"
}

# Function to show help
show_help() {
    echo "Usage: $0 [COMMAND] [DEVICE]"
    echo ""
    echo "Commands:"
    echo "  unit                    Run unit tests only"
    echo "  integration [DEVICE]    Run integration tests (optionally specify device)"
    echo "  patrol [DEVICE]         Run Patrol tests (optionally specify device)"
    echo "  all [DEVICE]            Run all tests (optionally specify device)"
    echo "  coverage                Run tests with coverage report"
    echo "  devices                 List available devices"
    echo "  clean                   Clean test cache"
    echo "  help                    Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 unit                           # Run unit tests"
    echo "  $0 integration                    # Run integration tests on default device"
    echo "  $0 integration 'iPhone 16 Pro'    # Run integration tests on specific device"
    echo "  $0 patrol 'SM S928B'             # Run Patrol tests on Android device"
    echo "  $0 all 'iPhone 16 Pro'           # Run all tests on specific device"
    echo "  $0 coverage                       # Run tests with coverage"
    echo ""
    echo "Device Examples:"
    echo "  'iPhone 16 Pro'                   # iOS Simulator"
    echo "  'SM S928B'                        # Android Device"
    echo "  'macos'                           # macOS Desktop"
    echo "  'chrome'                          # Web Browser"
    echo ""
}

# Main script logic
main() {
    check_flutter
    
    case $1 in
        "unit")
            run_unit_tests
            ;;
        "integration")
            run_integration_tests "$2"
            ;;
        "patrol")
            run_patrol_tests "$2"
            ;;
        "all")
            run_all_tests "$2"
            ;;
        "coverage")
            run_tests_with_coverage
            ;;
        "devices")
            list_devices
            ;;
        "clean")
            clean_test_cache
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
