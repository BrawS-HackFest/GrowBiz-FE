import 'package:flutter/material.dart';
import 'package:hackfest_mobile/pages/detail_article_page.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:hackfest_mobile/styles/my_text.dart';

class CardArticle extends StatelessWidget {
  const CardArticle({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return DetailArticle();
            }));
          },
          child: Container(
            width: 76,
            height: 76,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage('assets/images/umkm1.png'),
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
              Text('Memajukan UMKM Lokal : Penda...', style: MyTextStyle.judulH5(color: MyColors.blackBase),),
              const SizedBox(height: 10,),
              Text('Ditengah persaingan usaha yang sengit, UMKM harus dapat terus mempertahankan eksiste...',style: MyTextStyle.captionH5(color: MyColors.grey200),textAlign: TextAlign.justify,)
            ],
          ),
        )
      ],
    );
  }
}
