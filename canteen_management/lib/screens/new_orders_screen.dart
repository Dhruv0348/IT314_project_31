import 'package:canteen_management/screens/qr_code_scanner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../assistantMethods/assistant_methods.dart';
import '../global/global.dart';
import '../widgets/order_card_design.dart';
import '../widgets/progress_bar.dart';
import '../widgets/simple_app_bar.dart';

class NewOrdersScreen extends StatefulWidget {
  const NewOrdersScreen({Key? key}) : super(key: key);
  @override
  _NewOrdersScreenState createState() => _NewOrdersScreenState();
}

class _NewOrdersScreenState extends State<NewOrdersScreen> {
  String status = "normal";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Orders'),
        actions: [
          IconButton(
            icon: const Icon(Icons.qr_code_scanner),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyQRScanner(),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset(-2.0, 0.0),
            end: FractionalOffset(5.0, -1.0),
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFFFAC898),
            ],
          ),
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("orders")
              .where("status", whereIn: ["normal", "cooked"])
              .where("sellerUID", isEqualTo: sharedPreferences!.getString("uid"))
              .orderBy("orderTime", descending: true)
              .snapshots(),
              
          builder: (c, snapshot) {
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (c, index) {
                      return FutureBuilder<QuerySnapshot>(
                        future: FirebaseFirestore.instance
                            .collection("items")
                            .where("itemID",
                                whereIn: separateOrderItemIDs(
                                    (snapshot.data!.docs[index].data()!
                                        as Map<String, dynamic>)["productIDs"]))
                            .where("sellerUID",
                                whereIn: (snapshot.data!.docs[index].data()!
                                    as Map<String, dynamic>)["uid"])
                            .orderBy("publishedDate", descending: true)
                            .get(),
                        builder: (c, snap) {
                          status = (snapshot.data!.docs[index].data()!
                              as Map<String, dynamic>)["status"];

                          return snap.hasData
                              ? Column(
                                  children: [
                                    OrderCardDesign(
                                      itemCount: snap.data!.docs.length,
                                      data: snap.data!.docs,
                                      orderID: snapshot.data!.docs[index].id,
                                      status: (snapshot.data!.docs[index]
                                              .data()!
                                          as Map<String, dynamic>)["status"],
                                      seperateQuantitiesList:
                                          separateOrderItemQuantities((snapshot
                                                      .data!.docs[index]
                                                      .data()!
                                                  as Map<String, dynamic>)[
                                              "productIDs"]),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        status == "normal"
                                            ? ElevatedButton(
                                                onPressed: () {
                                                  status = "cooked";
                                                  FirebaseFirestore.instance
                                                      .collection("orders")
                                                      .doc(snapshot
                                                          .data!.docs[index].id)
                                                      .update(
                                                          {"status": "cooked"});
                                                },
                                                child: Text("Cooked"),
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty
                                                          .resolveWith<Color>(
                                                    (Set<MaterialState>
                                                        states) {
                                                      if (states.contains(
                                                          MaterialState
                                                              .pressed))
                                                        return Color.fromARGB(
                                                            255, 208, 214, 208);
                                                      return Color.fromARGB(
                                                          255, 5, 255, 80);
                                                    },
                                                  ),
                                                ),
                                              )
                                            : ElevatedButton(
                                                onPressed: null,
                                                child: Text('Cooked'),
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors.grey),
                                                ),
                                              ),
                                        ElevatedButton(
                                          onPressed: () {
                                            FirebaseFirestore.instance
                                                .collection("orders")
                                                .doc(snapshot
                                                    .data!.docs[index].id)
                                                .update({"status": "ended"});
                                          },
                                          child: Text("Collected"),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              : Center(child: circularProgress());
                        },
                      );
                    },
                  )
                : Center(
                    child: circularProgress(),
                  );
          },
        ),
      ),
    );
  }
}
