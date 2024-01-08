import 'package:flutter/material.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:hackfest_mobile/styles/my_text.dart';
class CardDetailCoursePayment extends StatelessWidget {
  const CardDetailCoursePayment({super.key});

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
                child: Image.asset('assets/images/popular1.png', fit: BoxFit.cover,),
              ),
              const SizedBox(width: 12,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Dasar Digital Marketing', style: MyTextStyle.judulH5(color: MyColors.blackBase),),
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
                            Container(
                              child: Row(
                                children: [
                                  Icon(Icons.person, color: MyColors.grey200,),
                                  Text('2.398',style: MyTextStyle.captionH5(color: MyColors.grey200),)
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
                                  Icon(Icons.star, color: MyColors.secondaryBase,),
                                  Text('4.9',style: MyTextStyle.captionH5(color: MyColors.blackBase),)
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Container(
                                  child: Row(
                                    children: [
                                      Icon(Icons.money, color: MyColors.primaryBase,),
                                      Text('Rp.50.000',style: MyTextStyle.captionH5(color: MyColors.primaryBase),)
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
