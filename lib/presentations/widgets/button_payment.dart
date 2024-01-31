import 'package:flutter/material.dart';
import 'package:GrowBiz/styles/my_colors.dart';
import 'package:GrowBiz/styles/my_text.dart';

class ButtonPayment extends StatelessWidget {
  ButtonPayment({super.key, required this.icon, required this.bankName, required this.onTap, required this.selectedPayment, required this.payment});
  String icon;
  String bankName;
  VoidCallback onTap;
  String payment;
  String selectedPayment;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        color:selectedPayment==payment ? MyColors.neutral : MyColors.whiteBase,
        padding: EdgeInsets.symmetric(horizontal: 26, vertical: 13),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/images/$icon', width: 50, height: 15,),
            Text(bankName, style: MyTextStyle.captionH5(color: MyColors.blackBase),)
          ],
        ),
      ),
    );
  }
}
