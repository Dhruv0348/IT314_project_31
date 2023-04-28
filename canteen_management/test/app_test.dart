import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:canteen_management/authentication/login.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockFirebaseFirestore extends Mock implements FirebaseFirestore {}

void main() {
  late MockFirebaseAuth mockFirebaseAuth;
  late MockFirebaseFirestore mockFirebaseFirestore;

  // A test user email and password
  const String testEmail = 'test@example.com';
  const String testPassword = 'testPassword';

  // Set up the mock Firebase services and user
  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    mockFirebaseFirestore = MockFirebaseFirestore();

    when(mockFirebaseAuth.signInWithEmailAndPassword(
      email: testEmail,
      password: testPassword,
    )).thenAnswer((_) async => UserCredential(
          credential: null,
          user: User(uid: '123'),
        ));

    when(mockFirebaseFirestore.collection(any))
        .thenReturn(MockCollectionReference());
    String? myString = null;
    String someOtherString = myString ?? 'default value';
  });

  // Clean up the mock Firebase services
  tearDown(() {
    reset(mockFirebaseAuth);
    reset(mockFirebaseFirestore);
  });

  testWidgets('Login screen form validation and login flow',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));

    // Find the email and password text fields
    final emailField = find.byKey(Key('emailField'));
    final passwordField = find.byKey(Key('passwordField'));

    // Enter the test email and password
    await tester.enterText(emailField, testEmail);
    await tester.enterText(passwordField, testPassword);

    // Submit the login form
    await tester.tap(find.byKey(Key('loginButton')));
    await tester.pumpAndSettle();

    // Verify that the loading dialog is shown
    expect(find.byType(LoadingDialog), findsOneWidget);

    // Wait for the login function to complete and the loading dialog to be dismissed
    await tester.pump(const Duration(seconds: 1));

    // Verify that the data is read from Firestore and saved locally
    verify(mockFirebaseFirestore.collection('sellers').doc('123').get());

    // Verify that the home screen is pushed to the navigation stack
    expect(find.byType(HomeScreen), findsOneWidget);
  });
}

// A mock implementation of the Firestore CollectionReference class
class MockCollectionReference extends Mock implements CollectionReference {}

// A mock implementation of the LoadingDialog and ErrorDialog widgets
class LoadingDialog extends StatelessWidget {
  final String message;

  const LoadingDialog({required this.message});

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}

class ErrorDialog extends StatelessWidget {
  final String message;

  const ErrorDialog({required this.message});

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}

// A mock implementation of the HomeScreen widget
class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
