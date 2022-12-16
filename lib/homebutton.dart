import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_dress_app/constfont.dart';
import 'package:my_dress_app/string.dart';
import 'package:my_dress_app/color.dart';
import 'package:my_dress_app/image.dart';
import 'package:velocity_x/velocity_x.dart';

Widget homeButtons({width, height, icon, String? title, onPress}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        icon,
        width: 26,
      ),
      title!.text.fontFamily(semibold).color(color.darkFontGrey).make()
    ],
  ).box.rounded.white.size(width, height).make();
}
