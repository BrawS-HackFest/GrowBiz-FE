import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:GrowBiz/styles/my_colors.dart';
import 'package:GrowBiz/styles/my_text.dart';
import 'package:intl/intl.dart';
class CardDetailCoursePayment extends StatelessWidget {
  CardDetailCoursePayment({super.key, required this.title, required this.rating, required this.buyer, required this.price, required this.image});
  String title;
  String rating;
  String buyer;
  int price;
  String image;

  final currencyFormater = NumberFormat.currency(locale: 'id_ID',symbol: 'Rp.');


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 22,right: 22, top: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Detail', style: MyTextStyle.buttonH3(color: MyColors.blackBase),),
          const SizedBox(height: 6,),
          Row(
            children: [
              Container(
                width: 86,
                height: 77,
                clipBehavior: Clip.hardEdge,
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(image, fit: BoxFit.cover,),
              ),
              const SizedBox(width: 12,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: MyTextStyle.judulH5(color: MyColors.blackBase),),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                                decoration: BoxDecoration(
                                    color: Color(0x19FFCD29),
                                    borderRadius: BorderRadius.circular(14)
                                ),
                                child:Text('Teratas', style: MyTextStyle.captionH5(color: MyColors.secondaryBase),)
                            ),
                            const SizedBox(height: 10,),
                            Container(
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/svgs/person_icon.svg', color: MyColors.grey200,),
                                  const SizedBox(width: 5,),
                                  Text(buyer,style: MyTextStyle.captionH5(color: MyColors.grey200),)
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/svgs/star_icon.svg', color: MyColors.secondaryBase,),
                                  const SizedBox(width: 5,),
                                  Text(rating,style: MyTextStyle.captionH5(color: MyColors.blackBase),)
                                ],
                              ),
                            ),
                            const SizedBox(height: 8,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                Container(
                                  child: Row(
                                    children: [
                                      SvgPicture.asset('assets/svgs/money_icon.svg', color: MyColors.primaryBase,),
                                      const SizedBox(width: 5,),
                                      Text(currencyFormater.format(price).toString().replaceAll(RegExp(r',00$'), ''),style: MyTextStyle.captionH5(color: MyColors.primaryBase),)
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
