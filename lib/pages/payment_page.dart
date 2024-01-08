import 'package:flutter/material.dart';
import 'package:hackfest_mobile/pages/detail_payment_page.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:hackfest_mobile/styles/my_text.dart';
import 'package:hackfest_mobile/widgets/card_detail_course_payment.dart';
import 'package:hackfest_mobile/widgets/my_button.dart';
class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            color: MyColors.primaryBase,
            height: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back, color: MyColors.whiteBase,)
                ),
                const Expanded(child: SizedBox()),
                Text('Detail Pembayaran', style: MyTextStyle.judulH5(color: MyColors.whiteBase),),
                const SizedBox(width: 50,),
                const Expanded(child: SizedBox()),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 170),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              color: MyColors.whiteBase
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CardDetailCoursePayment(),
                const SizedBox(height:35,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Text('Metode', style: MyTextStyle.buttonH3(color: MyColors.blackBase),),
                ),
                const SizedBox(height:20,),
                Container(
                  width: double.infinity,
                  color:MyColors.neutral,
                  padding: EdgeInsets.symmetric(horizontal: 26, vertical: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/images/bca.png', width: 50, height: 15,),
                      Text('Bank BCA', style: MyTextStyle.captionH5(color: MyColors.blackBase),)
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  color:MyColors.neutral,
                  padding: EdgeInsets.symmetric(horizontal: 26, vertical: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/images/bri.png', width: 67, height: 15,),
                      Text('Bank BRI', style: MyTextStyle.captionH5(color: MyColors.blackBase),)
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  color:MyColors.neutral,
                  padding: EdgeInsets.symmetric(horizontal: 26, vertical: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/images/bni.png', width: 50, height: 15,),
                      Text('Bank BNI', style: MyTextStyle.captionH5(color: MyColors.blackBase),)
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Text('Pembayaran', style: MyTextStyle.buttonH3(color: MyColors.blackBase),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total', style: MyTextStyle.captionH5(color: MyColors.blackBase),),
                      Text('Rp.50.000',style: MyTextStyle.captionH5(color: MyColors.blackBase),)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Metode', style: MyTextStyle.captionH5(color: MyColors.blackBase),),
                      Container(
                        child: Row(
                          children: [
                            Image.asset('assets/images/bca.png', width: 50, height: 15,),
                            Text(' - Bank BCA',style: MyTextStyle.captionH5(color: MyColors.blackBase),),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22),
                  child: SizedBox(
                    width: double.infinity,
                      child: MyButton(text: 'Bayar', color: MyColors.primaryBase, onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                          return DetailPaymentPage();
                        },));
                      })
                  ),
                ),
                const Spacer(),


              ],
            ),
          )
        ],
      ),
    );
  }
}
