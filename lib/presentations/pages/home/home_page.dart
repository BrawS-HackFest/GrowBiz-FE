import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:GrowBiz/bloc/article/article_bloc.dart';
import 'package:GrowBiz/bloc/auth/auth_bloc.dart';
import 'package:GrowBiz/bloc/course/course_bloc.dart';
import 'package:GrowBiz/models/categories_model.dart';
import 'package:GrowBiz/presentations/pages/articles/all_article_page.dart';
import 'package:GrowBiz/presentations/pages/courses/all_course_page.dart';
import 'package:GrowBiz/presentations/pages/articles/detail_article_page.dart';
import 'package:GrowBiz/presentations/pages/courses/detail_course_page.dart';
import 'package:GrowBiz/styles/my_colors.dart';
import 'package:GrowBiz/styles/my_text.dart';
import 'package:GrowBiz/presentations/widgets/card_article.dart';
import 'package:GrowBiz/presentations/widgets/card_popular_course.dart';
import 'package:GrowBiz/presentations/widgets/filter_categories.dart';
import 'package:GrowBiz/presentations/widgets/my_textfield.dart';
import 'package:GrowBiz/presentations/widgets/scrollbehavior.dart';
import 'package:GrowBiz/presentations/widgets/skeletons/skeletons_card_article.dart';
import 'package:GrowBiz/presentations/widgets/skeletons/skeletons_card_popular_course.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchControlller = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<CourseBloc>().add(CourseFetched());
    context.read<ArticleBloc>().add(ArticleSingleFetch(id: 1));
  }

  @override
  Widget build(BuildContext context) {
    print((context.read<AuthBloc>().state as AuthSuccess).token.trim());
    return Scaffold(
      body: ScrollConfiguration(
        behavior: NoGlowScrollBehavior(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 19,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        if(state is AuthSuccess){
                          return Text('Halo, ${state.userModel.username}', style: MyTextStyle.judulH3(color: MyColors.blackBase),);
                        }
                        else{
                          return Text('Halo', style: MyTextStyle.judulH3(color: MyColors.blackBase),);
                        }
                      },
                    ),
                    Container(
                      width: 45,
                      height: 45,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle
                      ),
                      child: Image.asset('assets/images/profile_hackfest.png',fit: BoxFit.cover),
                    ),
                  ],
                ),
                const SizedBox(height: 23,),
                MyTextField(hint: 'Cari sesuatu', controller:searchControlller , icon: Icons.search),
                const SizedBox(height: 20,),
                Container(
                  width: double.infinity,
                  height: 130,

                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        width: double.infinity,
                        height: 120,
                        decoration: BoxDecoration(
                            color: MyColors.primaryBase,
                            borderRadius: BorderRadius.circular(12)
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Ingin belajar apa\nhari ini?', style: TextStyle(fontWeight: FontWeight.w700,color: MyColors.whiteBase),),
                          Image.asset('assets/images/people_home.png'),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 18,),
                Text('Kategori', style: MyTextStyle.buttonH3(color: MyColors.blackBase),),
                const SizedBox(height: 10,),
                SizedBox(
                  width: double.infinity,
                  height: 95,
                  child:ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final categories = Categories.getAllCategories[index];
                        return FilterCategories(icon: categories.icon, name: categories.name);
                      }, separatorBuilder: (context, index) {
                    return const SizedBox(width: 10,);
                  }, itemCount: Categories.getAllCategories.length),
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Popular', style: MyTextStyle.buttonH3(color: MyColors.blackBase),),
                    GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return AllCoursePage();
                          },));
                        },
                        child: Text('Lihat semua', style: MyTextStyle.captionH5(color: MyColors.primaryBase),)
                    )
                  ],
                ),
                const SizedBox(height: 7,),
                BlocBuilder<CourseBloc, CourseState>(
                  builder: (context, state) {
                    if(state is CourseSuccess){
                      final courseDatas = state.courseModel;
                      return SizedBox(
                        height: 210,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CardPopularCourse(
                                  image: courseDatas[index].pict.toString(),
                                  rating: courseDatas[index].rating.toString(),
                                  title: courseDatas[index].name,
                                  numberOfPeople: courseDatas[index].buyer.toString(),
                                  categories: 'teratas',
                                  price: courseDatas[index].price,
                                      onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                      return DetailCoursePage(id: courseDatas[index].id);
                                    })).then((value){setState(() {
                                      context.read<CourseBloc>().add(CourseFetched());
                                    });});
                                  },
                                  );
                            }, separatorBuilder: (context, index) {
                          return const SizedBox(width: 8,);
                        }, itemCount: courseDatas.length),
                      );
                    }
                    else{
                      return SizedBox(
                        height: 210,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return const SkeletonsCardPopularCourse();
                            }, separatorBuilder: (context, index) {
                          return const SizedBox(width: 8,);
                        }, itemCount: 2),
                      );
                    }
                  }


                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Artikel Terkini', style: MyTextStyle.buttonH3(color: MyColors.blackBase),),
                    GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return AllArticlePage();
                          },)).then((value) => setState(() {
                            context.read<ArticleBloc>().add(ArticleSingleFetch(id: 1));
                          },));
                        },
                        child: Text('Lihat semua', style: MyTextStyle.captionH5(color: MyColors.primaryBase),)
                    )
                  ],
                ),
                const SizedBox(height: 7,),
                BlocBuilder<ArticleBloc, ArticleState>(
                  builder: (context, state) {
                    if(state is ArticleSingleSuccess){
                      final articleData = state.articleModel;
                      return CardArticle(
                        desc: articleData.desc,
                        image: articleData.pict,
                        title: articleData.title,
                        id: 1,
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return DetailArticlePage(id: 1);
                          },)).then((value) => setState(() {
                            context.read<ArticleBloc>().add(ArticleSingleFetch(id: 1));
                          },));
                        },
                      );
                    }else{
                      return const SkeletonsCardArticle();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
