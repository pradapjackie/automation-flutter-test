import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:simple_flutter_app/main.dart' as app;

void main() {
  group('Simple Flutter App Integration Tests', () {
    testWidgets('App loads and displays all main components', (
      WidgetTester tester,
    ) async {
      // Start the app
      await tester.pumpWidget(const app.MyApp());
      await tester.pumpAndSettle();

      // Test 1: Verify app title is displayed
      expect(find.text('Simple Flutter App'), findsOneWidget);

      // Test 2: Verify welcome card is displayed
      expect(find.text('Welcome! 👋'), findsOneWidget);
      expect(
        find.text(
          'This is a simple Flutter app that works on both mobile and web platforms.',
        ),
        findsOneWidget,
      );

      // Test 3: Verify feature grid is displayed with correct items
      // Use find.byKey to find specific feature items
      expect(find.byKey(const Key('MobileFeature')), findsOneWidget);
      expect(find.byKey(const Key('WebFeature')), findsOneWidget);
      expect(find.byKey(const Key('DesktopFeature')), findsOneWidget);
      expect(find.byKey(const Key('TabletFeature')), findsOneWidget);

      // Test 4: Verify counter card is displayed and functional
      expect(find.text('Interactive Counter'), findsOneWidget);

      // Check initial counter value
      expect(find.text('0'), findsOneWidget);

      // Test increment button
      await tester.tap(find.byKey(const Key('IncrementButton')));
      await tester.pumpAndSettle();
      expect(find.text('1'), findsOneWidget);

      // Test decrement button
      await tester.tap(find.byKey(const Key('DecrementButton')));
      await tester.pumpAndSettle();
      expect(find.text('0'), findsOneWidget);

      // Test multiple increments
      await tester.tap(find.byKey(const Key('IncrementButton')));
      await tester.tap(find.byKey(const Key('IncrementButton')));
      await tester.tap(find.byKey(const Key('IncrementButton')));
      await tester.pumpAndSettle();
      expect(find.text('3'), findsOneWidget);

      // Test 5: Verify platform info card is displayed
      expect(find.text('Platform Information'), findsOneWidget);

      // Check platform info rows exist
      expect(find.text('Platform'), findsOneWidget);
      expect(find.text('Screen Size'), findsOneWidget);
      expect(find.text('Pixel Density'), findsOneWidget);
      expect(find.text('Orientation'), findsOneWidget);

      // Test 6: Verify bottom navigation bar is displayed
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Explore'), findsOneWidget);
      expect(find.text('Favorites'), findsOneWidget);
      expect(find.text('Profile'), findsOneWidget);

      // Test 7: Test navigation between tabs
      await tester.tap(find.text('Explore'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Favorites'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Profile'));
      await tester.pumpAndSettle();

      // Return to home
      await tester.tap(find.text('Home'));
      await tester.pumpAndSettle();

      // Test 8: Test menu button functionality
      expect(find.byKey(const Key('MenuButton')), findsOneWidget);
      await tester.tap(find.byKey(const Key('MenuButton')));
      await tester.pumpAndSettle();

      // Test 9: Test counter edge cases
      // Test multiple rapid taps
      for (int i = 0; i < 5; i++) {
        await tester.tap(find.byKey(const Key('IncrementButton')));
        await tester.pump();
      }
      await tester.pumpAndSettle();
      expect(find.text('8'), findsOneWidget);

      // Reset counter
      for (int i = 0; i < 8; i++) {
        await tester.tap(find.byKey(const Key('DecrementButton')));
        await tester.pump();
      }
      await tester.pumpAndSettle();
      expect(find.text('0'), findsOneWidget);

      // Test 10: Test app stability
      // Perform multiple operations to ensure app remains stable
      await tester.tap(find.byKey(const Key('IncrementButton')));
      await tester.tap(find.text('Explore'));
      await tester.tap(find.text('Home'));
      await tester.tap(find.byKey(const Key('IncrementButton')));
      await tester.tap(find.text('Favorites'));
      await tester.tap(find.text('Home'));
      await tester.pumpAndSettle();

      // Verify counter still shows correct value
      expect(find.text('2'), findsOneWidget);

      print('✅ All integration tests passed successfully!');
    });

    testWidgets('App responds to different screen sizes', (
      WidgetTester tester,
    ) async {
      // Test with a small screen (mobile)
      await tester.binding.setSurfaceSize(
        const Size(375, 812),
      ); // iPhone X size
      await tester.pumpWidget(const app.MyApp());
      await tester.pumpAndSettle();

      // Verify all components are still visible
      expect(find.text('Simple Flutter App'), findsOneWidget);
      expect(find.text('Welcome! 👋'), findsOneWidget);
      expect(find.text('Interactive Counter'), findsOneWidget);

      // Test with a large screen (web/desktop)
      await tester.binding.setSurfaceSize(
        const Size(1200, 800),
      ); // Desktop size
      await tester.pumpWidget(const app.MyApp());
      await tester.pumpAndSettle();

      // Verify all components are still visible
      expect(find.text('Simple Flutter App'), findsOneWidget);
      expect(find.text('Welcome! 👋'), findsOneWidget);
      expect(find.text('Interactive Counter'), findsOneWidget);

      // Reset surface size
      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Counter functionality works correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const app.MyApp());
      await tester.pumpAndSettle();

      // Test increment
      await tester.tap(find.byKey(const Key('IncrementButton')));
      await tester.pumpAndSettle();
      expect(find.text('1'), findsOneWidget);

      // Test decrement
      await tester.tap(find.byKey(const Key('DecrementButton')));
      await tester.pumpAndSettle();
      expect(find.text('0'), findsOneWidget);

      // Test multiple operations
      await tester.tap(find.byKey(const Key('IncrementButton')));
      await tester.tap(find.byKey(const Key('IncrementButton')));
      await tester.tap(find.byKey(const Key('IncrementButton')));
      await tester.tap(find.byKey(const Key('DecrementButton')));
      await tester.pumpAndSettle();
      expect(find.text('2'), findsOneWidget);
    });

    testWidgets('Navigation works correctly', (WidgetTester tester) async {
      await tester.pumpWidget(const app.MyApp());
      await tester.pumpAndSettle();

      // Test navigation to different tabs
      await tester.tap(find.text('Explore'));
      await tester.pumpAndSettle();
      expect(find.text('Explore'), findsOneWidget);

      await tester.tap(find.text('Favorites'));
      await tester.pumpAndSettle();
      expect(find.text('Favorites'), findsOneWidget);

      await tester.tap(find.text('Profile'));
      await tester.pumpAndSettle();
      expect(find.text('Profile'), findsOneWidget);

      await tester.tap(find.text('Home'));
      await tester.pumpAndSettle();
      expect(find.text('Home'), findsOneWidget);
    });

    testWidgets('All UI components are properly styled', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const app.MyApp());
      await tester.pumpAndSettle();

      // Verify cards exist with proper keys
      expect(find.byKey(const Key('WelcomeCard')), findsOneWidget);
      expect(find.byKey(const Key('CounterCard')), findsOneWidget);
      expect(find.byKey(const Key('PlatformInfoCard')), findsOneWidget);

      // Verify feature grid exists
      expect(find.byKey(const Key('FeatureGrid')), findsOneWidget);

      // Verify bottom navigation exists
      expect(find.byKey(const Key('BottomNavigationBar')), findsOneWidget);
    });
  });
}
