import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackfest_mobile/pages/home_page.dart';
import 'package:hackfest_mobile/pages/main_work_page.dart';
import 'package:hackfest_mobile/pages/mycourse_page.dart';
import 'package:hackfest_mobile/pages/myprofile_page.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _curIndex = 0;

  void _updateSelected(int index){
    setState(() {
      _curIndex = index;
    });
  }

  List pages =[
    HomePage(),
    MyCoursePage(),
    MainWorkPage(),
    MyProfilePage()
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_curIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _curIndex,
        onTap:_updateSelected ,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: MyColors.primaryBase,
        unselectedItemColor: MyColors.grey200,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/svgs/home_icon.svg',color: _curIndex==0 ? MyColors.primaryBase : MyColors.grey200, ), label: 'Beranda'),
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/svgs/mycourse_icon.svg',color: _curIndex==1 ? MyColors.primaryBase : MyColors.grey200,), label: 'Kursus Saya'),
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/svgs/work_icon.svg',color: _curIndex==2 ? MyColors.primaryBase : MyColors.grey200,), label: 'Pekerjaan'),
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/svgs/profile_icon.svg', color: _curIndex==3 ? MyColors.primaryBase : MyColors.grey200,), label: 'Profile'),
        ],
      ),
    );
  }
}

