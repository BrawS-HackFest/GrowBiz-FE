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