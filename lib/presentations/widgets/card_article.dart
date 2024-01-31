import 'package:flutter/material.dart';
import 'package:GrowBiz/styles/my_colors.dart';
import 'package:GrowBiz/styles/my_text.dart';

class CardArticle extends StatelessWidget {
   CardArticle({super.key, required this.image, required this.title, required this.desc, required this.id, required this.onTap});
   final int id;
   final String image;
   final String title;
   final String desc;
   VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        GestureDetector(
          onTap:onTap,
          child: Container(
            width: 76,
            height: 76,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage('$image'),
                    fit: BoxFit.cover
                )
            ),
          ),
        ),
        const SizedBox(width: 10,),
        SizedBox(
          width: 220,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: MyTextStyle.judulH5(color: MyColors.blackBase),),
              Text('${desc.substring(0,50)}...',style: MyTextStyle.captionH5(color: MyColors.grey200),textAlign: TextAlign.justify,)
            ],
          ),
        )
      ],
    );
  }
}
