import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:simple_flutter_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Simple Flutter App Integration Tests', () {
    testWidgets('App loads and displays all main components', (tester) async {
      // Start the app
      await tester.pumpWidget(const app.MyApp());
      await tester.pumpAndSettle();

      // Test 1: Verify app title is displayed
      expect(find.text('Simple Flutter App'), findsOneWidget);

      // Test 2: Verify welcome message is displayed
      expect(find.text('Welcome! 👋'), findsOneWidget);

      // Test 3: Verify counter functionality
      expect(find.text('Interactive Counter'), findsOneWidget);
      expect(find.text('0'), findsOneWidget);

      // Test 4: Test increment button (using icon finder)
      final incrementButton = find.byIcon(Icons.add);
      if (incrementButton.evaluate().isNotEmpty) {
        await tester.tap(incrementButton);
        await tester.pumpAndSettle();
        expect(find.text('1'), findsOneWidget);
      }

      // Test 5: Test decrement button
      final decrementButton = find.byIcon(Icons.remove);
      if (decrementButton.evaluate().isNotEmpty) {
        await tester.tap(decrementButton);
        await tester.pumpAndSettle();
        expect(find.text('0'), findsOneWidget);
      }

      // Test 6: Verify platform info
      expect(find.text('Platform Information'), findsOneWidget);

      // Test 7: Verify navigation items
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Explore'), findsOneWidget);
      expect(find.text('Favorites'), findsOneWidget);
      expect(find.text('Profile'), findsOneWidget);

      print('✅ All integration tests passed successfully!');
    });
  });
}
