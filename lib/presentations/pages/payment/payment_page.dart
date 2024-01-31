import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:GrowBiz/bloc/auth/auth_bloc.dart';
import 'package:GrowBiz/bloc/payment/payment_bloc.dart';
import 'package:GrowBiz/presentations/pages/payment/detail_payment_page.dart';
import 'package:GrowBiz/shared/formatters.dart';
import 'package:GrowBiz/styles/my_colors.dart';
import 'package:GrowBiz/styles/my_text.dart';
import 'package:GrowBiz/presentations/widgets/button_payment.dart';
import 'package:GrowBiz/presentations/widgets/card_detail_course_payment.dart';
import 'package:GrowBiz/presentations/widgets/my_button.dart';
import 'package:GrowBiz/presentations/widgets/my_snackBar.dart';

class PaymentPage extends StatefulWidget {
  PaymentPage({super.key, required this.title, required this.rating, required this.buyer, required this.price, required this.image,required this.courseId});
  int courseId;
  String title;
  String rating;
  String buyer;
  int price;
  String image;

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String _selectePayment = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<PaymentBloc, PaymentState>(
        listener: (context, state) {
          if(state is PaymentFailed){
            return mySnackBar(context, state.error);
          }
          if(state is PaymentSucces){
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) {
                return DetailPaymentPage(
                  invCode: state.invCode,
                  amount: Formatters().currency(state.amount),
                  method: state.method,);
              },
            ));
          }
        },
        builder: (context, state) {
          return Stack(
              children: [
                Container(
                  width: double.infinity,
                  color: MyColors.primaryBase,
                  height: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: MyColors.whiteBase,
                          )),
                      const Expanded(child: SizedBox()),
                      Text(
                        'Detail Pembayaran',
                        style: MyTextStyle.judulH5(color: MyColors.whiteBase),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      const Expanded(child: SizedBox()),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 170),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                      color: MyColors.whiteBase),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CardDetailCoursePayment(
                        title: widget.title,
                        price: widget.price,
                        image: widget.image,
                        buyer: widget.buyer,
                        rating: widget.rating,
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        child: Text(
                          'Metode',
                          style: MyTextStyle.buttonH3(color: MyColors.blackBase),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ButtonPayment(
                        icon: 'bca.png',
                        bankName: 'Bank BCA',
                        selectedPayment: _selectePayment,
                        payment: "bca",
                        onTap: () {
                          setState(() {
                            _selectePayment='bca';
                          });
                        },
                      ),
                      ButtonPayment(
                          icon: 'bri.png',
                          bankName: 'Bank BRI',
                          selectedPayment: _selectePayment,
                          payment: "bri",
                          onTap: () {
                            setState(() {
                              _selectePayment='bri';
                            });
                          }),
                      ButtonPayment(
                          icon: 'bni.png',
                          bankName: 'Bank BNI',
                          selectedPayment: _selectePayment,
                          payment: "bni",
                          onTap: () {
                            setState(() {
                              _selectePayment='bni';
                            });
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        child: Text(
                          'Pembayaran',
                          style: MyTextStyle.buttonH3(color: MyColors.blackBase),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: MyTextStyle.captionH5(color: MyColors.blackBase),
                            ),
                            Text(
                              Formatters().currency(widget.price),
                              style: MyTextStyle.captionH5(color: MyColors.blackBase),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Metode',
                              style: MyTextStyle.captionH5(color: MyColors.blackBase),
                            ),
                            Container(
                              child: _selectePayment=='' ? Text('') : Row(
                                children: [
                                  Image.asset(
                                    'assets/images/$_selectePayment.png',
                                    width: 50,
                                    height: 15,
                                  ),
                                  Text(
                                    ' - Bank ${_selectePayment.toUpperCase()}',
                                    style: MyTextStyle.captionH5(
                                        color: MyColors.blackBase),
                                  ),
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
                            child: MyButton(
                                text: (state is PaymentLoading) ? 'Loading...' : 'Bayar',
                                color: MyColors.primaryBase,
                                onPressed: () {
                                  if(_selectePayment==""){
                                    mySnackBar(context, 'Silahkan pilih metode pembayaran anda!');
                                  }else{
                                    String token = '${(context.read<AuthBloc>().state as AuthSuccess).token}';
                                    token = token.replaceAll('\n','');
                                    print('token from payment: $token');
                                    print('amount ${widget.price}');
                                    print('courseId:  ${widget.courseId}');
                                    print('method: ${_selectePayment}');
                                    context.read<PaymentBloc>().add(PaymentRequest(
                                        token: token,
                                        amount: widget.price,
                                        courseId: widget.courseId,
                                        method: _selectePayment)
                                    );
                                  }
                                })),
                      ),
                      const Spacer(),
                    ],
                  ),
                )
              ],
            );
        },
      ),
    );
  }
}
