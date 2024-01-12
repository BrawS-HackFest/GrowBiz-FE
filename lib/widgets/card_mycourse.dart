import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackfest_mobile/pages/list_content_course.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:hackfest_mobile/styles/my_text.dart';

class CardMyCourse extends StatelessWidget {
  const CardMyCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22),
      child: Container(
          width: double.infinity,
          height: 245,
          padding:const  EdgeInsets.all(11),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x549B9B9B),
                blurRadius: 7,
                offset: Offset(0, 2),
                spreadRadius: 0,
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 167,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image:AssetImage('assets/images/popular1.png'),
                      fit: BoxFit.cover
                  ),
                ),
                child: Stack(
                  children: [
                    Container(
                      width:127,
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: MyColors.whiteBase,
                          borderRadius: BorderRadius.circular(16)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset('assets/svgs/progress_icon.svg'),
                          Text('Belum Selesai', style: MyTextStyle.captionH5(color: MyColors.grey300),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 8,),
              Text('Menjadikan Hobi Sebagai Penghasilan', style: MyTextStyle.judulH5(color: MyColors.blackBase),),
              const SizedBox(height: 7,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Icon(Icons.menu_book_outlined, color: MyColors.grey300,),
                        const SizedBox(width: 3,),
                        Text('3/12 Bab', style: MyTextStyle.captionH5(color: MyColors.grey300),),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                        return ListContentCourse();
                      },));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: MyColors.primaryBase
                      ),
                      child: Icon(Icons.navigate_next, color: MyColors.whiteBase,),
                    ),
                  )

                ],
              )
            ],
          )
      ),
    );
  }
}
