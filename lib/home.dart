import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:my_dress_app/cartscreen.dart';
import 'package:my_dress_app/category.dart';
import 'package:my_dress_app/color.dart';
import 'package:my_dress_app/exitdialog.dart';
import 'package:my_dress_app/homescree.dart';
import 'package:my_dress_app/homescreencontroller.dart';
import 'package:my_dress_app/profilescreen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());

    var navbarItem = [
      BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: "home"),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.category,
          ),
          label: "Category"),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_cart,
          ),
          label: "Cart"),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
          ),
          label: "Profile"),
    ];

    var navBody = [
      HomeScreen(),
      CategoryScreen(),
      CartScreen(),
      ProfileScreen()
    ];
    return WillPopScope(
      onWillPop: () async {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => exitDialog(context));
        return false;
      },
      child: Scaffold(
        body: Column(
          children: [
            Obx(() => Expanded(
                child: navBody.elementAt(controller.currentNavIndex.value))),
          ],
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            currentIndex: controller.currentNavIndex.value,
            selectedItemColor: color.redColor,
            backgroundColor: color.whiteColor,
            type: BottomNavigationBarType.fixed,
            items: navbarItem,
            onTap: (value) {
              controller.currentNavIndex.value = value;
            },
          ),
        ),
      ),
    );
  }
}
