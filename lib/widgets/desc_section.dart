import 'package:flutter/material.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:hackfest_mobile/styles/my_text.dart';
class DescSection extends StatelessWidget {
  DescSection({super.key, required this.desc, required this.bab});
  String desc;
  List<String> bab;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Text(
              desc,
              style: MyTextStyle.captionH5(color: MyColors.greyBase),
              textAlign: TextAlign.justify,
            ),
          ),
          const SizedBox(height: 15,),
          Align(
            alignment: Alignment.centerLeft,
            child:Text('Bab',style: MyTextStyle.buttonH3(color: MyColors.blackBase),),
          ),
          SizedBox(
            height: 200,
            child: ListView.separated(
              itemCount: bab.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Row(
                    children: [
                    Icon(Icons.circle_rounded, color: MyColors.primaryBase, size: 10),
                    const SizedBox(width: 5,),
                    Text(bab[index], style: MyTextStyle.judulH5(color: MyColors.blackBase),),
                     ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 5,);
              },
              ),
          ),
        ],
      ),
    );
  }
}
