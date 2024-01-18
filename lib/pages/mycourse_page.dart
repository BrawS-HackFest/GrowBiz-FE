import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackfest_mobile/bloc/auth/auth_bloc.dart';
import 'package:hackfest_mobile/bloc/payment/payment_bloc.dart';
import 'package:hackfest_mobile/pages/detail_payment_page.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:hackfest_mobile/styles/my_text.dart';
import 'package:hackfest_mobile/widgets/card_mycourse.dart';
import 'package:hackfest_mobile/widgets/card_waiting_payment.dart';
import 'package:hackfest_mobile/widgets/my_textfield.dart';
import 'package:hackfest_mobile/widgets/navigation_top.dart';
import 'package:hackfest_mobile/widgets/scrollbehavior.dart';
import 'package:hackfest_mobile/widgets/skeletons/skeletons_card_waiting_payment.dart';
import 'package:intl/intl.dart';

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
    String token='${(context.read<AuthBloc>().state as AuthSuccess).token}';
    token = token.replaceAll('\n', '');

    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<PaymentBloc, PaymentState>(
        listener: (context, state) {
          if(state is DetailPaymentUserSuccess){
            final paymentData = state.paymentModel;
            final currencyFormater = NumberFormat.currency(locale: 'id_ID',symbol: 'Rp.');
            final harga = currencyFormater.format(paymentData.amount);

            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailPaymentPage(
                  invCode: paymentData.invCode,
                  method: paymentData.method,
                  amount: harga.toString().replaceAll(',00', ''),
              );
            },));
          }
        },
        builder: (context, state) {
          return Column(
                children: [
                  const SizedBox(height: 25,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NavigationTop(
                        label: 'Kursus Saya',
                        id: 0,
                        selected: _currentPageIndex,
                        onTap: (){
                          setState(() {
                            _currentPageIndex = 0;
                          });
                        },// Adjusted to use _currentPageIndex
                      ),
                      NavigationTop(
                        label: 'Belum Bayar',
                        id: 1,
                        selected: _currentPageIndex,
                        onTap: (){
                          context.read<PaymentBloc>().add(WaitingPaymentUserFetch(token:token.toString() ));
                          setState(() {
                            _currentPageIndex = 1;
                          });
                        },// Adjusted to use _currentPageIndex
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22),
                    child: MyTextField(hint: 'Cari kursus anda',
                        controller: searchController,
                        icon: Icons.search),
                  ),
                  const SizedBox(height: 20,),
                  _currentPageIndex == 0 ?
                  Expanded(
                    child: ScrollConfiguration(
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
                  ):
                  BlocBuilder<PaymentBloc, PaymentState>(
                    builder: (context, state) {
                      if(state is WaitingPaymentUserSuccess){
                        final paymentDatas = state.waitingPayment;
                        if(paymentDatas!=null){
                          return Expanded(
                            child: ScrollConfiguration(
                              behavior: NoGlowScrollBehavior(),
                              child: ListView.separated(
                                itemBuilder: (context, index) {
                                  return CardWaitingPayment(
                                    image: paymentDatas[index].pict,
                                    title: paymentDatas[index].title,
                                    date: paymentDatas[index].date,
                                    onTap: (){
                                      context.read<PaymentBloc>().add(DetailPaymentUserFetch(id: paymentDatas[index].id));
                                    },
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const SizedBox(height: 10,);
                                },
                                itemCount: paymentDatas.length,
                              ),
                            ),
                          );
                        }else{
                          return Text('Tidak ada data', style: MyTextStyle.judulH4(color: MyColors.blackBase),);
                        }
                      }else{
                        return SkeletonsCardWaitingPayment();
                      }

                    },
                  ),

                ],
              );
        },
),
      ),
    );
  }
}
