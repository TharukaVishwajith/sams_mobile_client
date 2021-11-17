class StaffResponse {
  late int id;
  late String staffNo;
  late String nicNo;
  late String name;
  late String? uniEmail;
  late String? imageUrl;
  late String? imageDataBase64;

  StaffResponse(
      {required this.id,
      required this.staffNo,
      required this.nicNo,
      required this.name,
      this.uniEmail,
      this.imageUrl,
      this.imageDataBase64});

  factory StaffResponse.fromJson(Map<String, dynamic> json) {
    return StaffResponse(
      id: json["id"] != null ? json["id"] : null,
      staffNo: json["staffNo"] != null ? json["staffNo"] : "",
      nicNo: json["nicNo"] != null ? json["nicNo"] : "",
      name: json["name"] != null ? json["name"] : "",
      uniEmail: json["uniEmail"] != null ? json["uniEmail"] : "",
      imageUrl: json["imageUrl"] != null ? json["imageUrl"] : "",
      imageDataBase64: json["imageData"] != null ? json["imageData"] : "",
    );
  }
}

class Staff {
  late int id;
  late String staffNo;
  late String nicNo;
  late String name;
  late String? uniEmail;
  late String? imageUrl;
  late String? imageDataBase64;

  Staff(
      {required this.id,
      required this.staffNo,
      required this.nicNo,
      required this.name,
      this.uniEmail,
      this.imageUrl,
      this.imageDataBase64});

  factory Staff.fromStaffResponse(StaffResponse staffResponse) {
    return Staff(
        id: staffResponse.id,
        staffNo: staffResponse.staffNo,
        nicNo: staffResponse.nicNo,
        name: staffResponse.name,
        uniEmail: staffResponse.uniEmail,
        imageUrl: staffResponse.imageUrl,
        imageDataBase64: staffResponse.imageDataBase64);
  }

  factory Staff.defaultData(){
    return Staff(id: 0, staffNo: "", nicNo: "", name: "");
  }
}
