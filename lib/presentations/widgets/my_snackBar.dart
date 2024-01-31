import 'package:flutter/material.dart';
import 'package:GrowBiz/styles/my_colors.dart';

void mySnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: MyColors.primary400,
      content: Text(text, style: TextStyle(color: MyColors.whiteBase),),
    ),
  );
}
