class AboutModel {
  String? data1;
  double? amount;
  int? code;
  Map<String, dynamic>? details;
  List<dynamic>? options;

  AboutModel({
    this.data1,
    this.amount,
    this.code,
    this.details,
    this.options,
  });

  AboutModel.fromJson(Map<String, dynamic> json) {
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

class About2Model {
  String? data1;
  double? amount;
  int? code;

  About2Model({
    this.data1,
    this.amount,
    this.code,
  });

  About2Model.fromJson(Map<String, dynamic> json) {
    data1 = json['data_one'];
    amount = json['amount'];
    code = json['code'];
  }
}