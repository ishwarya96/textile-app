import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_dress_app/const.dart';
import 'package:my_dress_app/homescreencontroller.dart';

class CartController extends GetxController {
  var totalP = 0.obs;
  var addressController = TextEditingController();
  var cityController = TextEditingController();
  var stateController = TextEditingController();
  var phoneController = TextEditingController();
  var paymentIndex = 0.obs;
  late dynamic productSnapshort;
  var products = [];
  var placingOrder = false.obs;
  calculate(data) {
    totalP.value = 0;
    for (var i = 0; i < data.length; i++) {
      totalP.value = totalP.value + int.parse(data[i]['tprice'].toString());
    }
  }

  changePaymentIndex(index) {
    paymentIndex.value = index;
  }

  placeMyOrder({required orderPaymentMethod, required totalAmount}) async {
    placingOrder(true);
    await getProductDetails();
    await firestore.collection(ordersCollection).doc().set({
      'order_by': currentUser!.uid,
      'order_by_name': Get.find<HomeController>().username,
      'order_by_email': currentUser!.email,
      'order_by_address': addressController.text,
      'order_by_state': stateController.text,
      'order_by_city': cityController.text,
      'order_by_phone': phoneController.text,
      'shipping_method': "Home Delivery",
      'payment_method': orderPaymentMethod,
      'order_placed': true,
      'order_confirmed': false,
      'order_delivered': false,
      'order_on_delivery': false,
      'total_amount': totalAmount,
      'orders': FieldValue.arrayUnion(products)
    });
    placingOrder(false);
  }

  getProductDetails() {
    products.clear();
    for (var i = 0; i < productSnapshort.length; i++) {
      products.add({
        'color': productSnapshort[i]['color'],
        'img': productSnapshort[i]['img'],
        'vendor_id': productSnapshort[i]['vendor_id'],
        'tprice': productSnapshort[i]['tprice'],
        'qty': productSnapshort[i]['qty'],
        'title': productSnapshort[i]['title']
      });
    }
  }

  clearCart() {
    for (var i = 0; i < productSnapshort.length; i++) {
      firestore.collection(cartCollection).doc(productSnapshort[i].id).delete();
    }
  }
}
