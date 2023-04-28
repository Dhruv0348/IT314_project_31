import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:canteen_management/screens/order_details_screen.dart';
import 'package:canteen_management/widgets/status_banner.dart';

void main() {
  group('OrderDetailsScreen widget', () {
    testWidgets('should display order details when valid order ID is passed',
        (WidgetTester tester) async {
      // Create a test widget with a valid order ID
      await tester.pumpWidget(
        MaterialApp(
          home: OrderDetailsScreen(orderID: 'valid_order_id'),
        ),
      );

      // Verify that the status banner is displayed
      expect(find.byType(StatusBanner), findsOneWidget);

      // Verify that the total amount is displayed
      expect(find.text('₹  '), findsOneWidget);

      // Verify that the order ID is displayed
      expect(find.text('Order Id = valid_order_id'), findsOneWidget);

      // Verify that the order time is displayed
      expect(find.text('Order at: '), findsOneWidget);

      // Verify that the order by user name is displayed
      expect(find.text('Order by: '), findsOneWidget);

      // Verify that the order by user email is displayed
      expect(find.text('Email: '), findsOneWidget);

      // Verify that a divider is displayed
      expect(find.byType(Divider), findsOneWidget);
    });

    testWidgets('should display progress indicator when order ID is null',
        (WidgetTester tester) async {
      // Create a test widget with null order ID
      await tester.pumpWidget(
        MaterialApp(
          home: OrderDetailsScreen(orderID: null),
        ),
      );

      // Verify that a progress indicator is displayed
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}
