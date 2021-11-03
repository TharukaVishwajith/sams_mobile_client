class LoginResponseModel {
  final String token;
  final String error;

  LoginResponseModel({required this.token, required this.error});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json["accessToken"] != null ? json["accessToken"] : "",
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
