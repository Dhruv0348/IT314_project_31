import 'package:canteen_management/authentication/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test/flutter_test.dart';
void main() {
  testWidgets('Login with valid email and password',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: LoginScreen(),
    ));

    // Enter email and password into text fields
    final emailTextField = find.widgetWithText(TextFormField, 'Email');
    final passwordTextField = find.widgetWithText(TextFormField, 'Password');
    await tester.enterText(emailTextField, 'test@test.com');
    await tester.enterText(passwordTextField, 'test123');

    // Tap the login button
    final loginButton = find.widgetWithText(ElevatedButton, 'Login');
    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    // Verify that the HomeScreen is displayed
    // expect(find.byType(HomeScreen), findsOneWidget);
  });

  testWidgets('Login with invalid email and password',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: LoginScreen(),
    ));

    // Enter invalid email and password into text fields
    final emailTextField = find.widgetWithText(TextFormField, 'Email');
    final passwordTextField = find.widgetWithText(TextFormField, 'Password');
    await tester.enterText(emailTextField, 'invalid@test.com');
    await tester.enterText(passwordTextField, 'invalid123');

    // Tap the login button
    final loginButton = find.widgetWithText(ElevatedButton, 'Login');
    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    // Verify that an error dialog is displayed
    expect(find.text('Please enter valid email/password.'), findsOneWidget);
  });
}
