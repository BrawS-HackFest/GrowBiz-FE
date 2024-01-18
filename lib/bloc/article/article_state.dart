part of 'article_bloc.dart';

@immutable
abstract class ArticleState {}

class ArticleInitial extends ArticleState {}
class ArticleLoading extends ArticleState{}

class AllArticleSuccess extends ArticleState {
  List<ArticleModel> articleModel;
  AllArticleSuccess({required this.articleModel});
}

class AllArticleFailed extends ArticleState{
  String error;
  AllArticleFailed(this.error);
}