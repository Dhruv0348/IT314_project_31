import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:canteen_management/models/menus.dart';

void main() {
  group('Menus model', () {
    test('fromJson() should return a valid model', () {
      // Arrange
      final data = <String, dynamic>{
        'menuID': 'menu_id',
        'menuInfo': 'Menu info',
        'menuTitle': 'Menu title',
        'publishDate': Timestamp.now(),
        'sellerUID': 'seller_uid',
        'status': 'active',
        'thumbnailUrl': 'https://example.com/thumbnail.jpg',
      };

      // Act
      final model = Menus.fromJson(data);

      // Assert
      expect(model.menuID, data['menuID']);
      expect(model.menuInfo, data['menuInfo']);
      expect(model.menuTitle, data['menuTitle']);
      expect(model.publishDate, data['publishDate']);
      expect(model.sellerUID, data['sellerUID']);
      expect(model.status, data['status']);
      expect(model.thumbnailUrl, data['thumbnailUrl']);
    });

    test('toJson() should return a valid map', () {
      // Arrange
      final model = Menus(
        menuID: 'menu_id',
        menuInfo: 'Menu info',
        menuTitle: 'Menu title',
        publishDate: Timestamp.now(),
        sellerUID: 'seller_uid',
        status: 'active',
        thumbnailUrl: 'https://example.com/thumbnail.jpg',
      );

      // Act
      final data = model.toJson();

      // Assert
      expect(data['menuID'], model.menuID);
      expect(data['menuInfo'], model.menuInfo);
      expect(data['menuTitle'], model.menuTitle);
      expect(data['publishDate'], model.publishDate);
      expect(data['sellerUID'], model.sellerUID);
      expect(data['status'], model.status);
      expect(data['thumbnailUrl'], model.thumbnailUrl);
    });
  });
}
