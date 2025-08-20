import 'package:flutter/foundation.dart';

enum BuildMode {
  debug,
  release,
  automation, // For Appium/WebdriverIO testing
  staging,
  production,
}

class BuildConfig {
  static BuildMode get currentMode {
    const buildMode = String.fromEnvironment(
      'BUILD_MODE',
      defaultValue: 'debug',
    );

    switch (buildMode.toLowerCase()) {
      case 'automation':
        return BuildMode.automation;
      case 'staging':
        return BuildMode.staging;
      case 'production':
        return BuildMode.production;
      case 'release':
        return BuildMode.release;
      default:
        return BuildMode.debug;
    }
  }

  static bool get isAutomationMode => currentMode == BuildMode.automation;
  static bool get isStagingMode => currentMode == BuildMode.staging;
  static bool get isProductionMode => currentMode == BuildMode.production;
  static bool get isReleaseMode => currentMode == BuildMode.release;
  static bool get isDebugMode => currentMode == BuildMode.debug;

  // Automation-specific configurations
  static bool get enableAutomationLogging => isAutomationMode;
  static bool get enableTestMode => isAutomationMode;
  static bool get enableDebugFeatures => isAutomationMode || isDebugMode;

  // Build flags for different modes
  static List<String> get buildFlags {
    switch (currentMode) {
      case BuildMode.automation:
        return [
          '--dart-define=BUILD_MODE=automation',
          '--dart-define=ENABLE_AUTOMATION=true',
          '--dart-define=ENABLE_TEST_MODE=true',
          '--dart-define=ENABLE_LOGGING=true',
        ];
      case BuildMode.staging:
        return [
          '--dart-define=BUILD_MODE=staging',
          '--dart-define=ENABLE_LOGGING=true',
        ];
      case BuildMode.production:
        return [
          '--dart-define=BUILD_MODE=production',
          '--dart-define=ENABLE_LOGGING=false',
        ];
      default:
        return [];
    }
  }

  // Get build command for specific mode
  static String getBuildCommand(BuildMode mode, {String platform = 'ios'}) {
    final flags = _getFlagsForMode(mode);
    final flagString = flags.isNotEmpty ? ' ${flags.join(' ')}' : '';

    switch (platform.toLowerCase()) {
      case 'ios':
        return 'flutter build ios --release$flagString';
      case 'android':
        return 'flutter build apk --release$flagString';
      case 'web':
        return 'flutter build web --release$flagString';
      default:
        return 'flutter build $platform --release$flagString';
    }
  }

  static List<String> _getFlagsForMode(BuildMode mode) {
    switch (mode) {
      case BuildMode.automation:
        return [
          '--dart-define=BUILD_MODE=automation',
          '--dart-define=ENABLE_AUTOMATION=true',
          '--dart-define=ENABLE_TEST_MODE=true',
          '--dart-define=ENABLE_LOGGING=true',
        ];
      case BuildMode.staging:
        return [
          '--dart-define=BUILD_MODE=staging',
          '--dart-define=ENABLE_LOGGING=true',
        ];
      case BuildMode.production:
        return [
          '--dart-define=BUILD_MODE=production',
          '--dart-define=ENABLE_LOGGING=false',
        ];
      default:
        return [];
    }
  }
}
