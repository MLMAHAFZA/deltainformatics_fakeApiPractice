class RateModel {
  double? rate;
  int? count;

  RateModel({required this.rate, required this.count});

  RateModel.fromJson(Map<String, dynamic> json) {
    rate = double.parse(json['rate']?.toString() ?? '0');
    count = json['count'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['rate']=rate;
    json['count']=count;
    return json;
  }
}
