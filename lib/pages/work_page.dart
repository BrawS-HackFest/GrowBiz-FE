import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  int _currentPageIndex = 0;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SvgPicture.asset('assets/svgs/filter_icon.svg', width: 24,),
                        const SizedBox(width: 3,),
                        Text('Filter',style: TextStyle(fontSize: 11, color: MyColors.primaryBase),)
                      ],
                    ),
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
                    return CardWork();
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
