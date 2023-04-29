import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class MyQRScanner extends StatefulWidget {
  const MyQRScanner({Key? key}) : super(key: key);

  @override
  _MyQRScannerState createState() => _MyQRScannerState();
}

class _MyQRScannerState extends State<MyQRScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController controller;
  String qrData = "";

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
    print('QR scanner disposed');
  }

  @override
  Widget build(BuildContext context) {
    print('Building QR scanner');
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan QR Code'),
        actions: [
          IconButton(
            icon: Icon(Icons.flash_on),
            onPressed: () {
              controller.toggleFlash();
              print('Flashlight turned on/off');
            },
          ),
        ],
      ),
      body: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      setState(() {
        qrData = scanData.code!;
      });
      controller.pauseCamera();

      debugPrint("Scanned Data: $qrData");
      print('QR scanner initialized');

      // Parse the scanned data (expected format: {"itemId": "1234", "quantity": "2"})
      Map<String, dynamic> scannedMap;
      try {
        scannedMap = jsonDecode(qrData);
      } catch (e) {
        print('Error decoding QR data: $e');
        return;
      }

      String itemId = "";
      String quantity = "";

      scannedMap.forEach((key, value) {
        if (key != "null") {
          if (key == "itemId") {
            itemId = value.toString();
          } else if (key == "quantity") {
            quantity = value.toString();
          }
        }
      });

      print("Scanned item ID: $itemId");
      print("Scanned quantity: $quantity");

      // Navigator.pop(context, qrData);

      // Show the popup dialog box
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Scanned Item"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Item ID: $itemId"),
                Text("Quantity: $quantity"),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                  controller.resumeCamera();
                },
              ),
            ],
          );
        },
      );
    });
  }
}
