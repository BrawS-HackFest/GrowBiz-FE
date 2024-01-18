class ArticleData {
  final List<ArticleModel> articleData;

  ArticleData({required this.articleData});

  factory ArticleData.fromJson(Map<String, dynamic> json)=>
      ArticleData(
        articleData: List.from(
            json["data"].map((articleDatas) => ArticleModel.fromJson(articleDatas))),
      );
}
class ArticleModel{
  int id;
  String title;
  String pict;
  String desc;

  ArticleModel({
    required this.id,
    required this.title,
    required this.pict,
    required this.desc
  });

  factory ArticleModel.fromJson(Map<String,dynamic>json)=>
      ArticleModel(
          id: json['id'],
          title: json['title'],
          pict: json['pict'],
          desc: json['description']
      );
}