# GitHub Actions Setup for Flutter Tests

This document explains how to use the GitHub Actions workflow to run Patrol and integration tests for both web and Android platforms.

## Overview

The workflow file `.github/workflows/test.yml` is configured to run comprehensive tests on your Flutter application:

- **Unit Tests**: Basic Flutter unit tests
- **Integration Tests**: Flutter integration tests on web and Android
- **Patrol Tests**: Patrol-specific tests on web and Android

## Workflow Triggers

The workflow runs automatically on:
- Push to `main` or `develop` branches
- Pull requests to `main` or `develop` branches
- Manual trigger via GitHub Actions UI (`workflow_dispatch`)

## Test Jobs

### 1. Unit Tests (`unit-tests`)
- **Platform**: Ubuntu Latest
- **Purpose**: Run basic Flutter unit tests
- **Command**: `flutter test`

### 2. Integration Tests - Web (`integration-tests-web`)
- **Platform**: Ubuntu Latest
- **Purpose**: Run integration tests on Chrome browser
- **Command**: `flutter test integration_test/ -d chrome`
- **Requirements**: Web support enabled

### 3. Integration Tests - Android (`integration-tests-android`)
- **Platform**: Ubuntu Latest
- **Purpose**: Run integration tests on Android emulator
- **Command**: `flutter test integration_test/ -d emulator-5554`
- **Requirements**: 
  - Java 17
  - Android SDK
  - Android Virtual Device (API 30)

### 4. Patrol Tests - Web (`patrol-tests-web`)
- **Platform**: Ubuntu Latest
- **Purpose**: Run Patrol-specific tests on Chrome browser
- **Command**: `flutter test integration_test/patrol_test.dart -d chrome`
- **Requirements**: Web support enabled

### 5. Patrol Tests - Android (`patrol-tests-android`)
- **Platform**: Ubuntu Latest
- **Purpose**: Run Patrol-specific tests on Android emulator
- **Command**: `flutter test integration_test/patrol_test.dart -d emulator-5554`
- **Requirements**: 
  - Java 17
  - Android SDK
  - Android Virtual Device (API 30)

### 6. Test Summary (`test-summary`)
- **Platform**: Ubuntu Latest
- **Purpose**: Generate a summary of all test results
- **Output**: GitHub Step Summary with test status table

## Prerequisites

### Flutter Version
- Uses Flutter 3.19.0 (stable channel)
- Configured via environment variable `FLUTTER_VERSION`

### Dependencies
- Flutter SDK
- Dart SDK
- Java 17 (for Android tests)
- Android SDK (for Android tests)
- Chrome browser (for web tests)

## Android Emulator Setup

The workflow automatically:
1. Sets up Android SDK
2. Creates a virtual device with API 30
3. Starts the emulator with optimized settings:
   - No audio
   - No camera
   - SwiftShader GPU
   - 2GB RAM
   - 1080x1920 resolution

## Test Files

### Integration Tests
- **Location**: `integration_test/`
- **Main File**: `patrol_test.dart`
- **Purpose**: Test app functionality across platforms

### Patrol Tests
- **Location**: `integration_test/patrol_test.dart`
- **Purpose**: Platform-specific testing using Patrol framework

## Running Tests Locally

You can run the same tests locally using the provided script:

```bash
# Run all tests
./run_tests.sh all

# Run specific test types
./run_tests.sh unit
./run_tests.sh integration
./run_tests.sh patrol

# Run on specific device
./run_tests.sh integration 'chrome'
./run_tests.sh integration 'emulator-5554'
```

## Troubleshooting

### Common Issues

1. **Android Emulator Timeout**
   - The workflow has a 10-minute timeout for Android tests
   - Ensure your tests complete within this timeframe

2. **Web Tests Failing**
   - Verify web support is enabled: `flutter config --enable-web`
   - Check Chrome browser compatibility

3. **Android Tests Failing**
   - Verify Java 17 is available
   - Check Android SDK installation
   - Ensure emulator starts successfully

### Debugging

1. Check GitHub Actions logs for specific error messages
2. Verify test files are in the correct locations
3. Test locally before pushing to GitHub
4. Check Flutter and Dart version compatibility

## Customization

### Adding New Test Types
1. Create a new job in the workflow file
2. Follow the existing pattern for setup and execution
3. Add the job to the `test-summary` needs list

### Modifying Test Commands
1. Update the `run` commands in respective job steps
2. Ensure proper device targeting (`-d` flag)
3. Add any required environment variables

### Changing Flutter Version
1. Update the `FLUTTER_VERSION` environment variable
2. Verify compatibility with your test dependencies

## Performance Optimization

- Tests run in parallel across different jobs
- Android emulator uses optimized settings for CI
- Web tests use headless Chrome for faster execution
- Dependency caching reduces setup time

## Security Considerations

- No sensitive data is exposed in test outputs
- Android emulator runs in isolated environment
- Web tests use clean browser instances
- All dependencies are from trusted sources

## Support

For issues with the workflow:
1. Check GitHub Actions documentation
2. Review Flutter testing best practices
3. Consult Patrol framework documentation
4. Review workflow logs for specific error details
