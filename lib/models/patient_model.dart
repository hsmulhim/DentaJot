class Patient {
  String? patientId;
  String? patientName;
  int? ptientAge;
  String? gender;

  Patient({this.patientId, this.patientName, this.ptientAge, this.gender});

  Patient.fromJson(
    Map json,
  ) {
    patientId = json['patientId'];
    patientName = json['patient_name'];
    ptientAge = json['patient_age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['patientId'] = this.patientId;
    data['patient_name'] = this.patientName;
    data['patient_age'] = this.ptientAge;

    return data;
  }
}
