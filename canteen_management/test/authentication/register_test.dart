import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:canteen_management/authentication/register.dart';

void main() {
  testWidgets('Widget testing of Name Text-field of the Register page', (WidgetTester tester) async {
    
    await tester.pumpWidget(const MaterialApp(home: RegisterScreen(),));

    //Enter Name
    final nameTextField = find.byKey(const Key('nameTextField'));
    await tester.enterText(nameTextField,'The Urban Bites');
    expect(nameTextField,findsOneWidget);
    expect(find.text("The Urban Bites"),findsOneWidget);

  });

  testWidgets('Widget testing of Email Text-field of the Register page', (WidgetTester tester) async {
    
    await tester.pumpWidget(const MaterialApp(home: RegisterScreen(),));

    //Enter Email
    final emailTextField = find.byKey(const Key('emailTextField'));
    await tester.enterText(emailTextField,'urbanbites@gmail.com');
    expect(emailTextField,findsOneWidget);
    expect(find.text("urbanbites@gmail.com"),findsOneWidget);

  });

  testWidgets('Widget testing of Password Text-field of the Register page', (WidgetTester tester) async {
    
    await tester.pumpWidget(const MaterialApp(home: RegisterScreen(),));

    //Enter Password
    final passwordTextField = find.byKey(const Key('passwordTextField'));
    await tester.enterText(passwordTextField,'12345678');
    expect(passwordTextField,findsOneWidget);
    expect(find.text("12345678"),findsOneWidget);

  });

  testWidgets('Widget testing of Confirm-password Text-field of the Register page', (WidgetTester tester) async {
    
    await tester.pumpWidget(const MaterialApp(home: RegisterScreen(),));

    //Confirm Password
    final confirmPasswordTextField = find.byKey(const Key('confirmPasswordTextField'));
    await tester.enterText(confirmPasswordTextField,'12345678');
    expect(confirmPasswordTextField,findsOneWidget);
    expect(find.text("12345678"),findsOneWidget);
    
  });

  testWidgets('Widget testing of Phone number Text-field of the Register page', (WidgetTester tester) async {
  
    await tester.pumpWidget(const MaterialApp(home: RegisterScreen(),));

    //Enter Phone number
    final phoneTextField = find.byKey(const Key('phoneTextField'));
    await tester.enterText(phoneTextField,'987654321');
    expect(phoneTextField,findsOneWidget);
    expect(find.text("987654321"),findsOneWidget);
  
});

  testWidgets('Widget testing of SIGN UP button of the Register page', (WidgetTester tester) async {
  
    await tester.pumpWidget(const MaterialApp(home: RegisterScreen(),));

    //Click on the button 'SIGN UP'
    final registerButton = find.widgetWithText(ElevatedButton, 'SIGN UP');
    expect(registerButton,findsOneWidget);
    await tester.tap(registerButton);
    await tester.pumpAndSettle();

});

}