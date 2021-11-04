class StudentResponse {
  late int id;
  late String studentNo;
  late String nicNo;
  late String year;
  late String? uniEmail;
  late String? imageUrl;
  late String? imageDataBase64;

  StudentResponse({
    required this.id,
    required this.studentNo,
    required this.nicNo,
    required this.year,
    this.uniEmail,
    this.imageUrl,
    this.imageDataBase64
  });

  factory StudentResponse.fromJson(Map<String, dynamic> json) {
    return StudentResponse(
      id: json["id"] != null ? json["id"] : null,
      studentNo: json["studentNo"] != null ? json["studentNo"] : "",
      nicNo: json["nicNo"] != null ? json["nicNo"] : "",
      year: json["year"] != null ? json["year"] : "",
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
      'year': year,
      'uniEmail': uniEmail!.trim(),
      'imageUrl': imageUrl!.trim(),
      'imageDataBase64': imageDataBase64!.trim()
    };
    return map;
  }
}