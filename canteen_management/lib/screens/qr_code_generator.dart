import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class QRCodeGenerator extends StatefulWidget {
  final String orderID;
  const QRCodeGenerator({super.key, required this.orderID});

  @override
  _QRCodeGeneratorState createState() => _QRCodeGeneratorState();
}

class _QRCodeGeneratorState extends State<QRCodeGenerator> {
  String _currentOrderJson = '';

  Future<void> _getUserCart() async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> userDoc =
          await FirebaseFirestore.instance
              .collection('orders')
              .doc(widget.orderID)
              .get();
      final List<dynamic> currentOrder = userDoc.get('productIDs');
      final Map<String, dynamic> orderMap = {'productIDs': currentOrder};
      _currentOrderJson = jsonEncode(orderMap);
      print(_currentOrderJson);
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _getUserCart();
  }

  @override
  Widget build(BuildContext context) {
    return QrImage(
      data: _currentOrderJson,
      version: QrVersions.auto,
      size: 200.0,
    );
  }
}