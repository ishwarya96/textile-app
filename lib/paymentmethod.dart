import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_dress_app/constfont.dart';
import 'package:my_dress_app/cartcontroller.dart';
import 'package:my_dress_app/const.dart';
import 'package:my_dress_app/home.dart';
import 'package:my_dress_app/list.dart';
import 'package:my_dress_app/loadingindicatore.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();

    return Obx(
      () => Scaffold(
          backgroundColor: color.whiteColor,
          bottomNavigationBar: SizedBox(
              height: 60,
              child: controller.placingOrder.value
                  ? Center(
                      child: loadingIndicator(),
                    )
                  : ElevatedButton(
                      onPressed: () async {
                        await controller.placeMyOrder(
                            orderPaymentMethod:
                                paymetmethods[controller.paymentIndex.value],
                            totalAmount: controller.totalP.value);
                        await controller.clearCart();
                        VxToast.show(context, msg: 'Order Placed successfully');
                        Navigator.push(context,
                            MaterialPageRoute(builder: (ctx) => Home()));
                      },
                      child: Text("Place my order"))),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: "Choose Payment Method"
                .text
                .fontFamily(semibold)
                .color(color.darkFontGrey)
                .make(),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Obx(
              () => (Column(
                children: List.generate(paymentMethodsImg.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      controller.changePaymentIndex(index);
                    },
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: controller.paymentIndex.value == index
                                ? color.redColor
                                : Colors.transparent,
                            width: 4,
                          )),
                      margin: const EdgeInsets.only(bottom: 8),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Image.asset(
                            paymentMethodsImg[index],
                            width: double.infinity,
                            height: 120,
                            colorBlendMode:
                                controller.paymentIndex.value == index
                                    ? BlendMode.darken
                                    : BlendMode.color,
                            color: controller.paymentIndex.value == index
                                ? Colors.black.withOpacity(0.4)
                                : Colors.transparent,
                            fit: BoxFit.cover,
                          ),
                          controller.paymentIndex.value == index
                              ? Transform.scale(
                                  scale: 1.3,
                                  child: Checkbox(
                                    activeColor: Colors.green,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    value: true,
                                    onChanged: (Value) {},
                                  ),
                                )
                              : Container(),
                          Positioned(
                              bottom: 10,
                              right: 10,
                              child: paymetmethods[index]
                                  .text
                                  .white
                                  .fontFamily(semibold)
                                  .size(16)
                                  .make())
                        ],
                      ),
                    ),
                  );
                }),
              )),
            ),
          )),
    );
  }
}
