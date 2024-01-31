import 'package:flutter/material.dart';
import 'package:GrowBiz/presentations/pages/login/login_page.dart';
import 'package:GrowBiz/presentations/pages/register/signup_page.dart';
import 'package:GrowBiz/styles/my_colors.dart';
import 'package:GrowBiz/presentations/widgets/my_button.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary400,
      body: Stack(
        children: [
          Positioned(
            top: 10,
            right: 0,
              child:Transform.rotate(
                angle: 8 *(3.14/180),
                child: Image.asset('assets/images/object_bg.png', height: 460,
                ),
              )
          ),
          Padding(
              padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Spacer(),
                Text('Temukan peluang dan kembangkan potensi Anda',
                  style: TextStyle(
                      color: MyColors.whiteBase,
                      fontWeight: FontWeight.w600,
                      fontSize: 24,

                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15,),
                Text('Dapatkan akses bootcamp UMKM yang inovatif dan layanan perekrutan yang membuka pintu karier di berbagai sektor UMKM.',
                  style: TextStyle(
                    color: MyColors.primary200,
                    fontSize: 13,

                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 22,),
                SizedBox(
                  width: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 11,
                        height: 11,
                        decoration: BoxDecoration(
                          color: MyColors.primary200,
                          shape: BoxShape.circle
                        ),
                      ),
                      Container(
                        width: 11,
                        height: 11,
                        decoration: BoxDecoration(
                          color: MyColors.primary200,
                            shape: BoxShape.circle
                        ),
                      ),
                      Container(
                        width: 11,
                        height: 11,
                        decoration: BoxDecoration(
                          color: MyColors.secondaryBase,
                            shape: BoxShape.circle
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Stack(
                  children: [
                    Padding(
                        child: Image.asset('assets/images/personSplash.png'),
                      padding: EdgeInsets.only(bottom: 52),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: MyButton(
                          text: 'Masuk',
                          color: MyColors.second200,
                          onPressed: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                              return LoginPage();
                            }));
                          }
                      )
                    )
                  ],
                ),
                const SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Belum memiliki akun? ',
                      style: TextStyle( color: MyColors.whiteBase, fontSize: 13),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                          return SignUpPage();
                        }));
                      },
                      child: Text('Daftar',
                          style: TextStyle( color: MyColors.secondaryBase, fontSize: 13, fontWeight: FontWeight.w500)
                      ),
                    )

                  ],
                ),
                const Spacer(),

              ],
            ),
          )
        ],
      )
    );
  }
}
