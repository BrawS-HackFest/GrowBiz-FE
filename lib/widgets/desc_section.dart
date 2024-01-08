import 'package:flutter/material.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:hackfest_mobile/styles/my_text.dart';
class DescSection extends StatelessWidget {
  const DescSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Text(
              'Melalui program Dasar Digital Msrketing, kami ingin membuka kesempatan untuk siapa saja yang memulai karir di industri digital. Oleh karena itu, untuk mengikuti program ini, peserta program tidak harus memiliki background marketing ataupun digital marketing sebelumnya.',
              style: MyTextStyle.captionH5(color: MyColors.greyBase),
              textAlign: TextAlign.justify,
            ),
          ),
          const SizedBox(height: 15,),
          Align(
            alignment: Alignment.centerLeft,
            child:Text('Bab',style: MyTextStyle.buttonH3(color: MyColors.blackBase),),
          ),
          Container(
            child: Row(
              children: [
                Icon(Icons.circle_rounded, color: MyColors.primaryBase, size: 10),
                const SizedBox(width: 5,),
                Text('Trailer', style: MyTextStyle.judulH5(color: MyColors.blackBase),),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
