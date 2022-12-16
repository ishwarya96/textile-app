import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_dress_app/color.dart';
import 'package:my_dress_app/firebaseservices.dart';

class SearchScreen extends StatelessWidget {
  final String? title;
  const SearchScreen({Key? key, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
