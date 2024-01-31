import 'package:flutter/material.dart';
import 'package:GrowBiz/styles/my_colors.dart';

class MyButton extends StatelessWidget {
  MyButton({super.key, required this.text, required this.color, required this.onPressed});
  final String text;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            visualDensity: const VisualDensity(horizontal: VisualDensity.maximumDensity,vertical:2 ),
            backgroundColor: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            elevation: 0
        ),
        child: Text('$text', style: TextStyle(fontWeight: FontWeight.w700, color: MyColors.whiteBase),)
    );
  }
}
