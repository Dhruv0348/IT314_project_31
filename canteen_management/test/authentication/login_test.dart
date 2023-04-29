import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:canteen_management/authentication/login.dart';

void main() {

  testWidgets('Widget testing of Email form-field of the Login page', (WidgetTester tester) async {

    await tester.pumpWidget(const MaterialApp(home: LoginScreen(),));

    // Enter Email
    final emailTextField = find.byKey(const Key('emailFormField'));
    await tester.enterText(emailTextField, 'test@test.com');
    expect(emailTextField, findsOneWidget);
    expect(find.text("test@test.com"), findsOneWidget);

  });

  testWidgets('Widget testing of Password form-field of the Login page', (WidgetTester tester) async {

    await tester.pumpWidget(const MaterialApp(home: LoginScreen(),));

    // Enter Password
    final passwordTextField = find.byKey(const Key('passwordFormField'));
    await tester.enterText(passwordTextField, 'test123');
    expect(passwordTextField, findsOneWidget);
    expect(find.text("test123"), findsOneWidget);

  });

  testWidgets('Widget testing of forgot password option of the Login page', (WidgetTester tester) async {

    await tester.pumpWidget(const MaterialApp(home: LoginScreen(),));

    // Forgot password
    var forgotbutton = find.byType(Text).first;
    expect(forgotbutton, findsOneWidget);
    await tester.tap(forgotbutton);

  });

  testWidgets('Widget testing of SIGN IN button of the Login page', (WidgetTester tester) async {

    await tester.pumpWidget(const MaterialApp(home: LoginScreen(),));

    // Tap the login button
    var loginButton = find.widgetWithText(ElevatedButton, 'SIGN IN');
    expect(loginButton, findsOneWidget);
    await tester.tap(loginButton);
    await tester.pumpAndSettle();

  });

  testWidgets('Widget testing of create account option of the Login page', (WidgetTester tester) async {

    await tester.pumpWidget(const MaterialApp(home: LoginScreen(),));

    // Create new account
    var createbutton = find.byType(Text).last;
    expect(createbutton, findsOneWidget);
    await tester.tap(createbutton);

  });

}