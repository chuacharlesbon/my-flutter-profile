class HomeModel {
  String? data1;
  double? amount;
  int? code;
  Map<String, dynamic>? details;
  List<dynamic>? options;

  HomeModel({
    this.data1,
    this.amount,
    this.code,
    this.details,
    this.options,
  });

  HomeModel.fromJson(Map<String, dynamic> json) {
    data1 = json['data_one'];
    amount = json['amount'];
    code = json['code'];
    details = json['details'];
    options = json['options'];
  }

/////////////////////////////////
// Sample Server JSON Response //
/////////////////////////////////

  static const sampleResponse = {
    "data-one": "This is sample String",
    "amount": 123.00,
    "code": 9001,
    "details": {
      "sample": "This is the new value",
      "sample_value": true,
    },
    "options": [
      "option_1",
      "option_2",
      "option_3",
    ]
  };
}