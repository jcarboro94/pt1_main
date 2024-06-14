// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pt1/app.dart';

void main() {
  group('Counter related smoke test', () {
    setUpAll(() => WidgetsFlutterBinding.ensureInitialized());

    testWidgets('Counter increments smoke test', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(MyApp());

      // Verify that our counter starts at 0.
      expect(find.text('3'), findsOneWidget);
      expect(find.text('0'), findsNothing);

      // Tap the '+' icon and trigger a frame.
      await tester.tap(find.text('Add 1 to counter'));
      await tester.pumpAndSettle();

      // Verify that our counter has incremented.
      expect(find.text('3'), findsNothing);
      expect(find.text('4'), findsOneWidget);
    });

    testWidgets('Counter set counter smoke test', (WidgetTester tester) async {
      // Build the app and trigger a frame
      await tester.pumpWidget(MyApp());

      // Verify the TextField with the key 'initial_counter_controller' is present
      expect(find.byKey(const Key('initial_counter_controller')), findsOneWidget);

      // Enter '0' into the TextField and rebuild the widget tree
      await tester.enterText(find.byKey(const Key('initial_counter_controller')), '0');
      await tester.pumpAndSettle();

      // Tap the 'Set counter' button and rebuild the widget tree
      await tester.tap(find.text('Set counter'));
      await tester.pumpAndSettle();

      // Verify the Text widget displaying '0' is present
      expect(find.text('0'), findsOneWidget);

      // Verify the Text widget displaying '3' is not present
      expect(find.text('3'), findsNothing);
    });
  });
}
