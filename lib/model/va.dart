// To parse this JSON data, do
//
//     final vaModel = vaModelFromJson(jsonString);

import 'dart:convert';

List<VaModel> vaModelFromJson(String str) =>
    List<VaModel>.from(json.decode(str).map((x) => VaModel.fromJson(x)));

String vaModelToJson(List<VaModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VaModel {
  var no;
  var bank;
  var bankCode;
  var images;
  var isChecked;

  VaModel({this.no, this.bank, this.bankCode, this.images, this.isChecked});

  factory VaModel.fromJson(Map<String, dynamic> json) => VaModel(
      no: json["no"],
      bank: json["bank"],
      bankCode: json["bank_code"],
      images: json["images"],
      isChecked: json['is_checked'] ?? false);

  Map<String, dynamic> toJson() => {
        "no": no,
        "bank": bank,
        "bank_code": bankCode,
        "images": images,
      };

  static List<VaModel> fromJsonToList(List data) {
    return List<VaModel>.from(data.map(
      (item) => VaModel.fromJson(item),
    ));
  }
}
