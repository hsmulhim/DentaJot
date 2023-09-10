class Patient {
  String? patientId;
  String? patientName;
  int? ptientAge;
  String? gender;
  String? photo;

  Patient(
      {this.patientId,
      this.patientName,
      this.ptientAge,
      this.gender,
      this.photo});

  Patient.fromJson(Map<String, dynamic> json) {
    patientId = json['patientId'];
    patientName = json['patient_name'];
    ptientAge = json['ptient_age'];
    gender = json['gender'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['patientId'] = this.patientId;
    data['patient_name'] = this.patientName;
    data['patient_age'] = this.ptientAge;
    data['gender'] = "Female";
    data['photo'] = this.photo;
    return data;
  }
}
