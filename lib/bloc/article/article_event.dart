part of 'article_bloc.dart';

@immutable
abstract class ArticleEvent {}

class AllArticleFetch extends ArticleEvent{}
class ArticleSingleFetch extends ArticleEvent{
  final int id;
  ArticleSingleFetch({required this.id});
}
class ArticleCommentUser extends ArticleEvent{
  int id;
  String comment;
  ArticleCommentUser({required this.comment, required this.id});
}
