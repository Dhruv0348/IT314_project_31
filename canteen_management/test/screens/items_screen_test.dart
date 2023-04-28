import 'package:canteen_management/upload_screens/items_upload_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:canteen_management/screens/items_screen.dart';
import 'package:canteen_management/models/menus.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('ItemsScreen widget test', (WidgetTester tester) async {
    // Create a Menus model instance
    final menusModel = Menus(
      menuID: 'menu1',
      menuTitle: 'Burgers',
      menuInfo: 'https://example.com/burgers.jpg',
    );

    // Build the ItemsScreen widget with the Menus model instance
    await tester.pumpWidget(
      MaterialApp(
        home: ItemsScreen(model: menusModel),
      ),
    );

    // Verify that the app bar has a title with the menu title
    expect(find.text('${menusModel.menuTitle}\'S MENU ITEMS'), findsOneWidget);

    // Tap the add icon button to navigate to the upload screen
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    // Verify that the ItemsUploadScreen widget is rendered
    expect(find.byType(ItemsUploadScreen), findsOneWidget);

    // TODO: Add more test cases to verify the behavior of the widget
  });
}
