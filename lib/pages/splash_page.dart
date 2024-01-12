import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackfest_mobile/pages/landing_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const LandingPage();
      },));
    });
    return Scaffold(
      body: Center(
        child: SvgPicture.asset('assets/svgs/growbiz_logo.svg', width: 118,),
      ),
    );
  }
}
