import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:GrowBiz/bloc/auth/auth_bloc.dart';
import 'package:GrowBiz/presentations/pages/home/home_page.dart';
import 'package:GrowBiz/presentations/pages/main_work_page.dart';
import 'package:GrowBiz/presentations/pages/mycourses/mycourse_page.dart';
import 'package:GrowBiz/presentations/pages/users/myprofile_page.dart';
import 'package:GrowBiz/styles/my_colors.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _curIndex = 0;
  late String token;

  @override
  void initState() {
    super.initState();
    token = (context.read<AuthBloc>().state as AuthSuccess).token;
  }

  void _updateSelected(int index) {
    setState(() {
      _curIndex = index;
    });
  }

  late List<Widget> pages;

  @override
  Widget build(BuildContext context) {
    // Initialize pages here
    pages = [
      HomePage(),
      MyCoursePage(token: token),
      MainWorkPage(),
      MyProfilePage(),
    ];

    return Scaffold(
      body: pages[_curIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _curIndex,
        onTap: _updateSelected,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: MyColors.primaryBase,
        unselectedItemColor: MyColors.grey200,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svgs/home_icon.svg',
              color: _curIndex == 0 ? MyColors.primaryBase : MyColors.grey200,
            ),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svgs/mycourse_icon.svg',
              color: _curIndex == 1 ? MyColors.primaryBase : MyColors.grey200,
            ),
            label: 'Kursus Saya',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svgs/work_icon.svg',
              color: _curIndex == 2 ? MyColors.primaryBase : MyColors.grey200,
            ),
            label: 'Pekerjaan',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svgs/profile_icon.svg',
              color: _curIndex == 3 ? MyColors.primaryBase : MyColors.grey200,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}


