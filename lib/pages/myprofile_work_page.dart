import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackfest_mobile/pages/edit_myprofile_work_page.dart';
import 'package:hackfest_mobile/pages/myprofile_work_desc_section_page.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:hackfest_mobile/styles/my_text.dart';

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
            isDescriptionSelected ? MyProfileWorkDescSectionPage() :
            Text('Postingan')
            ,


          ],
        ),
      ),
      floatingActionButton: Container(
        height: 38,
        decoration: BoxDecoration(),
        child: FloatingActionButton.extended(
            onPressed: (){
             Navigator.of(context).push(MaterialPageRoute(builder: (context) {
               return EditMyProfileWorkPage();
             },));
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            backgroundColor: MyColors.primaryBase,
            elevation: 0,
            label: Text('Ubah', style: MyTextStyle.captionH5(color: MyColors.whiteBase),),
            icon: SvgPicture.asset('assets/svgs/edit_icon.svg'),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

        ),
      ),
    );
  }
}
