class Appointment {
  String? appointmentId;
  String? patientCases;
  String? complaint;
  String? result;
  String? appointmentDate;
  String? doctorName;
  String? hospitalName;
  String? report;
  String? attachments;
  String? other;
  String? patientId;
  int? toothId;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['appointmentId'] = appointmentId;
    data['patientCases'] = patientCases;
    data['complaint'] = complaint;
    data['result'] = result;
    data['appointmentDate'] = appointmentDate;
    data['doctorName'] = doctorName;
    data['hospitalName'] = hospitalName;
    data['report'] = report;
    data['attachments'] = attachments;
    data['other'] = other;
    data['patientId'] = patientId;
    data['toothId'] = toothId;
    data['ToothCase'] = toothCase;
    return data;
  }
}
