import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackfest_mobile/pages/detail_work_page.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:hackfest_mobile/styles/my_text.dart';
import 'package:hackfest_mobile/widgets/card_work.dart';
import 'package:hackfest_mobile/widgets/my_textfield.dart';
import 'package:hackfest_mobile/widgets/navigation_top.dart';
import 'package:hackfest_mobile/widgets/scrollbehavior.dart';

class WorkPage extends StatefulWidget {
  WorkPage({super.key});

  @override
  State<WorkPage> createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  List<String> location = ['Jabodetabek', 'Jawa Timur', 'DI Yogyakarta', 'DKI Jakarta', 'Jawa Barat', 'Jawa Tengah', 'Banten', 'Bali', 'Sulawesi Selatan', 'Kalimantan Selatan', 'Lampung', 'Sumatera Utara', 'Riau', 'Jambi', 'Kalimantan Timur', 'Kalimantan Barat', 'Sumatera Utara', 'Kepulauan Riau' ];
  int _currentPageIndex = 0;
  TextEditingController searchController = TextEditingController();

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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 250,
                      child: MyTextField(hint: 'Cari kategori pekerjaan', controller:searchController , icon: Icons.search)),
                  Builder(
                    builder: (context) {
                      return GestureDetector(
                        onTap: (){
                          Scaffold.of(context).openEndDrawer();
                        },
                        child: Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SvgPicture.asset('assets/svgs/filter_icon.svg', width: 24,),
                              const SizedBox(width: 3,),
                              Text('Filter',style: TextStyle(fontSize: 11, color: MyColors.primaryBase),)
                            ],
                          ),
                        ),
                      );
                    }
                  ),

                ],
              ),
            ),
            const SizedBox(height: 18,),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.primaryBase,
                        elevation: 0,
                        foregroundColor: MyColors.whiteBase,
                          visualDensity: VisualDensity(horizontal: VisualDensity.minimumDensity,vertical: -1)
                      ),
                      child: Text('Semua',style: TextStyle(fontSize: 12), ),
                  ),
                  ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.primaryBase,
                        elevation: 0,
                        foregroundColor: MyColors.whiteBase,
                        visualDensity: VisualDensity(horizontal: VisualDensity.minimumDensity,vertical: -1)
                    ),
                    child: Text('Rekomendasi',style: TextStyle(fontSize: 12), )
                  ),
                  ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.primaryBase,
                          elevation: 0,
                          foregroundColor: MyColors.whiteBase,
                          visualDensity: VisualDensity(horizontal: VisualDensity.minimumDensity,vertical: -1)
                      ),
                      child: Text('Teratas', style: TextStyle(fontSize: 12),)
                  ),

                ],
              ),
            ),
            const SizedBox(height: 20,),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 22),
                child: ScrollConfiguration(
                  behavior: NoGlowScrollBehavior(),
                  child: ListView.separated(itemBuilder: (context, index) {
                    return CardWork(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                          return DetailWorkPage();
                        },));
                      },
                    );
                  }, separatorBuilder: (context, index) {
                    return const SizedBox(height: 15,);
                  }, itemCount: 7),
                ),
              ),
            )


          ],
        ),
      ),
    );
  }
}
