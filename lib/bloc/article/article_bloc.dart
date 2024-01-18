

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:hackfest_mobile/models/article_model.dart';
import 'package:hackfest_mobile/repository/article_repository.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleRepository articleRepository;
  ArticleBloc({required this.articleRepository}) : super(ArticleInitial()) {
    on<AllArticleFetch>((event, emit)async {
      try{
        emit(ArticleLoading());
        final articleData = await articleRepository.getAllArticle();
        print(articleData.articleData);
        emit(AllArticleSuccess(articleModel: articleData.articleData));
      }catch(e){
        emit(ArticleFailed(e.toString()));
      }
    });
    on<ArticleSingleFetch>((event, emit) async{
      try{
        emit(ArticleLoading());
        final articleSingleData = await articleRepository.getSingleArticle(event.id);
        emit(ArticleSingleSuccess(articleModel: articleSingleData));

      }catch(e){
        emit(ArticleFailed(e.toString()));
      }
    });
  }
}
