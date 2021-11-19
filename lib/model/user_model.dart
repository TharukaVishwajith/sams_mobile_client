import 'package:flutter/cupertino.dart';

class User {
  late int id;
  late String staffNo;
  // late String nicNo;
  late String name;
  late String? uniEmail;
  late String? imageUrl;
  late String? imageDataBase64;

  User(
      {required this.id,
        required this.staffNo,
        // required this.nicNo,
        required this.name,
        this.uniEmail,
        this.imageUrl,
        this.imageDataBase64});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"] != null ? json["id"] : null,
      staffNo: json["staffNo"] != null ? json["staffNo"] : "",
      // nicNo: json["nicNo"] != null ? json["nicNo"] : "",
      name: json["name"] != null ? json["name"] : "",
      uniEmail: json["uniEmail"] != null ? json["uniEmail"] : "",
      imageUrl: json["imageUrl"] != null ? json["imageUrl"] : "",
      imageDataBase64: json["imageData"] != null ? json["imageData"] : "",
    );
  }

  factory User.defaultData(){
    // return User(id: 0, staffNo: "", nicNo: "", name: "");
    return User(id: 0, staffNo: "", name: "");
  }
}

// class UserModel extends ChangeNotifier{
//
//   User user = User.defaultData();
//
//   void updateUser(User user){
//     this.user = user;
//     notifyListeners();
//   }
//
//   User get currentUser => user;
//
// }

// class User {
//   late int id;
//   late String staffNo;
//   late String nicNo;
//   late String name;
//   late String? uniEmail;
//   late String? imageUrl;
//   late String? imageDataBase64;
//
//   User(
//       {required this.id,
//         required this.staffNo,
//         required this.nicNo,
//         required this.name,
//         this.uniEmail,
//         this.imageUrl,
//         this.imageDataBase64});
//
//   factory User.fromStaffResponse(UserResponse staffResponse) {
//     return User(
//         id: staffResponse.id,
//         staffNo: staffResponse.staffNo,
//         nicNo: staffResponse.nicNo,
//         name: staffResponse.name,
//         uniEmail: staffResponse.uniEmail,
//         imageUrl: staffResponse.imageUrl,
//         imageDataBase64: staffResponse.imageDataBase64);
//   }
//
//   factory User.defaultData(){
//     return User(id: 0, staffNo: "", nicNo: "", name: "");
//   }
// }



class UserModel extends ChangeNotifier{
  static final UserModel _singleton = UserModel._internal();
  User user = User.defaultData();

  factory UserModel() {
    return _singleton;
  }

  UserModel._internal();

  User get currentUser => user;

  void updateUser(User user){
    this.user = user;
    notifyListeners();
  }
}