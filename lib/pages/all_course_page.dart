import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:hackfest_mobile/styles/my_text.dart';
import 'package:hackfest_mobile/widgets/card_detail_course.dart';
import 'package:hackfest_mobile/widgets/my_textfield.dart';

class AllCoursePage extends StatelessWidget {
  AllCoursePage({super.key});
  TextEditingController searchCourse = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kursus', style: MyTextStyle.judulH5(color: MyColors.blackBase),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Semua', style: MyTextStyle.judulH4(color: MyColors.blackBase),),
              Text('Rekomendasi', style: MyTextStyle.judulH4(color: MyColors.blackBase),),
              Text('Teratas', style: MyTextStyle.judulH4(color: MyColors.blackBase),),
            ],
          ),
          Padding(
              padding: EdgeInsets.all(22),
            child: Column(
              children: [
                const SizedBox(height: 15,),
                MyTextField(
                    hint: 'Cari yang anda inginkan',
                    controller:searchCourse ,
                    icon: Icons.search
                ),
                const SizedBox(height: 15,),
                CardDetailCourse(),
              ],
            ),
          )
        ],
      ),

    );
  }
}
