class StudentResponse {
  late int id;
  late String studentNo;
  late String nicNo;
  late String firstName;
  late String lastName;
  late int year;
  late String faculty;
  late String department;
  late bool isSuspended;
  late String? uniEmail;
  late String? imageUrl;
  late String? imageDataBase64;

  StudentResponse({
    required this.id,
    required this.studentNo,
    required this.nicNo,
    required this.firstName,
    required this.lastName,
    required this.year,
    required this.faculty,
    required this.department,
    required this.isSuspended,
    this.uniEmail,
    this.imageUrl,
    this.imageDataBase64
  });

  factory StudentResponse.fromJson(Map<String, dynamic> json) {
    return StudentResponse(
      id: json["id"] != null ? json["id"] : null,
      studentNo: json["studentNo"] != null ? json["studentNo"] : "",
      nicNo: json["nicNo"] != null ? json["nicNo"] : "",
      firstName: json["firstName"] != null ? json["firstName"] : "",
      lastName: json["lastName"] != null ? json["lastName"] : "",
      year: json["year"] != null ? json["year"] : 0,
      faculty: json["faculty"] != null ? json["faculty"] : "",
      department: json["department"] != null ? json["department"] : "",
      isSuspended: json["suspended"] != null ? json["suspended"] : 0,
      uniEmail: json["uniEmail"] != null ? json["uniEmail"] : "",
      imageUrl: json["imageUrl"] != null ? json["imageUrl"] : "",
      imageDataBase64: json["imageData"] != null ? json["imageData"] : "",
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'id': id,
      'studentNo': studentNo.trim(),
      'nicNo': nicNo.trim(),
      'firstName': firstName.trim(),
      'lastName': lastName.trim(),
      'year': year,
      'faculty': faculty.trim(),
      'department': department.trim(),
      'isSuspended': isSuspended,
      'uniEmail': uniEmail!.trim(),
      'imageUrl': imageUrl!.trim(),
      'imageDataBase64': imageDataBase64!.trim()
    };
    return map;
  }
}