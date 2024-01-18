import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackfest_mobile/bloc/article/article_bloc.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:hackfest_mobile/styles/my_text.dart';
import 'package:hackfest_mobile/widgets/card_article.dart';
import 'package:hackfest_mobile/widgets/my_textfield.dart';
import 'package:hackfest_mobile/widgets/scrollbehavior.dart';

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
                  return Text('laoding...');
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
