import 'package:flutter/material.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
class MyTextFieldForm extends StatelessWidget {
  MyTextFieldForm({super.key, required this.label, required this.hint, required this.controller, required this.icon});

  final String label;
  final String hint;
  final TextEditingController controller;
  final IconData icon;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label', style: TextStyle(color: MyColors.blackBase, fontWeight: FontWeight.w500),),
        TextField(
          controller: controller,
          decoration: InputDecoration(
              hintText: '$hint',
              hintStyle: TextStyle(color: MyColors.grey300, fontSize: 13),
              prefixIcon: Icon(icon, color: MyColors.grey300,),
              filled: true,
              fillColor: MyColors.neutra100,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none
              ),
              contentPadding: EdgeInsets.all(10)
          ),

        )
      ],
    );
  }
}
