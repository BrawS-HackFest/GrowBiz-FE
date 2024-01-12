import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackfest_mobile/pages/detail_mycourse.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:hackfest_mobile/styles/my_text.dart';
class ListContentCourse extends StatelessWidget {
  const ListContentCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Isi Kursus', style: MyTextStyle.judulH5(color: MyColors.blackBase),),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(26),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Pilihan Topik', style: TextStyle(fontSize: 13 ,fontWeight: FontWeight.w600),),
                Text('15 topik', style: MyTextStyle.captionH5(color: MyColors.blackBase),)
              ],
            ),
            const SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11.39),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x23295BFF),
                    blurRadius: 3.50,
                    offset: Offset(0, 3.50),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                        return DetailMyCourse();
                      },));
                    },
                    child: Container(
                      padding:EdgeInsets.symmetric(horizontal: 14, vertical: 11),
                      decoration:BoxDecoration(
                        shape: BoxShape.circle,
                        color: MyColors.primaryBase
                      ),
                      child: Center(child: SvgPicture.asset('assets/svgs/play_icon.svg')),
                    ),
                  ),
                  const SizedBox(width: 9,),
                  Text('Mulai Bisnis Kopi' ,style: MyTextStyle.captionH5(color: MyColors.blackBase),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
