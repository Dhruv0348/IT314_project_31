// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/address.dart';
import '../widgets/progress_bar.dart';
import '../widgets/shipment_address_design.dart';
import '../widgets/status_banner.dart';

class OrderDetailsScreen extends StatefulWidget {
  final String? orderID;

  const OrderDetailsScreen({Key? key, this.orderID}) : super(key: key);

  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  String orderStatus = "";
  String orderByUser = "";
  String sellerId = "";
  String UserID = "";
  String UserName = "";
  String UserEmail = "";


  void getUserInfo() async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(orderByUser)
        .get()
        .then((DocumentSnapshot) {
      // UserID = DocumentSnapshot.data()!["uid"].toString();
      // UserName = DocumentSnapshot.data()!["name"].toString();
      // UserEmail = DocumentSnapshot.data()!["email"].toString();

      setState(() {
        UserID = DocumentSnapshot.data()!["uid"].toString();
        UserName = DocumentSnapshot.data()!["name"].toString();
        UserEmail = DocumentSnapshot.data()!["email"].toString();
      });

    });
  }

  void getOrderInfo() async{
    print("Order ID is ${widget.orderID}")  ;

    FirebaseFirestore.instance
        .collection("orders")
        .doc(widget.orderID)
        .get()
        .then((DocumentSnapshot) {
      
      setState(() {
        orderStatus = DocumentSnapshot.data()!["status"].toString();
        orderByUser = DocumentSnapshot.data()!["orderBy"].toString();
        sellerId = DocumentSnapshot.data()!["sellerUID"].toString();
      });
      print("User is $orderByUser");
      print("Seller is $sellerId");
      print("Order Status is $orderStatus");


      getUserInfo();
    });
  }

  @override
  void initState() {
    super.initState();

    getOrderInfo();

    // getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance
                .collection("orders")
                .doc(widget.orderID)
                .get(),
            builder: (c, snapshot) {
              Map? dataMap;
              if (snapshot.hasData) {
                dataMap = snapshot.data!.data()! as Map<String, dynamic>;
                orderStatus = dataMap["status"].toString();
              }
              return snapshot.hasData
                  ? Column(
                      children: [
                        StatusBanner(
                          status: dataMap!["isSuccess"],
                          orderStatus: orderStatus,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "₹  " + dataMap["totalAmount"].toString(),
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Order Id = " + widget.orderID!,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Order at: " +
                                DateFormat("dd MMMM, yyyy - hh:mm aa").format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                        int.parse(dataMap["orderTime"]))),
                            style: const TextStyle(
                                fontSize: 16, color: Colors.grey),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Order by: " + "$UserName",
                            style: const TextStyle(
                                fontSize: 16, color: Colors.grey),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Email: " + "$UserEmail",
                            style: const TextStyle(
                                fontSize: 16, color: Colors.grey),
                          ),
                        ),
                        const Divider(
                          thickness: 4,
                        ),
                      ],
                    )
                  : Center(
                      child: circularProgress(),
                    );
            },
          ),
        ),
      ),
    );
  }
}
