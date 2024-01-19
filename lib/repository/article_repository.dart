import 'package:dio/dio.dart';
import 'package:hackfest_mobile/models/article_model.dart';

class ArticleRepository{
  final dio = Dio(BaseOptions(baseUrl:'https://0bbf-104-28-245-128.ngrok-free.app'));

  Future<ArticleData> getAllArticle() async {
    try {
      final response = await dio.get('/article/all');
      final data = response.data["data"] as List<dynamic>;
      List<ArticleModel> articles = data.map((articleData) => ArticleModel.fromJson(articleData)).toList();
      return ArticleData(articleData: articles);
    } catch (e) {
      throw e.toString();
    }
  }
  Future<ArticleModel> getSingleArticle(int id)async{
    try{
      final response = await dio.get('/article/$id');
      return ArticleModel.fromJson(response.data['data']);
    }catch(e){
      throw e.toString();
    }
  }
  Future userCommentArticle ({required int id, required String comment, required String token})async{
    try{
      final response = await dio.post('/article/$id/create-comment', options: Options(headers: {"Authorization": "Bearer $token"}),data: {
        "comment" : comment
      });
      return response.data;
    }catch(e){
      throw e.toString();
    }
  }
}