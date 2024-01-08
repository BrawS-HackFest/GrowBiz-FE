import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:hackfest_mobile/styles/my_text.dart';
class CardDetailCourse extends StatelessWidget {
  const CardDetailCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
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
            ),
          ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: (){},
            child: Container(
              width: double.infinity,
              height: 180,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage('assets/images/popular1.png'),
                    fit: BoxFit.cover
                ),
              ),
              child: Stack(
                  children:[ Container(
                    margin:const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    width: 50,
                    height: 20,
                    decoration: BoxDecoration(
                        color: MyColors.whiteBase,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.star_outlined,color: MyColors.secondaryBase,size: 13),
                        Text('4,8', style: MyTextStyle.captionH5(color: MyColors.blackBase),)
                      ],
                    ),
                  ),
                  ]
              ),
            ),
          ),
          const SizedBox(height: 8,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Dasar Digital Marketing', style: MyTextStyle.judulH5(color: MyColors.blackBase),),
                Text('teratas', style: MyTextStyle.captionH5(color: MyColors.secondaryBase))
              ],
            ),
          ),

          const SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Container(
                  child: Row(
                    children: [
                      Icon(Icons.person, color: MyColors.grey200,size: 13,),
                      const SizedBox(width: 5,),
                      Text('2.308', style: MyTextStyle.judulH5(color: MyColors.grey200),),
                    ],
                  ),
                ),
                const SizedBox(width: 15,),
                Container(
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/svgs/money_icon.svg'),
                      const SizedBox(width: 5,),
                      Text('Rp.40.000', style: MyTextStyle.judulH5(color: MyColors.primaryBase),),
                    ],
                  ),
                )


              ],
            ),
          ),

        ],
      ),
    );
  }
}
