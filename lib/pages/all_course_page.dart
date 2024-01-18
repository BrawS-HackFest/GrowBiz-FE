import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackfest_mobile/bloc/course/course_bloc.dart';
import 'package:hackfest_mobile/pages/detail_course_page.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:hackfest_mobile/styles/my_text.dart';
import 'package:hackfest_mobile/widgets/card_detail_course.dart';
import 'package:hackfest_mobile/widgets/my_textfield.dart';
import 'package:hackfest_mobile/widgets/scrollbehavior.dart';
import 'package:hackfest_mobile/widgets/skeletons/skeletons_card_all_course.dart';

class AllCoursePage extends StatefulWidget {
  AllCoursePage({super.key});

  @override
  State<AllCoursePage> createState() => _AllCoursePageState();
}

class _AllCoursePageState extends State<AllCoursePage> {
  TextEditingController searchCourse = TextEditingController();

  void initState() {
    super.initState();
    context.read<CourseBloc>().add(CourseFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kursus', style: MyTextStyle.judulH5(color: MyColors.blackBase),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Semua', style: MyTextStyle.judulH4(color: MyColors.blackBase),),
              Text('Rekomendasi', style: MyTextStyle.judulH4(color: MyColors.blackBase),),
              Text('Teratas', style: MyTextStyle.judulH4(color: MyColors.blackBase),),
            ],
          ),
          const SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: MyTextField(
                hint: 'Cari yang anda inginkan',
                controller:searchCourse ,
                icon: Icons.search
            ),
          ),
          const SizedBox(height: 15,),
          BlocBuilder<CourseBloc, CourseState>(
            builder: (context, state) {
              if(state is CourseSuccess){
                final courseData = state.courseModel;
                return Expanded(
                  child: ScrollConfiguration(
                    behavior: NoGlowScrollBehavior(),
                    child: ListView.separated(
                      itemCount: courseData.length,
                      itemBuilder: (context, index) {
                        return CardDetailCourse(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context){
                              return DetailCoursePage(id: courseData[index].id);
                            })).then((value){setState(() {
                              context.read<CourseBloc>().add(CourseFetched());
                            });});
                          },
                          title: courseData[index].name,
                          price: courseData[index].rating,
                          image: courseData[index].pict,
                          numberOfPeople:  courseData[index].buyer.toString(),
                          rating: courseData[index].rating.toString(),
                          categories: 'teratas',
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 10,);
                      },
                    ),
                  ),
                );
              }else{
                return SkeletonsCardAllCourse();
              }
            },
          )
        ],
      ),

    );
  }
}
