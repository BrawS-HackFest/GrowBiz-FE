import 'package:dio/dio.dart';
import 'package:hackfest_mobile/models/article_model.dart';

class ArticleRepository{
  final dio = Dio(BaseOptions(baseUrl:'https://c4eb-104-28-245-127.ngrok-free.app'));
  
  Future<ArticleData> getAllArticle()async{
    try{
      final response = await dio.get('article/all');
      return ArticleData(articleData: response.data);
    }catch(e){
      throw e.toString();
    }
  }
}