import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:hackfest_mobile/styles/my_text.dart';
class CardPopularCourse extends StatelessWidget {
  CardPopularCourse({super.key, required this.image, required this.rating, required this.title, required this.numberOfPeople, required this.categories, required this.price, required this.onTap});
  final String image;
  final String rating;
  final String title;
  final String numberOfPeople;
  final String price;
  final String categories;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 197,
      height: 197,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: double.infinity,
              height: 124,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage('$image'),
                    fit: BoxFit.cover
                ),
              ),
              child: Stack(
                  children:[ Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    width: 50,
                    height: 20,
                    decoration: BoxDecoration(
                        color: MyColors.whiteBase,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset('assets/svgs/star_icon.svg',color: MyColors.secondaryBase,width: 13),
                        Text('$rating', style: MyTextStyle.captionH5(color: MyColors.blackBase),)
                      ],
                    ),
                  ),
                  ]
              ),
            ),
          ),
          const SizedBox(height: 8,),
          Text(title, style: MyTextStyle.judulH5(color: MyColors.blackBase),),
          const SizedBox(height: 5,),
          Row(
            children: [
              SvgPicture.asset('assets/svgs/person_icon.svg', color: MyColors.grey200,width: 13,),
              Text(numberOfPeople, style: MyTextStyle.judulH5(color: MyColors.grey200),)
            ],
          ),
          const SizedBox(height: 4,),
          Row(
            children: [
              Text('Rp.$price', style: MyTextStyle.judulH5(color: MyColors.primaryBase),),
              const SizedBox(width: 10,),
              Text(categories, style: MyTextStyle.captionH5(color: MyColors.secondaryBase))
            ],
          ),


        ],
      ),
    );
  }
}
