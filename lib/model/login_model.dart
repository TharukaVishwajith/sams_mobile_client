class LoginResponseModel {
  final String token;
  final int staffId;
  final String useName;
  final List<dynamic> roles;
  final String error;

  LoginResponseModel({required this.token, required this.staffId, required this.useName, required this.roles, required this.error});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json["accessToken"] != null ? json["accessToken"] : "",
      staffId: json["staffId"] != null ? json["staffId"] : 0,
      useName: json["useName"] != null ? json["useName"] : "",
      roles: json["roles"] != null ? json["roles"] : [],
      error: json["error"] != null ? json["error"] : "",
    );
  }
}

class LoginRequestModel {
  String email;
  String password;

  LoginRequestModel({
    required this.email,
    required this.password
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'username': email.trim(),
      'password': password.trim(),
    };
    return map;
  }
}
