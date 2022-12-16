import 'package:flutter/cupertino.dart';
import 'package:my_dress_app/const.dart';

Widget senderBubble() {
  return Container(
    padding: EdgeInsets.all(8),
    margin: const EdgeInsets.only(bottom: 8),
    decoration: const BoxDecoration(
        color: color.redColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        )),
    child: Column(
      children: [
        "Message here.....".text.white.size(16).make(),
        SizedBox(
          height: 10,
        ),
        "11.45 PM".text.color(color.whiteColor.withOpacity(0.5)).make()
      ],
    ),
  );
}
