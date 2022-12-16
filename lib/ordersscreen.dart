import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_dress_app/constfont.dart';
import 'package:my_dress_app/const.dart';
import 'package:my_dress_app/firebaseservices.dart';
import 'package:my_dress_app/loadingindicatore.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "My Orders"
            .text
            .color(color.darkFontGrey)
            .fontFamily(semibold)
            .make(),
      ),
      body: StreamBuilder(
          stream: FirestorServices.getAllOrders(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshort) {
            if (!snapshort.hasData) {
              return Center(
                child: loadingIndicator(),
              );
            } else if (snapshort.data!.docs.isEmpty) {
              return "No orders yet!"
                  .text
                  .color(color.darkFontGrey)
                  .makeCentered();
            } else {
              var data = snapshort.data!.docs;

              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: "${index + 1}"
                          .text
                          .fontFamily(bold)
                          .color(color.lightGrey)
                          .xl
                          .make(),
                      tileColor: color.lightGrey,
                      subtitle: data[index]['total_amount']
                          .toString()
                          .numCurrency
                          .text
                          .fontFamily(bold)
                          .make(),
                      trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: color.darkFontGrey,
                          )),
                    );
                  });
            }
          }),
    );
  }
}
