import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_dress_app/color.dart';

Widget loadingIndicator() {
  return const CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation(color.redColor),
  );
}
