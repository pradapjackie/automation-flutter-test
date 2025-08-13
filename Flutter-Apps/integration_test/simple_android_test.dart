import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:simple_flutter_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Simple Flutter App Android Integration Tests', () {
    testWidgets('App loads and displays main components', (tester) async {
      // Start the app
      await tester.pumpWidget(const app.MyApp());
      await tester.pumpAndSettle();

      // Test 1: Verify app title is displayed
      expect(find.text('Simple Flutter App'), findsOneWidget);

      // Test 2: Verify welcome message is displayed
      expect(find.text('Welcome! 👋'), findsOneWidget);

      // Test 3: Verify counter is displayed
      expect(find.text('Interactive Counter'), findsOneWidget);

      // Test 4: Verify initial counter value
      expect(find.text('0'), findsOneWidget);

      // Test 5: Test increment button
      final incrementButton = find.byIcon(Icons.add);
      expect(incrementButton, findsOneWidget);

      await tester.tap(incrementButton);
      await tester.pumpAndSettle();
      expect(find.text('1'), findsOneWidget);

      // Test 6: Test decrement button
      final decrementButton = find.byIcon(Icons.remove);
      expect(decrementButton, findsOneWidget);

      await tester.tap(decrementButton);
      await tester.pumpAndSettle();
      expect(find.text('0'), findsOneWidget);

      print('✅ Simple Android integration test passed successfully!');
    });
  });
}
