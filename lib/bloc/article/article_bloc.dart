import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:GrowBiz/models/article_model.dart';
import 'package:GrowBiz/repository/article_repository.dart';

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
    on<ArticleCommentUser>((event, emit) async{
      try{
        final id = event.id;
        final comment = event.comment;
        final token = event.token;
        await articleRepository.userCommentArticle(id:id, comment: comment,token: token );
        emit(ArticleCommentsSuccess());
      }catch(e){
        emit(ArticleFailed(e.toString()));
      }
    });
  }
}
