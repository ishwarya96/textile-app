import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_dress_app/constfont.dart';
import 'package:my_dress_app/const.dart';
import 'package:my_dress_app/details_card.dart';
import 'package:my_dress_app/list.dart';
import 'package:my_dress_app/ordersscreen.dart';
import 'package:my_dress_app/string.dart';
import 'package:my_dress_app/wishlistscree.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Align(alignment: Alignment.topRight, child: Icon(Icons.edit))
                .onTap(() {}),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset(
                  imgProfile2,
                  width: 100,
                  fit: BoxFit.cover,
                ).box.roundedFull.clip(Clip.antiAlias).make(),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Ishwarya".text.fontFamily(semibold).make(),
                    "ishu123@gmail.com".text.make()
                  ],
                )),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.black)),
                    onPressed: () {},
                    child: "Logout".text.fontFamily(semibold).make())
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return Divider(color: color.lightGrey);
                  },
                  itemCount: profileButtonsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      onTap: () {
                        switch (index) {
                          case 0:
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => OrdersScreen()));
                            break;
                          case 1:
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => Wishlist()));
                            break;
                        }
                      },
                      leading: Image.asset(
                        profileButtonsIcons[index],
                        width: 22,
                      ),
                      title: profileButtonsList[index]
                          .text
                          .fontFamily(semibold)
                          .color(color.darkFontGrey)
                          .make(),
                    );
                  })
              .box
              .rounded
              .margin(EdgeInsets.all(12))
              .padding(EdgeInsets.symmetric(horizontal: 16))
              .make()
              .box
              .make()
        ],
      )),
    );
  }
}
