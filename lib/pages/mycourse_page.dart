import 'package:flutter/material.dart';
import 'package:hackfest_mobile/widgets/card_mycourse.dart';
import 'package:hackfest_mobile/widgets/card_waiting_payment.dart';
import 'package:hackfest_mobile/widgets/my_textfield.dart';
import 'package:hackfest_mobile/widgets/navigation_top.dart';
import 'package:hackfest_mobile/widgets/scrollbehavior.dart';

class MyCoursePage extends StatefulWidget {
  MyCoursePage({super.key});

  @override
  State<MyCoursePage> createState() => _MyCoursePageState();
}

class _MyCoursePageState extends State<MyCoursePage> {
  TextEditingController searchController = TextEditingController();

  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NavigationTop(
                  label: 'Kursus Saya',
                  id: 0,
                  selected: _currentPageIndex, // Adjusted to use _currentPageIndex
                ),
                NavigationTop(
                  label: 'Belum Bayar',
                  id: 1,
                  selected: _currentPageIndex, // Adjusted to use _currentPageIndex
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: MyTextField(hint: 'Cari kursus anda', controller: searchController, icon: Icons.search),
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
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return CardMyCourse();
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 10,);
                      },
                      itemCount: 3,
                    ),
                  ),
                  ScrollConfiguration(
                    behavior: NoGlowScrollBehavior(),
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return CardWaitingPayment();
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 10,);
                      },
                      itemCount: 3,
                    ),
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
