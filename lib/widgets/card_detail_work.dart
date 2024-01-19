import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:hackfest_mobile/styles/my_text.dart';
class CardDetailWork extends StatelessWidget {
  CardDetailWork({super.key, required this.name, required this.work});
  String name;
  String work;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 35,),
        Container(
          width: 44,
          height: 44,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              shape: BoxShape.circle
          ),
          child: Image.asset('assets/images/profile_hackfest.png', fit: BoxFit.cover,),
        ),
        const SizedBox(height: 10,),
        Text(work, style: MyTextStyle.buttonH3(color: MyColors.blackBase),),
        const SizedBox(height: 5,),
        Text(name, style: MyTextStyle.captionH5(color: MyColors.greyBase),),
        const SizedBox(height: 9,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Row(
                children: [
                  SvgPicture.asset('assets/svgs/location_icon.svg'),
                  const SizedBox(width: 3,),
                  Text('Jakarta Selatan',style: MyTextStyle.captionH5(color: MyColors.grey200),)
                ],
              ),
            ),
            const SizedBox(width: 16,),
            Container(
              child: Row(
                children: [
                  SvgPicture.asset('assets/svgs/star_icon.svg'),
                  const SizedBox(width: 3,),
                  Text('4.6',style: MyTextStyle.captionH5(color: MyColors.grey200),)
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 22,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(left: 12, top: 9, bottom: 9, right: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: MyColors.neutra100
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    padding: EdgeInsets.all(4),
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: MyColors.grey100
                    ),
                    child: SvgPicture.asset('assets/svgs/money_icon.svg', fit: BoxFit.cover,color: MyColors.grey200,),
                  ),
                  const SizedBox(width: 9,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Gaji/bln', style: MyTextStyle.judulH5(color: MyColors.grey200),),
                      Text('Rp.2.000.000', style: MyTextStyle.judulH5(color: MyColors.greyBase),),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(width: 10,),
            Container(
              padding: EdgeInsets.only(left: 12, top: 9, bottom: 9, right: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: MyColors.neutra100
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    padding: EdgeInsets.all(4),
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: MyColors.grey100
                    ),
                    child: SvgPicture.asset('assets/svgs/money_icon.svg', fit: BoxFit.cover,color: MyColors.grey200,),
                  ),
                  const SizedBox(width: 9,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Model Kerja', style: MyTextStyle.judulH5(color: MyColors.grey200),),
                      Text('Office', style: MyTextStyle.judulH5(color: MyColors.greyBase),),
                    ],
                  )
                ],
              ),
            )
          ],
        )

      ],
    );
  }
}
