import 'package:canteen_management/authentication/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Grouping tests for the RegisterScreen widget
  group('RegisterScreen widget tests', () {
    // Testing if all form fields are rendered on the screen
    testWidgets('Renders all form fields', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: RegisterScreen()));

      expect(find.text('Name'), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.text('Confirm Password'), findsOneWidget);
      expect(find.text('Phone'), findsOneWidget);
      expect(find.text('Register'), findsOneWidget);
    });

    // Testing if an error dialog is displayed when the Register button is tapped without selecting an image
    testWidgets(
        'Tapping Register button shows error dialog if image is not selected',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: RegisterScreen()));

      final registerButton = find.widgetWithText(ElevatedButton, 'Register');
      expect(registerButton, findsOneWidget);

      await tester.tap(registerButton);
      await tester.pumpAndSettle();

      expect(find.text('Please select an image'), findsOneWidget);
    });

    // Testing if an error dialog is displayed when the Register button is tapped with passwords that don't match
    testWidgets(
        'Tapping Register button shows error dialog if passwords do not match',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: RegisterScreen()));

      final registerButton = find.widgetWithText(ElevatedButton, 'Register');
      expect(registerButton, findsOneWidget);

      await tester.enterText(find.byType(TextFormField).at(0), 'Test User');
      await tester.enterText(
          find.byType(TextFormField).at(1), 'test@example.com');
      await tester.enterText(find.byType(TextFormField).at(2), 'password');
      await tester.enterText(
          find.byType(TextFormField).at(3), 'different-password');
      await tester.enterText(find.byType(TextFormField).at(4), '1234567890');
      await tester.tap(find.widgetWithText(ElevatedButton, 'Register'));
      await tester.pumpAndSettle();

      expect(find.text('Passwords do not match'), findsOneWidget);
    });

    // Testing if an error dialog is displayed when the Register button is tapped without filling in all form fields
    testWidgets(
        'Tapping Register button shows error dialog if all form fields are not filled',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: RegisterScreen()));

      final registerButton = find.widgetWithText(ElevatedButton, 'Register');
      expect(registerButton, findsOneWidget);

      await tester.enterText(find.byType(TextFormField).at(0), 'Test User');
      await tester.enterText(find.byType(TextFormField).at(2), 'password');
      await tester.enterText(find.byType(TextFormField).at(3), 'password');
      await tester.enterText(find.byType(TextFormField).at(4), '1234567890');
      await tester.tap(find.widgetWithText(ElevatedButton, 'Register'));
      await tester.pumpAndSettle();

      expect(find.text('Please fill in all fields'), findsOneWidget);
    });

    // Testing if a successful registration message is displayed when the Register button is tapped with all form fields filled in
    testWidgets(
        'Tapping Register button successfully registers user if all form fields are filled',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: RegisterScreen()));

      final registerButton = find.widgetWithText(ElevatedButton, 'Register');
      expect(registerButton, findsOneWidget);

      await tester.enterText(find.byType(TextFormField).at(0), 'Test User');
      await tester.enterText(
          find.byType(TextFormField).at(1), 'test@example.com');
      await tester.enterText(find.byType(TextFormField).at(2), 'password');
      await tester.enterText(find.byType(TextFormField).at(3), 'password');
      await tester.enterText(find.byType(TextFormField).at(4), '1234567890');
      await tester.tap(find.widgetWithText(ElevatedButton, 'Register'));
      await tester.pumpAndSettle();

      expect(find.text('Registration successful!'), findsOneWidget);
    });
  });
}
