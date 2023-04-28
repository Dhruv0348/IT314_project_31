import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:canteen_management/screens/item_detail_screen.dart';
import 'package:canteen_management/models/items.dart';

void main() {
  testWidgets('ItemDetailsScreen displays item details correctly',
      (WidgetTester tester) async {
    final item = Items(
      itemID: '1234',
      title: 'Test Item',
      thumbnailUrl: 'https://example.com/item.png',
      longDescription: 'This is a test item for widget testing.',
      price: 50,
      menuID: '5678',
    );

    await tester.pumpWidget(
      MaterialApp(
        home: ItemDetailsScreen(
          model: item,
        ),
      ),
    );

    expect(find.text(item.title!), findsOneWidget);
    expect(find.text(item.longDescription!), findsOneWidget);
    expect(find.text('\₹${item.price}'), findsOneWidget);
  });
}
