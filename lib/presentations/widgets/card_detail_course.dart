import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:GrowBiz/styles/my_colors.dart';
import 'package:GrowBiz/styles/my_text.dart';
import 'package:intl/intl.dart';
class CardDetailCourse extends StatelessWidget {
  CardDetailCourse({super.key,required this.image, required this.rating, required this.title, required this.numberOfPeople, required this.categories, required this.price, required this.onTap});
  final String image;
  final String rating;
  final String title;
  final String numberOfPeople;
  final int price;
  final String categories;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final currencyFormater = NumberFormat.currency(locale: 'id_ID',symbol: 'Rp.');
    return Container(
      width: double.infinity,
      height: 250,
      margin: EdgeInsets.symmetric(horizontal: 22),
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
            onTap: onTap,
            child: Container(
              width: double.infinity,
              height: 180,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage('$image'),
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
                        SvgPicture.asset('assets/svgs/star_icon.svg',color: MyColors.secondaryBase,width: 13),
                        Text(rating, style: MyTextStyle.captionH5(color: MyColors.blackBase),)
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
                Text(title, style: MyTextStyle.judulH5(color: MyColors.blackBase),),
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
                      SvgPicture.asset('assets/svgs/person_icon.svg', color: MyColors.grey200,width: 13,),
                      const SizedBox(width: 5,),
                      Text(numberOfPeople, style: MyTextStyle.judulH5(color: MyColors.grey200),),
                    ],
                  ),
                ),
                const SizedBox(width: 15,),
                Container(
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/svgs/money_icon.svg'),
                      const SizedBox(width: 5,),
                      Text(currencyFormater.format(price).toString().replaceAll(RegExp(r',00$'), ''), style: MyTextStyle.judulH5(color: MyColors.primaryBase),),
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