import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:hackfest_mobile/styles/my_text.dart';
import 'package:hackfest_mobile/widgets/my_button.dart';
class MyProfileWorkPage extends StatefulWidget {
  const MyProfileWorkPage({super.key});

  @override
  State<MyProfileWorkPage> createState() => _MyProfileWorkPageState();
}

class _MyProfileWorkPageState extends State<MyProfileWorkPage> {
  bool isDescriptionSelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 33),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: MyColors.neutra100,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          isDescriptionSelected = true;
                        });
                      },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        side: BorderSide.none,
                        backgroundColor: isDescriptionSelected
                            ? MyColors.whiteBase
                            : MyColors.neutra100,
                        foregroundColor: MyColors.greyBase,
                      ),
                      child: Text('Deskripsi',style: MyTextStyle.judulH5(color: Color(0xFF6B6C74)),),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          isDescriptionSelected = false;
                        });
                      },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        side: BorderSide.none,
                        backgroundColor: !isDescriptionSelected
                            ? MyColors.whiteBase
                            : MyColors.neutra100,
                        foregroundColor: MyColors.greyBase,
                      ),
                      child: Text('Postingan',style: MyTextStyle.judulH5(color: Color(0xFF6B6C74)),),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
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
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){},
          backgroundColor: MyColors.primaryBase,
          elevation: 0,
          child: Container(
            width: 98,
            height: 38,
            clipBehavior: Clip.hardEdge,
            child: Row(
              children: [
                SvgPicture.asset('assets/svgs/edit_icon.svg'),
                const SizedBox(width: 3,),
                Text('Ubah', style: MyTextStyle.captionH5(color: MyColors.whiteBase),)
              ],
            ),
          )
      ),
    );
  }
}
