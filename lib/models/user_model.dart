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