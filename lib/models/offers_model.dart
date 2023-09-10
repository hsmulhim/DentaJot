class Offers {
  String? offer;
  String? offerUrl;

  Offers({this.offer, this.offerUrl});

  Offers.fromJson(Map<String, dynamic> json) {
    offer = json['offer'];
    offerUrl = json['offerUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['offer'] = offer;
    data['offerUrl'] = offerUrl;
    return data;
  }
}
