import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:GrowBiz/bloc/article/article_bloc.dart';
import 'package:GrowBiz/presentations/pages/articles/detail_article_page.dart';
import 'package:GrowBiz/styles/my_colors.dart';
import 'package:GrowBiz/styles/my_text.dart';
import 'package:GrowBiz/presentations/widgets/card_article.dart';
import 'package:GrowBiz/presentations/widgets/my_textfield.dart';
import 'package:GrowBiz/presentations/widgets/scrollbehavior.dart';
import 'package:GrowBiz/presentations/widgets/skeletons/skeletons_card_article.dart';

class AllArticlePage extends StatefulWidget {
  AllArticlePage({super.key});

  @override
  State<AllArticlePage> createState() => _AllArticlePageState();
}

class _AllArticlePageState extends State<AllArticlePage> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ArticleBloc>().add(AllArticleFetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Artikel Terkini',
          style: MyTextStyle.judulH5(color: MyColors.blackBase),),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            MyTextField(hint: 'Cari Sesuatu',
                controller: searchController,
                icon: Icons.search),
            const SizedBox(height: 15,),
            BlocBuilder<ArticleBloc, ArticleState>(
              builder: (context, state) {
                if(state is ArticleLoading){
                  return const SkeletonsCardArticle();
                }
                if(state is ArticleFailed){
                  return Text(state.error);
                }
                if(state is AllArticleSuccess){
                  final articleData = state.articleModel;
                  return Expanded(
                    child: ScrollConfiguration(
                      behavior: NoGlowScrollBehavior(),
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return CardArticle(
                              title: articleData[index].title,
                              image: articleData[index].pict,
                              desc: articleData[index].desc,
                              id: articleData[index].id,
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return DetailArticlePage(id: articleData[index].id);
                                },)).then((value) => setState(() {
                                  context.read<ArticleBloc>().add(AllArticleFetch());
                                },));
                              },
                            );
                          }, separatorBuilder: (context, index) {
                        return const SizedBox(height: 15,);
                      }, itemCount: articleData.length),
                    ),
                  );
                }
                else{
                  return Container();
                }

              },
            )
          ],
        ),
      ),
    );
  }
}
