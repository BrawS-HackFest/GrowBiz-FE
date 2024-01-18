part of 'article_bloc.dart';

@immutable
abstract class ArticleState {}

class ArticleInitial extends ArticleState {}
class ArticleLoading extends ArticleState{}

class AllArticleSuccess extends ArticleState {
  final List<ArticleModel> articleModel;
  AllArticleSuccess({required this.articleModel});
}

class ArticleFailed extends ArticleState{
  String error;
  ArticleFailed(this.error);
}

class ArticleSingleSuccess extends ArticleState{
  final ArticleModel articleModel;
  ArticleSingleSuccess({required this.articleModel});
}