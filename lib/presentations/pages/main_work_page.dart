import 'package:flutter/material.dart';
import 'package:GrowBiz/presentations/pages/workers/all_workers_page.dart';
import 'package:GrowBiz/presentations/pages/workers/myprofile_work_page.dart';
import 'package:GrowBiz/styles/my_colors.dart';
import 'package:GrowBiz/styles/my_text.dart';
import 'package:GrowBiz/presentations/widgets/navigation_top.dart';
import 'package:GrowBiz/presentations/widgets/scrollbehavior.dart';

class MainWorkPage extends StatefulWidget {
  MainWorkPage({super.key});

  @override
  State<MainWorkPage> createState() => _MainWorkPageState();
}

class _MainWorkPageState extends State<MainWorkPage> {
  List<String> location = ['Jabodetabek', 'Jawa Timur', 'DI Yogyakarta', 'DKI Jakarta', 'Jawa Barat', 'Jawa Tengah', 'Banten', 'Bali', 'Sulawesi Selatan', 'Kalimantan Selatan', 'Lampung', 'Sumatera Utara', 'Riau', 'Jambi', 'Kalimantan Timur', 'Kalimantan Barat', 'Sumatera Utara', 'Kepulauan Riau' ];
  int _currentPageIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child:Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50,),
              Text('Filter', style: MyTextStyle.judulH4(color: MyColors.blackBase),),
              const SizedBox(height: 30,),
              Text('Lokasi', style: MyTextStyle.judulH5(color: MyColors.blackBase),),
              GridView.builder(
                shrinkWrap: true,
                itemCount: location.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8, childAspectRatio: 130/30),
                itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFECECEC),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(child: Text(location[index], style: MyTextStyle.judulH6(color: MyColors.blackBase),)),
                );
              },),
              const SizedBox(height: 28,),
              Text('Jenis Kerja', style: MyTextStyle.judulH5(color: MyColors.blackBase),),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 130,
                    height: 30,
                    decoration: BoxDecoration(
                    color: Color(0xFFECECEC),
                    borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: Text('Office', style: MyTextStyle.judulH6(color: MyColors.blackBase),)),
                  ),
                  Container(
                    width: 130,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Color(0xFFECECEC),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: Text('Remote', style: MyTextStyle.judulH6(color: MyColors.blackBase),)),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 126,
                    child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: MyColors.whiteBase,
                        side: BorderSide(color: MyColors.primaryBase),
                      ),
                      child: Text('Atur Ulang', style: MyTextStyle.judulH5(color: MyColors.primaryBase),),
                    ),
                  ),
                  SizedBox(
                    width: 126,
                    child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: MyColors.primaryBase,
                      ),
                      child: Text('Pakai',style: MyTextStyle.judulH5(color: MyColors.whiteBase),),
                    ),
                  )

                ],
              ),
              const Spacer(),
            ],
          ),
        )
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 35,),
            Row(
              children: [
                NavigationTop(label: 'Cari Pekerja', selected: _currentPageIndex, id: 0),
                NavigationTop(label: 'Profil Saya', selected: _currentPageIndex, id: 1)
              ],
            ),
            const SizedBox(height: 20,),
            Expanded(
              child: PageView(
                controller: PageController(
                  initialPage: _currentPageIndex,
                  viewportFraction: 1,
                ),
                onPageChanged: (index) {
                  setState(() {
                    _currentPageIndex = index;
                  });
                },
                children: [
                  ScrollConfiguration(
                    behavior: NoGlowScrollBehavior(),
                    child: AllWorkersPage()
                  ),
                  ScrollConfiguration(
                    behavior: NoGlowScrollBehavior(),
                    child: MyProfileWorkPage()
                  ),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
