import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import '../config/build_config.dart';

class AutomationService {
  static const MethodChannel _channel = MethodChannel('automation_service');

  // Automation identifiers for Appium/WebdriverIO
  static const String _automationIdPrefix = 'automation_';

  // Test mode flags
  static bool _isTestMode = false;
  static bool _isAutomationEnabled = false;

  // Initialize automation service
  static Future<void> initialize() async {
    if (BuildConfig.isAutomationMode) {
      _isAutomationEnabled = true;
      _isTestMode = true;

      // Set up method channel for automation
      _channel.setMethodCallHandler(_handleMethodCall);

      if (kDebugMode) {
        print(
          '🚀 Automation Service initialized in ${BuildConfig.currentMode} mode',
        );
      }
    }
  }

  // Handle automation method calls
  static Future<dynamic> _handleMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'getElementId':
        return _generateElementId(call.arguments as String);
      case 'setTestMode':
        _isTestMode = call.arguments as bool;
        return true;
      case 'getTestMode':
        return _isTestMode;
      case 'getAutomationInfo':
        return {
          'mode': BuildConfig.currentMode.toString(),
          'isTestMode': _isTestMode,
          'isAutomationEnabled': _isAutomationEnabled,
          'timestamp': DateTime.now().toIso8601String(),
        };
      default:
        throw PlatformException(
          code: 'UNSUPPORTED_METHOD',
          message: 'Method ${call.method} not supported',
        );
    }
  }

  // Generate unique automation ID for elements
  static String _generateElementId(String baseId) {
    return '${_automationIdPrefix}${baseId}_${DateTime.now().millisecondsSinceEpoch}';
  }

  // Get automation ID for element
  static String getAutomationId(String elementName) {
    if (!_isAutomationEnabled) return elementName;
    return '${_automationIdPrefix}${elementName}';
  }

  // Check if automation is enabled
  static bool get isAutomationEnabled => _isAutomationEnabled;

  // Check if in test mode
  static bool get isTestMode => _isTestMode;

  // Enable test mode (for automation testing)
  static void enableTestMode() {
    if (_isAutomationEnabled) {
      _isTestMode = true;
      if (kDebugMode) {
        print('🧪 Test mode enabled');
      }
    }
  }

  // Disable test mode
  static void disableTestMode() {
    if (_isAutomationEnabled) {
      _isTestMode = false;
      if (kDebugMode) {
        print('🧪 Test mode disabled');
      }
    }
  }

  // Log automation event
  static void logEvent(String event, {Map<String, dynamic>? data}) {
    if (BuildConfig.enableAutomationLogging) {
      final logData = {
        'event': event,
        'timestamp': DateTime.now().toIso8601String(),
        'mode': BuildConfig.currentMode.toString(),
        'data': data,
      };

      if (kDebugMode) {
        print('📊 Automation Event: $logData');
      }

      // Send to method channel for external logging
      _channel.invokeMethod('logEvent', logData);
    }
  }

  // Get automation configuration
  static Map<String, dynamic> getAutomationConfig() {
    return {
      'mode': BuildConfig.currentMode.toString(),
      'isTestMode': _isTestMode,
      'isAutomationEnabled': _isAutomationEnabled,
      'enableLogging': BuildConfig.enableAutomationLogging,
      'enableTestMode': BuildConfig.enableTestMode,
      'enableDebugFeatures': BuildConfig.enableDebugFeatures,
    };
  }
}
