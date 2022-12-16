import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:my_dress_app/constfont.dart';
import 'package:my_dress_app/cartcontroller.dart';
import 'package:my_dress_app/const.dart';
import 'package:my_dress_app/firebaseservices.dart';
import 'package:my_dress_app/loadingindicatore.dart';
import 'package:my_dress_app/shippingscreen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CartController());
    return Scaffold(
        backgroundColor: color.whiteColor,
        bottomNavigationBar: SizedBox(
          height: 60,
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => ShippingDetalils()));
              },
              child: Text("Product to shipping")),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: "Shopping Cart"
              .text
              .color(color.darkFontGrey)
              .fontFamily(semibold)
              .make(),
        ),
        body: StreamBuilder(
            stream: FirestorServices.getCart(currentUser!.uid),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshort) {
              if (!snapshort.hasData) {
                return Center(
                  child: loadingIndicator(),
                );
              } else if (snapshort.data!.docs.isEmpty) {
                return Center(
                  child: "Cart is empty".text.color(color.darkFontGrey).make(),
                );
              } else {
                var data = snapshort.data!.docs;
                controller.calculate(data);
                controller.productSnapshort = data;

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                leading: Image.network(
                                  "${data[index]['img']}",
                                  width: 80,
                                  fit: BoxFit.cover,
                                ),
                                title:
                                    "${data[index]['title']} (x ${data[index]['qty']})"
                                        .text
                                        .fontFamily(semibold)
                                        .size(16)
                                        .make(),
                                subtitle: "${data[index]['tprice']}"
                                    .numCurrency
                                    .text
                                    .color(color.redColor)
                                    .fontFamily(semibold)
                                    .make(),
                                trailing: Icon(
                                  Icons.delete,
                                  color: color.redColor,
                                ).onTap(() {
                                  FirestorServices.deleteDocument(
                                      data[index].id);
                                }),
                              );
                            }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          "Total price"
                              .text
                              .fontFamily(semibold)
                              .color(color.darkFontGrey)
                              .make(),
                          Obx(
                            () => "${controller.totalP.value}"
                                .numCurrency
                                .text
                                .fontFamily(semibold)
                                .color(color.redColor)
                                .make(),
                          )
                        ],
                      )
                          .box
                          .padding(EdgeInsets.all(12))
                          .color(color.lightGrey)
                          .width(context.screenWidth - 60)
                          .roundedSM
                          .make(),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                );
              }
            }));
  }
}
