import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:hackfest_mobile/styles/my_text.dart';
class CardWork extends StatelessWidget {
  CardWork({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(left: 12,right: 12, top: 8, bottom: 16),
        width: double.infinity,
        decoration: ShapeDecoration(
            color: MyColors.whiteBase,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x0A000000),
                blurRadius: 7,
                offset: Offset(0, 2),
                spreadRadius: 2,
              )
            ]
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width:44,
                  height: 44,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle
                  ),
                  child: Image.asset('assets/images/profile_hackfest.png', fit: BoxFit.cover,),
                ),
                const SizedBox(width: 12,),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Content Writer', style: MyTextStyle.buttonH3(color: MyColors.blackBase),),
                          const SizedBox(height: 5,),
                          Text('Aulia Fawwaz', style: MyTextStyle.captionH5(color: MyColors.greyBase),),
                          const SizedBox(height: 5,),
                          Container(
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/svgs/location_icon.svg'),
                                const SizedBox(width: 3,),
                                Text('Jakarta Barat', style: MyTextStyle.captionH5(color: MyColors.grey200),),
                              ],
                            ),
                          )
                        ],
                      ),
                      Icon(Icons.bookmark, color: MyColors.primaryBase,)
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height:22,),
            Row(
              children: [
                Container(
                  padding:const EdgeInsets.symmetric(horizontal: 10, vertical: 3.5),
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0x215358E1),
                  ),
                  child: Text('Rp.1.000.000/bln',style: MyTextStyle.captionH5(color: MyColors.primaryBase),),
                ),
                const SizedBox(width:7,),
                Container(
                  padding:const EdgeInsets.symmetric(horizontal: 10, vertical: 3.5),
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0x215358E1),
                  ),
                  child: Text('Remote',style: MyTextStyle.captionH5(color: MyColors.primaryBase),),
                ),
                const SizedBox(width:7,),
                Container(
                    padding:const EdgeInsets.symmetric(horizontal: 10, vertical: 3.5),
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0x215358E1),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/svgs/star_icon.svg'),
                        Text('4.8',style: MyTextStyle.captionH5(color: MyColors.primaryBase),),
                      ],
                    )
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}
