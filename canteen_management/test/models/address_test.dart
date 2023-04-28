import 'package:flutter_test/flutter_test.dart';
import 'package:canteen_management/models/address.dart';

void main() {
  group('Address model', () {
    test('fromJson() should return a valid model', () {
      // Arrange
      final data = <String, dynamic>{
        'name': 'John Doe',
        'phoneNumber': '+1234567890',
        'flatNumber': '123',
        'city': 'New York City',
        'state': 'New York',
        'fullAddress': '123 Main St, New York, NY 10001',
        'lat': 40.712776,
        'lng': -74.005974,
      };

      // Act
      final model = Address.fromJson(data);

      // Assert
      expect(model.name, data['name']);
      expect(model.phoneNumber, data['phoneNumber']);
      expect(model.flatNumber, data['flatNumber']);
      expect(model.city, data['city']);
      expect(model.state, data['state']);
      expect(model.fullAddress, data['fullAddress']);
      expect(model.lat, data['lat']);
      expect(model.lng, data['lng']);
    });

    test('toJson() should return a valid map', () {
      // Arrange
      final model = Address(
        name: 'John Doe',
        phoneNumber: '+1234567890',
        flatNumber: '123',
        city: 'New York City',
        state: 'New York',
        fullAddress: '123 Main St, New York, NY 10001',
        lat: 40.712776,
        lng: -74.005974,
      );

      // Act
      final data = model.toJson();

      // Assert
      expect(data['name'], model.name);
      expect(data['phoneNumber'], model.phoneNumber);
      expect(data['flatNumber'], model.flatNumber);
      expect(data['city'], model.city);
      expect(data['state'], model.state);
      expect(data['fullAddress'], model.fullAddress);
      expect(data['lat'], model.lat);
      expect(data['lng'], model.lng);
    });
  });
}
