class Questions {
  String? question;
  String? icon;

  Questions({this.question, this.icon});

  Questions.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question'] = question;
    data['icon'] = icon;
    return data;
  }
}
