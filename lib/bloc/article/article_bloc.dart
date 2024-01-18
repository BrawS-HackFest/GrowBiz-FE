

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
        emit(AllArticleSuccess(articleModel: articleData.articleData));
      }catch(e){
        emit(AllArticleFailed(e.toString()));
      }
    });
  }
}
