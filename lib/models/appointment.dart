class Appointment {
  String? appointmentId;
  String? patientCases;
  String? complaint;
  String? result;
  DateTime? appointmentDate;
  String? doctorName;
  String? hospitalName;
  String? report;
  String? attachments;
  String? other;
  String? patientId;
  String? toothId;
  String? toothCase;

  Appointment(
      {this.appointmentId,
      this.patientCases,
      this.complaint,
      this.result,
      this.appointmentDate,
      this.doctorName,
      this.hospitalName,
      this.report,
      this.attachments,
      this.other,
      this.patientId,
      this.toothId,
      this.toothCase});

  Appointment.fromJson(Map<String, dynamic> json) {
    appointmentId = json['appointmentId'];
    patientCases = json['patientCases'];
    complaint = json['complaint'];
    result = json['result'];
    appointmentDate = json['appointmentDate'];
    doctorName = json['doctorName'];
    hospitalName = json['hospitalName'];
    report = json['report'];
    attachments = json['attachments'];
    other = json['other'];
    patientId = json['patientId'];
    toothId = json['toothId'];
    toothCase = json['ToothCase'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appointmentId'] = this.appointmentId;
    data['patientCases'] = this.patientCases;
    data['complaint'] = this.complaint;
    data['result'] = this.result;
    data['appointmentDate'] = this.appointmentDate;
    data['doctorName'] = this.doctorName;
    data['hospitalName'] = this.hospitalName;
    data['report'] = this.report;
    data['attachments'] = this.attachments;
    data['other'] = this.other;
    data['patientId'] = this.patientId;
    data['toothId'] = this.toothId;
    data['ToothCase'] = this.toothCase;
    return data;
  }
}
