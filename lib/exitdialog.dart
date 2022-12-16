import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_dress_app/constfont.dart';
import 'package:my_dress_app/const.dart';

Widget exitDialog(context) {
  return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          "Confirm"
              .text
              .fontFamily(bold)
              .size(18)
              .color(color.darkFontGrey)
              .make(),
          Divider(),
          SizedBox(
            height: 10,
          ),
          "Are you sure you want to exit?"
              .text
              .size(16)
              .color(color.darkFontGrey)
              .make(),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: Text(
                    "Yes",
                  )),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("No"))
            ],
          )
        ],
      )
          .box
          .color(color.lightGrey)
          .padding(EdgeInsets.all(12))
          .roundedSM
          .make());
}
