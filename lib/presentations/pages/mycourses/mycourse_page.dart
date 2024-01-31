import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:GrowBiz/bloc/course/course_bloc.dart';
import 'package:GrowBiz/bloc/payment/payment_bloc.dart';
import 'package:GrowBiz/presentations/pages/payment/detail_payment_page.dart';
import 'package:GrowBiz/presentations/pages/mycourses/list_content_course.dart';
import 'package:GrowBiz/styles/my_colors.dart';
import 'package:GrowBiz/styles/my_text.dart';
import 'package:GrowBiz/presentations/widgets/card_mycourse.dart';
import 'package:GrowBiz/presentations/widgets/card_waiting_payment.dart';
import 'package:GrowBiz/presentations/widgets/my_textfield.dart';
import 'package:GrowBiz/presentations/widgets/navigation_top.dart';
import 'package:GrowBiz/presentations/widgets/scrollbehavior.dart';
import 'package:GrowBiz/presentations/widgets/skeletons/skeletons_card_mycourse.dart';
import 'package:GrowBiz/presentations/widgets/skeletons/skeletons_card_waiting_payment.dart';
import 'package:intl/intl.dart';

class MyCoursePage extends StatefulWidget {
  MyCoursePage({super.key, required this.token});
  String token;
  @override
  State<MyCoursePage> createState() => _MyCoursePageState();
}

class _MyCoursePageState extends State<MyCoursePage> {
  TextEditingController searchController = TextEditingController();

  int _currentPageIndex = 0;
  @override void initState() {
    super.initState();
    context.read<CourseBloc>().add(CourseUserFetched(token: widget.token));
  }
  @override
  Widget build(BuildContext context) {

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
                          context.read<CourseBloc>().add(CourseUserFetched(token: widget.token));
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
                          context.read<PaymentBloc>().add(WaitingPaymentUserFetch(token:widget.token.toString() ));
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
                  BlocConsumer<CourseBloc, CourseState>(
                    listener: (context, state) {
                      if(state is CourseMaterialSuccess){
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return ListContentCourse(courseMaterials: state.courseMaterials,);
                        },));
                      }
                    },
                    builder: (context, state) {
                      if(state is CourseUserSuccess){
                        final courseData = state.courseUserModel;
                        return Expanded(
                          child: ScrollConfiguration(
                            behavior: NoGlowScrollBehavior(),
                            child: ListView.separated(
                              itemBuilder: (context, index) {
                                return CardMyCourse(
                                  title:courseData[index].title ,
                                  image: courseData[index].pict,
                                  onTap: (){
                                    context.read<CourseBloc>().add(CourseMaterialFetched(id: courseData[index].id));
                                  },
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(height: 10,);
                              },
                              itemCount: courseData.length,
                            ),
                          ),
                        );
                      }
                      if(state is CourseFailed){
                        return Text(state.error);
                      }
                      else{
                        return const SkeletonsCardMyCourse();
                      }
                    },
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
