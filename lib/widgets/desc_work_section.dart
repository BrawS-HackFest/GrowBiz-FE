import 'package:flutter/material.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:hackfest_mobile/styles/my_text.dart';
class DescWorkSection extends StatelessWidget {
  const DescWorkSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Tentang Saya', style: MyTextStyle.buttonH3(color: MyColors.blackBase),),
        const SizedBox(height: 3,),
        Text('Saya saat ini berumur 30 tahun dan sudah memiliki pengalaman bekerja pada restoran makanan. Saya sangat menyukai pekerjaan saya di bidang ini.', style: MyTextStyle.captionH5(color: MyColors.greyBase), textAlign: TextAlign.justify),
        const SizedBox(height: 15,),
        Text('Skill', style: MyTextStyle.buttonH3(color: MyColors.blackBase),),
        SizedBox(
          height: 100,
          child: ListView.separated(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                child: Row(
                  children: [
                    Icon(Icons.circle_rounded, color: MyColors.primaryBase, size: 10),
                    const SizedBox(width: 5,),
                    Text('bab $index', style: MyTextStyle.judulH5(color: MyColors.blackBase),),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 5,);
            },
          ),
        ),
      ],
    );
  }
}
