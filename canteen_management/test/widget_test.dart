// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:canteen_management/authentication/login.dart';
import 'package:canteen_management/widgets/seller_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

//import 'package:canteen_management/main.dart';

void main() {

  testWidgets('Test user page after login', (WidgetTester tester) async {

    SellerInfo Seller 

    // Build the app and navigate to the login screen
    await tester.pumpWidget(const MaterialApp(
      home: SellerInfo(),
    ));

    /*await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    // Enter the login credentials and tap the login button
    await tester.enterText(find.byType(TextFormField).first, 'test@test.com');
    await tester.enterText(find.byType(TextFormField).last, 'test123');
    var loginButton = find.widgetWithText(ElevatedButton, 'SIGN IN');
    await tester.tap(loginButton);
    await tester.pumpAndSettle();*/

    // Verify that the user page is displayed
    /*var canteenInfo = find.text("Earnings");
    expect(canteenInfo, findsWidgets);*/

    var canteenInfo = find.byKey(const Key("canteenInfo"));
    expect(canteenInfo, findsOneWidget);

    /*var earning = find.byType(Text).first;
    expect(earning, findsOneWidget);*/
  });


  /*testWidgets('Login Page GUI testing', (WidgetTester tester) async {

    await tester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));

    final emailTextField = find.byKey(const Key('emailFormField'));
    final passwordTextField = find.byKey(const Key('passwordFormField'));
    await tester.enterText(emailTextField, 'test@test.com');
    await tester.enterText(passwordTextField, 'test123');
    expect(emailTextField, findsOneWidget);
    expect(find.text("test@test.com"), findsOneWidget);
    expect(passwordTextField, findsOneWidget);
    expect(find.text("test123"), findsOneWidget);

    // Forgot password
    var forgotbutton = find.byType(Text).first;
    expect(forgotbutton, findsOneWidget);
    await tester.tap(forgotbutton);

    // Tap the login button
    var loginButton = find.widgetWithText(ElevatedButton, 'SIGN IN');
    expect(loginButton, findsOneWidget);
    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    // Registration Screen
    var createbutton = find.byType(Text).last;
    expect(createbutton, findsOneWidget);
    await tester.tap(createbutton);

    //added line 190 & 197 in login.dart to get the test cases passed.

  });*/

}