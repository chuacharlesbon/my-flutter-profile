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
}