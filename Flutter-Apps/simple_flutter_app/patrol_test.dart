import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import 'package:simple_flutter_app/main.dart' as app;

void main() {
  patrolTest('Simple Flutter App Patrol Tests', ($) async {
    // Start the app
    await $.pumpWidget(const app.MyApp());
    await $.pumpAndSettle();

    // Test 1: Verify app title is displayed
    await $(#AppTitle).waitUntilVisible();
    expect($(#AppTitle).text, 'Simple Flutter App');

    // Test 2: Verify welcome card is displayed
    await $(#WelcomeCard).waitUntilVisible();
    expect($(#WelcomeCardTitle).text, 'Welcome! 👋');
    expect(
      $(#WelcomeCardSubtitle).text,
      'This is a simple Flutter app that works on both mobile and web platforms.',
    );

    // Test 3: Verify feature grid is displayed with correct items
    await $(#FeatureGrid).waitUntilVisible();

    // Check Mobile feature
    await $(#MobileFeature).waitUntilVisible();
    expect($(#MobileFeatureTitle).text, 'Mobile');

    // Check Web feature
    await $(#WebFeature).waitUntilVisible();
    expect($(#WebFeatureTitle).text, 'Web');

    // Check Desktop feature
    await $(#DesktopFeature).waitUntilVisible();
    expect($(#DesktopFeatureTitle).text, 'Desktop');

    // Check Tablet feature
    await $(#TabletFeature).waitUntilVisible();
    expect($(#TabletFeatureTitle).text, 'Tablet');

    // Test 4: Verify counter card is displayed and functional
    await $(#CounterCard).waitUntilVisible();
    expect($(#CounterTitle).text, 'Interactive Counter');

    // Check initial counter value
    expect($(#CounterValue).text, '0');

    // Test increment button
    await $(#IncrementButton).tap();
    await $.pumpAndSettle();
    expect($(#CounterValue).text, '1');

    // Test decrement button
    await $(#DecrementButton).tap();
    await $.pumpAndSettle();
    expect($(#CounterValue).text, '0');

    // Test multiple increments
    await $(#IncrementButton).tap();
    await $(#IncrementButton).tap();
    await $(#IncrementButton).tap();
    await $.pumpAndSettle();
    expect($(#CounterValue).text, '3');

    // Test 5: Verify platform info card is displayed
    await $(#PlatformInfoCard).waitUntilVisible();
    expect($(#PlatformInfoTitle).text, 'Platform Information');

    // Check platform info rows exist
    await $(#PlatformRow).waitUntilVisible();
    await $(#ScreenSizeRow).waitUntilVisible();
    await $(#PixelDensityRow).waitUntilVisible();
    await $(#OrientationRow).waitUntilVisible();

    // Test 6: Verify bottom navigation bar is displayed
    await $(#BottomNavigationBar).waitUntilVisible();

    // Check navigation items
    await $(#HomeNavItem).waitUntilVisible();
    expect($(#HomeNavItem).text, 'Home');

    await $(#ExploreNavItem).waitUntilVisible();
    expect($(#ExploreNavItem).text, 'Explore');

    await $(#FavoritesNavItem).waitUntilVisible();
    expect($(#FavoritesNavItem).text, 'Favorites');

    await $(#ProfileNavItem).waitUntilVisible();
    expect($(#ProfileNavItem).text, 'Profile');

    // Test 7: Test navigation between tabs
    await $(#ExploreNavItem).tap();
    await $.pumpAndSettle();

    await $(#FavoritesNavItem).tap();
    await $.pumpAndSettle();

    await $(#ProfileNavItem).tap();
    await $.pumpAndSettle();

    // Return to home
    await $(#HomeNavItem).tap();
    await $.pumpAndSettle();

    // Test 8: Test menu button functionality
    await $(#MenuButton).waitUntilVisible();
    await $(#MenuButton).tap();
    await $.pumpAndSettle();

    // Test 9: Test counter edge cases
    // Test multiple rapid taps
    for (int i = 0; i < 5; i++) {
      await $(#IncrementButton).tap();
      await $.pump();
    }
    await $.pumpAndSettle();
    expect($(#CounterValue).text, '8');

    // Reset counter
    for (int i = 0; i < 8; i++) {
      await $(#DecrementButton).tap();
      await $.pump();
    }
    await $.pumpAndSettle();
    expect($(#CounterValue).text, '0');

    // Test 10: Test app stability
    // Perform multiple operations to ensure app remains stable
    await $(#IncrementButton).tap();
    await $(#ExploreNavItem).tap();
    await $(#HomeNavItem).tap();
    await $(#IncrementButton).tap();
    await $(#FavoritesNavItem).tap();
    await $(#HomeNavItem).tap();
    await $.pumpAndSettle();

    // Verify counter still shows correct value
    expect($(#CounterValue).text, '2');

    print('✅ All Patrol tests passed successfully!');
  });
}
