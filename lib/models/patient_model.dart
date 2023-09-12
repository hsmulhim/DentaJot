class Patient {
  String? patientId;
  String? patientName;
  int? patientAge;
  String? photo;
  Null? xRay;
  String? report;

  Patient(
      {this.patientId,
      this.patientName,
      this.patientAge,
      this.photo,
      this.xRay,
      this.report});

  Patient.fromJson(Map<String, dynamic> json) {
    patientId = json['patientId'];
    patientName = json['patient_name'];
    patientAge = json['patient_age'];
    photo = json['photo'];
    xRay = json['x_ray'];
    report = json['report'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['patientId'] = this.patientId;
    data['patient_name'] = this.patientName;
    data['patient_age'] = this.patientAge;
    data['photo'] = this.photo;
    data['x_ray'] = this.xRay;
    data['report'] = this.report;
    return data;
  }
}
