import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_dress_app/constfont.dart';
import 'package:my_dress_app/const.dart';
import 'package:my_dress_app/firebaseservices.dart';
import 'package:my_dress_app/itemdetails.dart';
import 'package:my_dress_app/loadingindicatore.dart';
import 'package:my_dress_app/productcontroller.dart';

class CategoryDetalis extends StatelessWidget {
  final String? title;

  const CategoryDetalis({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();

    return Scaffold(
      appBar: AppBar(title: title!.text.fontFamily(bold).white.make()),
      body: Column(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
                children: List.generate(
                    controller.subcat.length,
                    (index) => "${controller.subcat[index]}"
                        .text
                        .size(12)
                        .fontFamily(semibold)
                        .color(color.darkFontGrey)
                        .makeCentered()
                        .box
                        .white
                        .rounded
                        .size(120, 60)
                        .margin(const EdgeInsets.symmetric(horizontal: 4))
                        .make())),
          ),
          StreamBuilder(
              stream: FirestorServices.getProducts(title),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: loadingIndicator(),
                  );
                } else if (snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: "No Products Found!"
                        .text
                        .color(color.darkFontGrey)
                        .make(),
                  );
                } else {
                  var data = snapshot.data!.docs;

                  return Container(
                      padding: const EdgeInsets.all(8),
                      child: GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: data.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisExtent: 250,
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 8),
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  data[index]['p_imgs'][0],
                                  height: 150,
                                  width: 200,
                                  fit: BoxFit.cover,
                                ),
                                "${data[index]['p_name']}"
                                    .text
                                    .fontFamily(semibold)
                                    .color(color.darkFontGrey)
                                    .make(),
                                const SizedBox(
                                  height: 10,
                                ),
                                "${data[index]['p_price']}"
                                    .numCurrency
                                    .text
                                    .color(color.redColor)
                                    .fontFamily(bold)
                                    .size(16)
                                    .make()
                              ],
                            )
                                .box
                                .white
                                .margin(EdgeInsets.symmetric(horizontal: 4))
                                .roundedSM
                                .outerShadowSm
                                .padding(EdgeInsets.all(12))
                                .make()
                                .onTap(() {
                              controller.checkIffav(data[index]);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => ItemDetails(
                                            title: "${data[index]['p_name']}",
                                            data: data[index],
                                          )));
                            });
                          }));
                }
              })
        ],
      ),
    );
  }
}
