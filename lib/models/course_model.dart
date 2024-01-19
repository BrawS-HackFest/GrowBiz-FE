class DataCourse {
  final List<CourseModel> dataCourse;

  DataCourse({required this.dataCourse});

  factory DataCourse.fromJson(Map<String, dynamic> json)=>
      DataCourse(
        dataCourse: List.from(
            json["data"].map((course) => CourseModel.fromModel(course))),
      );
}

class CourseModel {
  final int id;
  final String pict;
  final String name;
  final int buyer;
  final int price;
  final int rating;

  const CourseModel({
    required this.id,
    required this.pict,
    required this.name,
    required this.buyer,
    required this.price,
    required this.rating,
  });

  factory CourseModel.fromModel(Map<String, dynamic> json) =>
      CourseModel
        (id: json['id'],
          pict: json['pict'],
          name: json['name'],
          buyer: json['buyer'],
          price: json['price'],
          rating: json['rating']
      );
}
class DetailCourseModel {
  int id;
  String name;
  String desc;
  int price;
  int buyer;
  int rating;
  List<String> bab;
  String pict;

  DetailCourseModel({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.buyer,
    required this.rating,
    required this.bab,
    required this.pict,
  });

  factory DetailCourseModel.fromJson(Map<String, dynamic>json){
    var detailCourseData = json['data'];
    return DetailCourseModel(
        id: detailCourseData['id'],
        name: detailCourseData['name'],
        desc: detailCourseData['desc'],
        price: detailCourseData['price'],
        buyer: detailCourseData['buyer'],
        rating: detailCourseData['rating'],
        bab: (detailCourseData['bab'] as List<dynamic>?)?.cast<String>() ?? [],
        pict: detailCourseData['pict']
    );
  }
}

class CourseUserData{
  final List<CourseUserModel> courseUserData;
  CourseUserData({required this.courseUserData});

  factory CourseUserData.fromJson(Map<String, dynamic> json) {
    final List<dynamic> data = json['data'];
    List<CourseUserModel> courseUser = data.map((courseData) => CourseUserModel.fromJson(courseData)).toList();
    return CourseUserData(courseUserData: courseUser);
  }
}
class CourseUserModel{
  final String pict;
  final String title;
  final int id;

  CourseUserModel({required this.pict, required this.title,required this.id});

  factory CourseUserModel.fromJson(Map<String,dynamic>json)=>
      CourseUserModel(pict: json['pict'], title: json['title'],id: json['id']);
}

class CourseMaterialData{
  final List<CourseMaterials> courseData;
  CourseMaterialData({required this.courseData});

  factory CourseMaterialData.fromJson(Map<String, dynamic> json)=>
      CourseMaterialData(
        courseData: List.from(
            json["data"].map((course) => CourseMaterials.fromJson(course))),
      );
}

class CourseMaterials{
  int id;
  String title;
  CourseMaterials({required this.id, required this.title});
  
  factory CourseMaterials.fromJson(Map<String,dynamic> json)=>
      CourseMaterials(id: json['id'], title: json['title']);
}

class CourseDetailMaterial{
  final String title;
  final String content;

  CourseDetailMaterial({required this.title, required this.content});

  factory CourseDetailMaterial.fromJson(Map<String,dynamic> json)=>
      CourseDetailMaterial(title: json['title'], content: json['content']);
}