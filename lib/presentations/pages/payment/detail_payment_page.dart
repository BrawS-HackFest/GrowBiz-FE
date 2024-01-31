import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:GrowBiz/presentations/pages/main_page.dart';
import 'package:GrowBiz/styles/my_colors.dart';
import 'package:GrowBiz/styles/my_text.dart';
import 'package:GrowBiz/presentations/widgets/my_button.dart';
import 'package:GrowBiz/presentations/widgets/my_snackBar.dart';

class DetailPaymentPage extends StatelessWidget {
    DetailPaymentPage({super.key, required this.invCode, required this.method, required this.amount});
    String invCode;
    String method;
    String amount;

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
                  Text(amount, style: MyTextStyle.captionH5(color: MyColors.primaryBase),)
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
                      Image.asset('assets/images/${method == 'bri' ? 'bri' : method =='bca' ? 'bca' : 'bni'}.png',width: 50, height: 15,),
                      const SizedBox(width: 10,),
                      Text('Bank ${method == 'bri' ? 'BRI' : method =='bca' ? 'BCA' : 'BNI'}', style: MyTextStyle.judulH4(color: MyColors.blackBase),)
                    ],
                  ),
                  const SizedBox(height: 18,),
                  Text('No. Rekening:',style: MyTextStyle.captionH5(color: MyColors.blackBase),),
                  const SizedBox(height: 10,),
                  Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text(invCode, style: MyTextStyle.judulH1(color: MyColors.primaryBase),),
                       GestureDetector(
                         onTap: (){
                           FlutterClipboard.copy(invCode);
                           mySnackBar(context, 'Virtual account number berhasil disalin');
                         },
                           child: Text('Salin', style: MyTextStyle.captionH5(color: MyColors.greyBase),)
                       )
                     ],
                  ),
                  const SizedBox(height: 16,),
                  Text('Silahkan melakukan pembayaran ke Virtual Account di atas.', style: MyTextStyle.captionH5(color: MyColors.grey200),),
                  const SizedBox(height: 16,),
                  Text('Hanya menerima dari Bank ${method == 'bri' ? 'BRI' : method =='bca' ? 'BCA' : 'BNI'}', style: MyTextStyle.captionH5(color: MyColors.primaryBase),),
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
                    Text('1. Pilih m-Transfer > ${method == 'bri' ? 'BRI' : method =='bca' ? 'BCA' : 'BNI'} Virtual Account', style: MyTextStyle.judulH5(color: MyColors.greyBase),),
                    const SizedBox(height: 10,),
                    Text('2. Masukkan Nomor Virtual Account diatas.', style: MyTextStyle.judulH5(color: MyColors.greyBase),),
                    const SizedBox(height: 10,),
                    Text('3. Pastikan nominal bayar yang tertera sesuai. Pilih OK.', style: MyTextStyle.judulH5(color: MyColors.greyBase),),
                    const SizedBox(height: 10,),
                    Text('4. Masukkan PIN m-${method == 'bri' ? 'BRI' : method =='bca' ? 'BCA' : 'BNI'} Anda dan pilih OK.', style: MyTextStyle.judulH5(color: MyColors.greyBase),),
                    const SizedBox(height: 10,),
                    Text('5. Transaksi berhasil. Jika transaksi gagal, lakukan pemesanan ulang.', style: MyTextStyle.judulH5(color: MyColors.greyBase),),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: MyButton(text: 'Ok', color: MyColors.primaryBase, onPressed: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
                          return MainPage();
                        },));
                      }),
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
