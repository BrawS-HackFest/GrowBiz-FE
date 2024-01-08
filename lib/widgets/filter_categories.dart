import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:hackfest_mobile/styles/my_text.dart';

class FilterCategories extends StatelessWidget {
  FilterCategories({super.key, required this.icon, required this.name});
  String icon;
  String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 75,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 53,
            height: 53,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: MyColors.primaryO50
            ),
            child: SvgPicture.asset('assets/svgs/$icon', color: MyColors.primaryBase,),
          ),
          const SizedBox(height: 5,),
          Text(name,style: MyTextStyle.captionH5(color: MyColors.blackBase),),
        ],
      ),
    );
  }
}
