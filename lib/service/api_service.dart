import 'dart:convert';
import 'package:sams/constants.dart';
import 'package:sams/model/student_model.dart';

import '../model/login_model.dart';
import 'package:http/http.dart' as http;

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    var url = Uri.parse(serverUrl + '/api/auth/signin');
    final response = await http.post(url ,headers: {'Content-type': 'application/json'}, body: jsonEncode(requestModel.toJson()));
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<StudentResponse> getStudent(String studentNo) async {
    var url = Uri.parse(serverUrl + '/api/' + apiVersion + '/student/' + studentNo);
    final response = await http.get(url ,headers: {'Content-type': 'application/json'});
    if (response.statusCode == 200 || response.statusCode == 400) {
      return StudentResponse.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
