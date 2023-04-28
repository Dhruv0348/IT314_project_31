import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:canteen_management/models/items.dart';

void main() {
  group('Items model', () {
    test('fromJson() should return a valid model', () {
      // Arrange
      final data = <String, dynamic>{
        'menuID': 'menu_id',
        'sellerUID': 'seller_uid',
        'itemID': 'item_id',
        'title': 'Item title',
        'shortInfo': 'Item short info',
        'publishedDate': Timestamp.now(),
        'thumbnailUrl': 'https://example.com/thumbnail.jpg',
        'longDescription': 'Item long description',
        'status': 'active',
        'price': 999,
      };

      // Act
      final model = Items.fromJson(data);

      // Assert
      expect(model.menuID, data['menuID']);
      expect(model.sellerUID, data['sellerUID']);
      expect(model.itemID, data['itemID']);
      expect(model.title, data['title']);
      expect(model.shortInfo, data['shortInfo']);
      expect(model.publishedDate, data['publishedDate']);
      expect(model.thumbnailUrl, data['thumbnailUrl']);
      expect(model.longDescription, data['longDescription']);
      expect(model.status, data['status']);
      expect(model.price, data['price']);
    });

    test('toJson() should return a valid map', () {
      // Arrange
      final model = Items(
        menuID: 'menu_id',
        sellerUID: 'seller_uid',
        itemID: 'item_id',
        title: 'Item title',
        shortInfo: 'Item short info',
        publishedDate: Timestamp.now(),
        thumbnailUrl: 'https://example.com/thumbnail.jpg',
        longDescription: 'Item long description',
        status: 'active',
        price: 999,
      );

      // Act
      final data = model.toJson();

      // Assert
      expect(data['menuID'], model.menuID);
      expect(data['sellerUID'], model.sellerUID);
      expect(data['itemID'], model.itemID);
      expect(data['title'], model.title);
      expect(data['shortInfo'], model.shortInfo);
      expect(data['publishedDate'], model.publishedDate);
      expect(data['thumbnailUrl'], model.thumbnailUrl);
      expect(data['longDescription'], model.longDescription);
      expect(data['status'], model.status);
      expect(data['price'], model.price);
    });
  });
}
