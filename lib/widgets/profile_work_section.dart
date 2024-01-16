import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:hackfest_mobile/styles/my_text.dart';
class ProfileWorkSection extends StatelessWidget {
  const ProfileWorkSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      clipBehavior: Clip.hardEdge,
      itemCount: 6,
      itemBuilder: (context, index) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 12, top: 9, bottom: 9, right: 15),
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 30,
                height: 30,
                padding: EdgeInsets.all(4),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: MyColors.grey100
                ),
                child: SvgPicture.asset('assets/svgs/company_icon.svg'),
              ),
              const SizedBox(width: 9,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Pegawai Restoran Begawan', style: MyTextStyle.judulH5(color: MyColors.blackBase),),
                  Text('Waiters', style: MyTextStyle.captionH5(color: MyColors.grey300),),
                  Text('2014 - 2019', style: MyTextStyle.captionH5(color: MyColors.grey300),),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
