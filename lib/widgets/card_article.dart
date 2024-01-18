import 'package:flutter/material.dart';
import 'package:hackfest_mobile/pages/detail_article_page.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:hackfest_mobile/styles/my_text.dart';

class CardArticle extends StatelessWidget {
   CardArticle({super.key, required this.image, required this.title, required this.desc, required this.id});
   final int id;
   final String image;
   final String title;
   final String desc;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return DetailArticlePage(id: id,);
            }));
          },
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
            children: [
              Text(title, style: MyTextStyle.judulH5(color: MyColors.blackBase),),
              const SizedBox(height: 10,),
              Text(desc.substring(1,15),style: MyTextStyle.captionH5(color: MyColors.grey200),textAlign: TextAlign.justify,)
            ],
          ),
        )
      ],
    );
  }
}
