import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackfest_mobile/bloc/course/course_bloc.dart';
import 'package:hackfest_mobile/pages/payment_page.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:hackfest_mobile/styles/my_text.dart';
import 'package:hackfest_mobile/widgets/desc_section.dart';
import 'package:hackfest_mobile/widgets/my_button.dart';
import 'package:hackfest_mobile/widgets/my_snackBar.dart';
import 'package:hackfest_mobile/widgets/review_section.dart';
import 'package:hackfest_mobile/widgets/scrollbehavior.dart';
import 'package:intl/intl.dart';

class DetailCoursePage extends StatefulWidget {
  DetailCoursePage({super.key, required this.id});
  int id;
  @override
  State<DetailCoursePage> createState() => _DetailCoursePageState();
}

class _DetailCoursePageState extends State<DetailCoursePage> {
  bool isDescriptionSelected = true;

  @override
  void initState() {
    super.initState();
    context.read<CourseBloc>().add(CourseSingleFetched(id: widget.id));
  }
  final currencyFormater = NumberFormat.currency(locale: 'id_ID',symbol: 'Rp.');
  @override
  Widget build(BuildContext context) {
    print(widget.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Kursus',
          style: MyTextStyle.judulH5(color: MyColors.blackBase),
        ),
        centerTitle: true,
      ),
      body: ScrollConfiguration(
        behavior: NoGlowScrollBehavior(),
        child: SingleChildScrollView(
          child: BlocConsumer<CourseBloc, CourseState>(
          listener: (context, state) {
            if(state is CourseFailed){
              mySnackBar(context, state.error);
            }
          },
          builder: (context, state) {
            if(state is CourseLoading){
              return const Center(child: CircularProgressIndicator(),);
            }
            if(state is CourseSingleSuccess){
              final courseSingle = state.detailCourseModelcourseModel;
              return Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Image.network(
                          courseSingle.pict,
                          fit: BoxFit.cover,
                        )),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      courseSingle.name,
                      style: MyTextStyle.buttonH3(color: MyColors.blackBase),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      'Teratas',
                      style: MyTextStyle.captionH5(color: MyColors.secondaryBase),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/svgs/person_icon.svg',color: MyColors.grey300,width: 13),
                              const SizedBox(width: 3,),
                              Text(
                                courseSingle.buyer.toString(),
                                style: MyTextStyle.judulH5(color: MyColors.grey200),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/svgs/money_icon.svg',color: MyColors.primaryBase,width: 22),
                              const SizedBox(width: 3,),
                              Text(
                                currencyFormater.format(courseSingle.price).toString().replaceAll(RegExp(r',00$'), ''),
                                style: MyTextStyle.judulH5(
                                    color: MyColors.primaryBase),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/svgs/star_icon.svg',color: MyColors.secondaryBase,width: 13),
                              const SizedBox(width: 3,),
                              Text(
                                courseSingle.rating.toString(),
                                style:
                                MyTextStyle.judulH5(color: MyColors.blackBase),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: MyColors.neutra100,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  isDescriptionSelected = true;
                                });
                              },
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                side: BorderSide.none,
                                backgroundColor: isDescriptionSelected
                                    ? MyColors.whiteBase
                                    : MyColors.neutra100,
                                foregroundColor: MyColors.greyBase,
                              ),
                              child: Text('Deskripsi'),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  isDescriptionSelected = false;
                                });
                              },
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                side: BorderSide.none,
                                backgroundColor: !isDescriptionSelected
                                    ? MyColors.whiteBase
                                    : MyColors.neutra100,
                                foregroundColor: MyColors.greyBase,
                              ),
                              child: Text('Ulasan'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    isDescriptionSelected ?
                    DescSection(bab: courseSingle.bab,desc: courseSingle.desc,) :
                    ReviewSection(),
                    const SizedBox(height: 19,),
                    SizedBox(
                        width: double.infinity,
                        child: MyButton(text: 'Daftar Sekarang', color: MyColors.primaryBase,
                            onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                return PaymentPage(
                                  courseId: courseSingle.id,
                                  image: courseSingle.pict,
                                  rating: courseSingle.rating.toString(),
                                  buyer: courseSingle.buyer.toString(),
                                  price: courseSingle.price,
                                  title: courseSingle.name.toString(),
                                );
                              }));
                            }
                        )
                    ),

                  ],
                ),
              );
            }
            else{
              return Container();
            }

          },
),
        ),
      ),
    );
  }
}
