import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:my_dress_app/constfont.dart';
import 'package:my_dress_app/cartcontroller.dart';
import 'package:my_dress_app/const.dart';
import 'package:my_dress_app/paymentmethod.dart';

class ShippingDetalils extends StatelessWidget {
  const ShippingDetalils({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Shipping Info"
            .text
            .fontFamily(semibold)
            .color(color.darkFontGrey)
            .make(),
      ),
      bottomNavigationBar: SizedBox(
          height: 60,
          child: ElevatedButton(
              onPressed: () {
                {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => PaymentMethods()));
                }
                {}
              },
              child: Text("Continue"))),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "Address",
              ),
              controller: controller.addressController,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "City"),
              controller: controller.cityController,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "State"),
              controller: controller.stateController,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Phone"),
              controller: controller.phoneController,
            ),
          ],
        ),
      ),
    );
  }
}
