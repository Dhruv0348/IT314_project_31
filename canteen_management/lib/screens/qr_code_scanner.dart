import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'scanned_item_details.dart';

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
        title: const Text('Scan QR Code'),
        actions: [
          IconButton(
            icon: const Icon(Icons.flash_on),
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

      List<dynamic> orderList = scannedMap["productIDs"];

// Remove the first element from the list (i.e. "garbageValue")
      orderList.removeAt(0);

// Print the remaining items in the list
      orderList.forEach((item) {
        print('here' + item);
      });

// Alternative
      // List<dynamic> filteredUserCartList = userCartList.sublist(1);
      // filteredUserCartList.forEach((item) {
      //   print('here: ' + item);
      // });

      List<String> firstArray = [];
      List<String> secondArray = [];

      for (String element in orderList) {
        List<String> splitArray = element.split(":");
        firstArray.add(splitArray[0]);
        secondArray.add(splitArray[1]);
      }

      print(
          firstArray); // Output: [1682576979504, 1682576979505, 1682576979506]
      print(secondArray);

      // print(scannedMap);

      List<String> itemId = firstArray;
      List<String> quantity = secondArray;

      final FirebaseFirestore db = FirebaseFirestore.instance;

      List<String> itemTitles = [];

      Future<void> getItemNames(String itemIDs) async {
        try {
          final DocumentSnapshot<Map<String, dynamic>> itemDoc =
              await FirebaseFirestore.instance
                  .collection('items')
                  .doc(itemIDs)
                  .get();

          final String itemName = itemDoc.get('title');
          // final Map<String, dynamic> userCartMap = {'userCart': userCart};
          // _userCartJson = jsonEncode(userCartMap);
          itemTitles.add(itemName);
          setState(() {});
        } catch (e) {
          print(e);
        }
      }

      // @override
      // void initState() {
      //   super.initState();

      // }

      for (String itemId in itemId) {
        await getItemNames(itemId);
      }

      // print("Scanned item name: $itemName");
      print(itemTitles);
      // Navigator.pop(context, qrData);

      // Show the popup dialog box
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScannedItemDetails(
            itemTitles: itemTitles,
            quantity: quantity,
          ),
        ),
      );
    });
  }
}
