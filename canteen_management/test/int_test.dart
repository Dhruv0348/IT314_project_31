import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test/test.dart';

import 'package:canteen_management/models/menus.dart';

void main() {
  group('Menus integration test', () {
    late CollectionReference<Map<String, dynamic>> menusCollection;

    setUp(() async {
      // Connect to a Cloud Firestore instance.
      final firebase = Firebase.initializeApp();
      await firebase;

      // Create a new collection in the database to store menu items.
      menusCollection = FirebaseFirestore.instance.collection('menus');
    });

    test('Add and retrieve menu item', () async {
      // Create a new Menus object with some sample data.
      final menu = Menus(
        menuID: 'menu1',
        sellerUID: 'seller1',
        menuTitle: 'Sample menu',
        menuInfo: 'Some information about the menu',
        publishDate: Timestamp.now(),
        thumbnailUrl: 'https://example.com/image.jpg',
        status: 'active',
      );

      // Call the toJson method on the Menus object to convert it to a JSON object.
      final json = menu.toJson();

      // Use the cloud_firestore package to add the JSON object to the collection in the database.
      await menusCollection.doc(menu.menuID).set(json);

      // Use the cloud_firestore package to retrieve the menu item from the database using its ID.
      final snapshot = await menusCollection.doc(menu.menuID).get();

      // Call the fromJson method on the retrieved JSON object to convert it back to a Menus object.
      final retrievedMenu = Menus.fromJson(snapshot.data()!);

      // Verify that the properties of the retrieved Menus object match the expected values.
      expect(retrievedMenu.menuID, equals(menu.menuID));
      expect(retrievedMenu.sellerUID, equals(menu.sellerUID));
      expect(retrievedMenu.menuTitle, equals(menu.menuTitle));
      expect(retrievedMenu.menuInfo, equals(menu.menuInfo));
      expect(retrievedMenu.publishDate, equals(menu.publishDate));
      expect(retrievedMenu.thumbnailUrl, equals(menu.thumbnailUrl));
      expect(retrievedMenu.status, equals(menu.status));
    });
  });
}