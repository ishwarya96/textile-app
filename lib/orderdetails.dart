import 'package:flutter/material.dart';

import 'package:my_dress_app/constfont.dart';
import 'package:my_dress_app/const.dart';

class OrderDetails extends StatelessWidget {
  final dynamic data;
  const OrderDetails({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Order Details".text.fontFamily(semibold).make(),
      ),
      body: Column(
        children: [
          // orderStatus(
          //     colo: color.redColor,
          //     icon: Icons.done,
          //     title: "Order placed",
          //     showDone: data['order_placed'])
        ],
      ),
    );
  }
}
