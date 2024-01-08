import 'package:flutter/material.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:hackfest_mobile/styles/my_text.dart';
import 'package:hackfest_mobile/widgets/my_button.dart';

class DetailPaymentPage extends StatelessWidget {
  const DetailPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.neutra100,
      appBar: AppBar(
        title: Text('Pembayaran', style: MyTextStyle.judulH5(color: MyColors.blackBase),),
        centerTitle: true,
        toolbarHeight: 90,
        backgroundColor: MyColors.whiteBase,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: MyColors.whiteBase,
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Bayar', style: MyTextStyle.captionH5(color: MyColors.blackBase),),
                Text('Rp.50.000', style: MyTextStyle.captionH5(color: MyColors.primaryBase),)
              ],
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            color: MyColors.whiteBase,
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset('assets/images/bca.png',width: 50, height: 15,),
                    const SizedBox(width: 10,),
                    Text('Bank BCA', style: MyTextStyle.judulH4(color: MyColors.blackBase),)
                  ],
                ),
                const SizedBox(height: 18,),
                Text('No. Rekening:',style: MyTextStyle.captionH5(color: MyColors.blackBase),),
                const SizedBox(height: 10,),
                Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text('2333 2454 1109 231', style: MyTextStyle.judulH1(color: MyColors.primaryBase),),
                     Text('Salin', style: MyTextStyle.captionH5(color: MyColors.greyBase),)
                   ],
                ),
                const SizedBox(height: 16,),
                Text('Silahkan melakukan pembayaran ke Virtual Account di atas.', style: MyTextStyle.captionH5(color: MyColors.grey200),),
                const SizedBox(height: 16,),
                Text('Hanya menerima dari Bank BCA', style: MyTextStyle.captionH5(color: MyColors.primaryBase),),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: MyColors.whiteBase,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Petunjuk Pembayaran', style: MyTextStyle.judulH5(color: MyColors.blackBase),),
                  const SizedBox(height: 10,),
                  Text('1. Pilih m-Transfer > BCA Virtual Account', style: MyTextStyle.judulH5(color: MyColors.greyBase),),
                  const SizedBox(height: 10,),
                  Text('2. Masukkan Nomor Virtual Account diatas.', style: MyTextStyle.judulH5(color: MyColors.greyBase),),
                  const SizedBox(height: 10,),
                  Text('3. Pastikan nominal bayar yang tertera sesuai. Pilih OK.', style: MyTextStyle.judulH5(color: MyColors.greyBase),),
                  const SizedBox(height: 10,),
                  Text('4. Masukkan PIN m-BCA Anda dan pilih OK.', style: MyTextStyle.judulH5(color: MyColors.greyBase),),
                  const SizedBox(height: 10,),
                  Text('5. Transaksi berhasil. Jika transaksi gagal, lakukan pemesanan ulang.', style: MyTextStyle.judulH5(color: MyColors.greyBase),),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: MyButton(text: 'Ok', color: MyColors.primaryBase, onPressed: (){}),
                  ),
                  const Spacer()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
