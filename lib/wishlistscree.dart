import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_dress_app/constfont.dart';
import 'package:my_dress_app/const.dart';
import 'package:my_dress_app/firebase.dart';
import 'package:my_dress_app/firebaseservices.dart';
import 'package:my_dress_app/loadingindicatore.dart';
import 'package:my_dress_app/string.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: "My Wish List"
              .text
              .color(color.darkFontGrey)
              .fontFamily(semibold)
              .make(),
        ),
        body: StreamBuilder(
            stream: FirestorServices.getWishlists(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshort) {
              if (!snapshort.hasData) {
                return Center(
                  child: loadingIndicator(),
                );
              } else if (snapshort.data!.docs.isEmpty) {
                return "Your Wish List Is Empty!"
                    .text
                    .color(color.darkFontGrey)
                    .makeCentered();
              } else {
                var data = snapshort.data!.docs;

                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, index) {
                            return ListTile(
                              leading: Image.network(
                                "${data[index]['p_imgs'][0]}",
                                width: 80,
                                fit: BoxFit.cover,
                              ),
                              title: "${data[index]['p_name']} "
                                  .text
                                  .fontFamily(semibold)
                                  .size(16)
                                  .make(),
                              subtitle: "${data[index]['p_price']}"
                                  .numCurrency
                                  .text
                                  .color(color.redColor)
                                  .fontFamily(semibold)
                                  .make(),
                              trailing: const Icon(
                                Icons.favorite,
                                color: color.redColor,
                              ).onTap(() async {
                                firestore
                                    .collection(productsCollection)
                                    .doc(data[index].id)
                                    .set({
                                      'p_wishlist':FieldValue.arrayRemove([currentUser!.uid])
                                    }, SetOptions(merge: true));
                              }),
                            );
                          }),
                    ),
                  ],
                );
              }
            }));
  }
}
