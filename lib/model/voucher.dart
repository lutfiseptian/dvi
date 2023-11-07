// To parse this JSON data, do
//
//     final voucherModel = voucherModelFromJson(jsonString);

import 'dart:convert';

List<VoucherModel> voucherModelFromJson(String str) => List<VoucherModel>.from(
    json.decode(str).map((x) => VoucherModel.fromJson(x)));

String voucherModelToJson(List<VoucherModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VoucherModel {
  var id;
  var name;
  var code;
  var normalPrice;
  var bestPrice;
  var images;

  VoucherModel({
    this.id,
    this.name,
    this.code,
    this.normalPrice,
    this.bestPrice,
    this.images,
  });

  factory VoucherModel.fromJson(Map<String, dynamic> json) => VoucherModel(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        normalPrice: json["normal_price"],
        bestPrice: json["best_price"],
        images: json["images"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "normal_price": normalPrice,
        "best_price": bestPrice,
        "images": images,
      };

  static List<VoucherModel> fromJsonToList(List data) {
    return List<VoucherModel>.from(data.map(
      (item) => VoucherModel.fromJson(item),
    ));
  }
}
