import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_dress_app/const.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    getUsername();
    super.onInit();
  }

  var searchController = TextEditingController();
  var currentNavIndex = 0.obs;
  var username = 'n';
  getUsername() async {
    var n = await firestore
        .collection(userCollection)
        .where("id", isEqualTo: currentUser!.uid)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        return value.docs.single['name'];
      }
    });
  }
}
