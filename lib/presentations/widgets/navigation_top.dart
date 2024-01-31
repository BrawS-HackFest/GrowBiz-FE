import 'package:flutter/material.dart';
import 'package:GrowBiz/styles/my_colors.dart';
import 'package:GrowBiz/styles/my_text.dart';

class NavigationTop extends StatefulWidget {
  NavigationTop({super.key, required this.label, required this.selected, required this.id, this.onTap});
  String label;
  int selected;
  int id;
  VoidCallback? onTap;

  @override
  State<NavigationTop> createState() => _NavigationTopState();
}

class _NavigationTopState extends State<NavigationTop> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        children: [
          Text(widget.label, style: MyTextStyle.judulH4(color: widget.selected==widget.id ? MyColors.blackBase : MyColors.grey200),),
          const SizedBox(height: 5,),
          Container(
            width: MediaQuery.of(context).size.width/2,
            height: 3,
            color: widget.selected==widget.id ? MyColors.primaryBase : MyColors.neutral,
          )
        ],
      ),
    );
  }
}
