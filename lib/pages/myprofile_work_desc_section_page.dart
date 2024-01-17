import 'package:flutter/material.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:hackfest_mobile/styles/my_text.dart';
class MyProfileWorkDescSectionPage extends StatelessWidget {
  const MyProfileWorkDescSectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Detail', style: MyTextStyle.buttonH3(color: MyColors.blackBase),),
        Text('Pegawai Toko Fashion', style: MyTextStyle.judulH5(color: MyColors.blackBase),),
        const SizedBox(height: 10,),
        Text('Gaji/bln', style: MyTextStyle.captionH5(color: MyColors.grey200),),
        Text('Rp.3.000.000', style: MyTextStyle.judulH5(color: MyColors.greyBase),),
        const SizedBox(height: 12,),
        Text('Model Kerja', style: MyTextStyle.captionH5(color: MyColors.grey200),),
        Text('Kantor', style: MyTextStyle.judulH5(color: MyColors.greyBase),),
        const SizedBox(height: 13,),
        Text('Tentang Saya', style: MyTextStyle.buttonH3(color: MyColors.blackBase),),
        Text('Saya berpengalaman dalam bekerja di bidang fashion. Sebagai anak muda, saya dapat mengetahui trend fashion yang kini ramai di kalangan remaja.', style: MyTextStyle.captionH5(color: MyColors.greyBase),textAlign: TextAlign.justify,),
        const SizedBox(height: 13,),
        Text('Skill', style: MyTextStyle.buttonH3(color: MyColors.blackBase),),
        ListView.separated(
          itemCount: 10,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              child: Row(
                children: [
                  Icon(Icons.circle_rounded, color: MyColors.primaryBase, size: 10),
                  const SizedBox(width: 5,),
                  Text('skill $index', style: MyTextStyle.judulH5(color: MyColors.blackBase),),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 5,);
          },
        ),
      ],
    );
  }
}
