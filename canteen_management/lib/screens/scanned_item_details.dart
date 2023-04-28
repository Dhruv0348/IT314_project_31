import 'package:canteen_management/widgets/cart_item_design.dart';
import 'package:canteen_management/widgets/scanned_item_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ScannedItemDetails extends StatelessWidget {
  final List<String> itemTitles;
  final List<String> quantity;
  const ScannedItemDetails(
      {super.key, required this.itemTitles, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Item Details'),
        ),
        body: ListView.builder(
          itemCount: itemTitles.length,
          itemBuilder: (BuildContext context, int index) {
            return CartItemTitleAndQuantity(
              title: itemTitles[index],
              quantity: quantity[index],
            );
          },
        ));
  }
}
