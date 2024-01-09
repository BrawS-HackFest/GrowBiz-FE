import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:hackfest_mobile/styles/my_text.dart';
class CardWaitingPayment extends StatelessWidget {
  const CardWaitingPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22),
      child: Container(
          width: double.infinity,
          height: 255,
          padding:const  EdgeInsets.all(11),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x549B9B9B),
                blurRadius: 7,
                offset: Offset(0, 2),
                spreadRadius: 0,
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 167,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image:AssetImage('assets/images/popular1.png'),
                      fit: BoxFit.cover
                  ),
                ),
                child: Stack(
                  children: [
                    Container(
                      width:225,
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(16)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset('assets/svgs/warning_icon.svg',color: Color(0xFFFF0000),),
                          Text('Segera Lakukan Pembayaran', style: MyTextStyle.captionH5(color:  Color(0xFFFF0000)),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 8,),
              Text('Menjadikan Hobi Sebagai Penghasilan', style: MyTextStyle.judulH5(color: MyColors.blackBase),),
              const SizedBox(height: 7,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Text('Sisa waktu', style: MyTextStyle.judulH5(color: MyColors.grey200),),
                        const SizedBox(width: 3,),
                        Text('02 : 52 : 30', style: MyTextStyle.judulH5(color: MyColors.primaryBase),),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: MyColors.primaryBase
                    ),
                    child: Text('Detail', style: MyTextStyle.captionH5(color: MyColors.whiteBase),),
                  )

                ],
              )
            ],
          )
      ),
    );
  }
}
