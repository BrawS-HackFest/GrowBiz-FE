import 'package:flutter/material.dart';
import 'package:GrowBiz/styles/my_colors.dart';

class MyTextField extends StatelessWidget {
  MyTextField({super.key, required this.hint, required this.controller, this.icon = null, this.type ='primary'});

  final String hint;
  final TextEditingController controller;
  final IconData? icon;
  final String? type;


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: icon == 'primary' ? MyColors.grey300 : MyColors.greyBase, fontSize: 13),
          prefixIcon: icon != null ? Icon(icon, color: MyColors.grey300,) : null,
          filled: true,
          fillColor: type == 'primary' ? MyColors.neutra100 : MyColors.whiteBase,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: type == 'primary' ? BorderSide.none : BorderSide(
                color: MyColors.grey200,
                width: 0.3,
              )
          ),
          contentPadding: EdgeInsets.all(10)
      ),

    );
  }
}