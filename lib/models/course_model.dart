class DataCourse{
  final List<CourseModel> dataCourse;
  DataCourse({required this.dataCourse});
  factory DataCourse.fromJson(Map<String,dynamic> json)=>DataCourse(
    dataCourse: List.from(json["data"].map((course) => CourseModel.fromModel(course))),
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