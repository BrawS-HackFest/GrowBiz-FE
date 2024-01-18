class ArticleData {
  final List<ArticleModel> articleData;

  ArticleData({required this.articleData});

  factory ArticleData.fromJson(Map<String, dynamic> json) {
    final List<dynamic>? data = json["data"];
    final List<ArticleModel> articles = data?.map((articleDatas) => ArticleModel.fromJson(articleDatas)).toList() ?? [];
    return ArticleData(articleData: articles);
  }
}
class ArticleModel{
  int id;
  String title;
  String pict;
  String desc;
  List<dynamic>? comment;

  ArticleModel({
    required this.id,
    required this.title,
    required this.pict,
    required this.desc,
    this.comment
  });

  factory ArticleModel.fromJson(Map<String,dynamic>json)=>
      ArticleModel(
          id: json['id'],
          title: json['title'],
          pict: json['pict'],
          desc: json['description'],
          comment:json['Comments']
      );
}