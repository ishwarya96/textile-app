import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_dress_app/constfont.dart';
import 'package:my_dress_app/chatscreen.dart';
import 'package:my_dress_app/const.dart';
import 'package:my_dress_app/list.dart';
import 'package:my_dress_app/productcontroller.dart';
import 'package:my_dress_app/string.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  final dynamic data;
  const ItemDetails({Key? key, required this.title, this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();

    return WillPopScope(
      onWillPop: () async {
        controller.resetValues();
        return true;
      },
      child: Scaffold(
        backgroundColor: color.whiteColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                controller.resetValues();
              },
              icon: const Icon(Icons.arrow_back)),
          title: title!.text.color(color.darkFontGrey).fontFamily(bold).make(),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share,
                )),
            Obx(
              () => IconButton(
                  onPressed: () {
                    if (controller.isfav.value) {
                      controller.removeFromWishlist(data.id, context);
                    } else {
                      controller.addToWishlist(data.id, context);
                    }
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: controller.isfav.value
                        ? color.redColor
                        : color.darkFontGrey,
                  )),
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VxSwiper.builder(
                        autoPlay: true,
                        height: 350,
                        itemCount: data['p_imgs'].length,
                        aspectRatio: 16 / 9,
                        viewportFraction: 1.0,
                        itemBuilder: (context, index) {
                          return Image.network(
                            data["p_imgs"][index],
                            width: double.infinity,
                            fit: BoxFit.cover,
                          );
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    title!.text
                        .size(16)
                        .color(color.darkFontGrey)
                        .fontFamily(semibold)
                        .make(),
                    const SizedBox(
                      height: 10,
                    ),
                    VxRating(
                      isSelectable: false,
                      value: double.parse(data['p_rating']),
                      onRatingUpdate: (Value) {},
                      normalColor: color.textfieldGrey,
                      selectionColor: color.golden,
                      count: 5,
                      maxRating: 5,
                      size: 25,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    "${data['p_price']}"
                        .numCurrency
                        .text
                        .color(color.redColor)
                        .fontFamily(bold)
                        .size(18)
                        .make(),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            "Seller".text.white.fontFamily(semibold).make(),
                            const SizedBox(
                              height: 5,
                            ),
                            "${data['p_seller']}"
                                .text
                                .fontFamily(semibold)
                                .color(color.darkFontGrey)
                                .size(16)
                                .make()
                          ],
                        )),
                        const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.message_rounded,
                            color: color.darkFontGrey,
                          ),
                        ).onTap(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => const ChatScreen(),
                            ),
                          );
                        })
                      ],
                    )
                        .box
                        .height(60)
                        .padding(EdgeInsets.symmetric(horizontal: 16))
                        .color(color.textfieldGrey)
                        .make(),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 100,
                                child: "Color:"
                                    .text
                                    .color(color.textfieldGrey)
                                    .make(),
                              ),
                              Row(
                                children: List.generate(
                                    data['p_colors'].length,
                                    (index) => Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            VxBox()
                                                .size(40, 40)
                                                .roundedFull
                                                .color(Vx.randomPrimaryColor)
                                                .margin(
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 4))
                                                .make()
                                                .onTap(() {}),
                                            Visibility(
                                                visible: index ==
                                                    controller.colorIndex.value,
                                                child: const Icon(
                                                  Icons.done,
                                                  color: Colors.white,
                                                ))
                                          ],
                                        )),
                              )
                            ],
                          ).box.padding(const EdgeInsets.all(8)).make(),
                          Row(
                            children: [
                              SizedBox(
                                height: 100,
                                child: "Quantity:"
                                    .text
                                    .color(color.textfieldGrey)
                                    .make(),
                              ),
                              Obx(
                                () => (Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          controller.decreaseQuantity();
                                          controller.calculateTotalPrice(
                                              int.parse(data['p_price']));
                                        },
                                        icon: Icon(Icons.remove)),
                                    controller.quantity.value.text
                                        .size(16)
                                        .color(color.darkFontGrey)
                                        .fontFamily(bold)
                                        .make(),
                                    IconButton(
                                        onPressed: () {
                                          controller.increaseQuantity(
                                              int.parse(data['p_quantity']));
                                          controller.calculateTotalPrice(
                                              int.parse(data['p_price']));
                                        },
                                        icon: Icon(Icons.add)),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    "(${data['p_quantity']} available)"
                                        .text
                                        .color(color.textfieldGrey)
                                        .make()
                                  ],
                                )),
                              )
                            ],
                          ).box.padding(const EdgeInsets.all(8)).make(),
                          Row(
                            children: [
                              SizedBox(
                                height: 100,
                                child: "Total:"
                                    .text
                                    .color(color.textfieldGrey)
                                    .make(),
                              ),
                              "${controller.totalPrice.value}"
                                  .numCurrency
                                  .text
                                  .color(color.redColor)
                                  .size(16)
                                  .fontFamily(bold)
                                  .make()
                            ],
                          ).box.padding(const EdgeInsets.all(8)).make()
                        ],
                      ).box.white.shadowSm.make(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    "Description"
                        .text
                        .color(color.darkFontGrey)
                        .fontFamily(semibold)
                        .make(),
                    const SizedBox(
                      height: 10,
                    ),
                    "${data['p_desc']}".text.color(color.darkFontGrey).make(),
                    const SizedBox(
                      height: 10,
                    ),
                    ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: List.generate(
                          itemDetailsButtonsList.length,
                          (index) => ListTile(
                                title: itemDetailsButtonsList[index]
                                    .text
                                    .fontFamily(semibold)
                                    .color(color.darkFontGrey)
                                    .make(),
                                trailing: Icon(Icons.arrow_forward),
                              )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    productsyoumaylike.text
                        .fontFamily(bold)
                        .size(16)
                        .color(color.darkFontGrey)
                        .make(),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            )),
            SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    if (controller.quantity.value > 0) {
                      controller.addToCart(
                          color: data['p_colors'][controller.colorIndex.value],
                          context: context,
                          // vendorID: data['vendor_id'],
                          img: data['p_imgs'][0],
                          qty: controller.quantity.value,
                          sellername: data['p_seller'],
                          title: data['p_name'],
                          tprice: controller.totalPrice.value);
                      VxToast.show(context, msg: "Added to cart");
                    } else {
                      VxToast.show(context,
                          msg: "Minumum 1 product is requried");
                    }
                  },
                  child: const Text("Add To Cart"),
                )),
          ],
        ),
      ),
    );
  }
}
