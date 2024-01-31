import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:GrowBiz/presentations/pages/workers/edit_myprofile_work_desc_page.dart';
import 'package:GrowBiz/presentations/pages/workers/edit_myprofile_work_post_page.dart';
import 'package:GrowBiz/presentations/widgets/myprofile_work_desc_section.dart';
import 'package:GrowBiz/styles/my_colors.dart';
import 'package:GrowBiz/styles/my_text.dart';
import 'package:GrowBiz/presentations/widgets/myprofile_work_post_section.dart';

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
            isDescriptionSelected ? MyProfileWorkDescSection() :
            MyProfileWorkPostSection()
            ,


          ],
        ),
      ),
      floatingActionButton: Container(
        height: 38,
        decoration: BoxDecoration(),
        child: FloatingActionButton.extended(
            onPressed: (){
              if(isDescriptionSelected){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return EditMyProfileWorkPage();
                },));
              }else{
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return EditMyProfileWorkPostPage();
                },));
              }
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            backgroundColor: MyColors.primaryBase,
            elevation: 0,
            label: Text(isDescriptionSelected ? 'Ubah' : 'Buat postingan', style: MyTextStyle.captionH5(color: MyColors.whiteBase),),
            icon: isDescriptionSelected ? SvgPicture.asset('assets/svgs/edit_icon.svg') : Icon(Icons.add, color: MyColors.whiteBase,),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

        ),
      ),
    );
  }
}
