class UserModel {
 final String username;
 final String email;
 final String phoneNumber;

 UserModel({
   required this.username,
   required this.email,
   required this.phoneNumber
  });

 factory UserModel.fromJson(Map<String,dynamic>json)=>
     UserModel(
         username: json['username'],
         email: json['email'],
         phoneNumber: json['number']
     );
}



class UserWorkModel{
  final String id;
  final String username;
  final String number;
  final List<dynamic> categories;

  UserWorkModel({
    required this.id,
    required this.username,
    required this.number,
    required this.categories
  });

  factory UserWorkModel.fromJson(Map<String,dynamic> json)=>
      UserWorkModel(
          id: json['id'],
          username: json['username'],
          number: json['number'],
          categories: json['categories']);
}

class UserWorkData{
  final List<UserWorkModel> userWorkData;

  UserWorkData({required this.userWorkData});

  factory UserWorkData.fromJson(Map<String, dynamic> json)=>
      UserWorkData(
        userWorkData: List.from(
            json["data"].map((userData) => UserWorkModel.fromJson(userData))),
      );

}

class UserWorkDetail{
  final String name;
  final String email;
  final String number;
  List<dynamic> categories;

  UserWorkDetail({
    required this.name,
    required this.number,
    required this.email,
    required this.categories
  });

  factory UserWorkDetail.fromJson(Map<String, dynamic> json){
    final userData = json['data'];
    return UserWorkDetail(
        name: userData['username'],
        number: userData['number'],
        email: userData['email'],
        categories: userData['categories']);
  }
}