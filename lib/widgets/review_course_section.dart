import 'package:flutter/material.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:hackfest_mobile/styles/my_text.dart';
class ReviewCourseSection extends StatelessWidget {
  const ReviewCourseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width:43,
            height: 43,
            decoration: BoxDecoration(
                shape: BoxShape.circle
            ),
            clipBehavior: Clip.hardEdge,
            child: Image.asset('assets/images/profile_hackfest.png', fit: BoxFit.cover,),
          ),
          const SizedBox(width: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Verra Gracea', style: MyTextStyle.judulH4(color: MyColors.blackBase),),
              Row(
                children: [
                  Icon(Icons.star,color: MyColors.secondaryBase,),
                  Icon(Icons.star,color: MyColors.secondaryBase,),
                  Icon(Icons.star,color: MyColors.secondaryBase,),
                ],
              ),
              Container(
                width: 250,
                child: Text('Program ini sangat membantu saya dalam belajar dasar Digital Marketing. Bentuk penyajian materi melalui video dan bacaan membuat saya senang dan tidak bosann.',
                  style: MyTextStyle.captionH5(color: MyColors.greyBase),
                  textAlign: TextAlign.justify,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
