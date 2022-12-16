import 'package:flutter/material.dart';
import 'package:my_dress_app/constfont.dart';
import 'package:my_dress_app/const.dart';

import 'constfont.dart';

Widget detailsCard({width, String? count, String? title}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      "00".text.fontFamily(bold).color(Colors.white).size(16).make(),
      SizedBox(
        height: 5,
      ),
      "in your cart".text.color(Colors.white).make()
    ],
  )
      .box
      .color(color.fontGrey)
      .rounded
      .width(width)
      .height(80)
      .padding(EdgeInsets.all(4))
      .make();
}
