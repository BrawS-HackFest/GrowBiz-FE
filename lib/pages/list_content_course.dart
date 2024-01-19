import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackfest_mobile/bloc/course/course_bloc.dart';
import 'package:hackfest_mobile/models/course_model.dart';
import 'package:hackfest_mobile/pages/detail_mycourse.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:hackfest_mobile/styles/my_text.dart';
import 'package:hackfest_mobile/widgets/my_snackBar.dart';
class ListContentCourse extends StatelessWidget {
  ListContentCourse({super.key, required this.courseMaterials});
  List<CourseMaterials> courseMaterials;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Isi Kursus', style: MyTextStyle.judulH5(color: MyColors.blackBase),),
        centerTitle: true,
      ),
      body: BlocListener<CourseBloc, CourseState>(
            listener: (context, state) {
             if(state is CourseDetailMaterialSuccess){
               Navigator.push(context, MaterialPageRoute(builder: (context) {
                 return DetailMyCourse(courseDetailMaterial: state.courseDetailMaterial,);
               },));
             }
             if(state is CourseFailed){
               mySnackBar(context, state.error);
             }
            },
            child: Padding(
                  padding: EdgeInsets.all(26),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Pilihan Topik', style: TextStyle(fontSize: 13 ,fontWeight: FontWeight.w600),),
                          Text('${courseMaterials.length} topik', style: MyTextStyle.captionH5(color: MyColors.blackBase),)
                        ],
                      ),
                      const SizedBox(height: 10,),
                      ListView.separated(
                        shrinkWrap: true,
                          itemBuilder: (context, index) {
                        final listCourse = courseMaterials[index];
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(11.39),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x23295BFF),
                                blurRadius: 3.50,
                                offset: Offset(0, 3.50),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  context.read<CourseBloc>().add(CourseDetailMaterialFetched(id: listCourse.id));
                                },
                                child: Container(
                                  padding:EdgeInsets.symmetric(horizontal: 14, vertical: 11),
                                  decoration:BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: MyColors.primaryBase
                                  ),
                                  child: Center(child: SvgPicture.asset('assets/svgs/play_icon.svg')),
                                ),
                              ),
                              const SizedBox(width: 9,),
                              Text(listCourse.title ,style: MyTextStyle.captionH5(color: MyColors.blackBase),)
                            ],
                          ),
                        );
                      }, separatorBuilder: (context, index) {
                        return const SizedBox(height: 10,);
                      }, itemCount: courseMaterials.length)
                    ],
                  ),
                ),
),
    );
  }
}
