import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:hackfest_mobile/styles/my_text.dart';
import 'package:hackfest_mobile/widgets/card_mycourse.dart';
import 'package:hackfest_mobile/widgets/card_waiting_payment.dart';
import 'package:hackfest_mobile/widgets/my_textfield.dart';
class MyCoursePage extends StatelessWidget {
  MyCoursePage({super.key});

  TextEditingController searchController = TextEditingController();

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
                Text('Kursus Saya', style: MyTextStyle.judulH4(color: MyColors.blackBase),),
                Text('Belum Bayar', style: MyTextStyle.judulH4(color: MyColors.blackBase),),
              ],
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
                child: MyTextField(hint: 'Cari kursus anda', controller:searchController , icon: Icons.search)
            ),
            const SizedBox(height: 20,),
            CardMyCourse(),
            CardWaitingPayment()

            
          ],
        ),
      ),
    );
  }
}
