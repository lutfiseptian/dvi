// To parse this JSON data, do
//
//     final pulsaModel = pulsaModelFromJson(jsonString);

import 'dart:convert';

List<PulsaModel> pulsaModelFromJson(String str) =>
    List<PulsaModel>.from(json.decode(str).map((x) => PulsaModel.fromJson(x)));

String pulsaModelToJson(List<PulsaModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PulsaModel {
  var id;
  var name;
  var productCode;
  var rangeHarga;
  var command;
  var images;

  PulsaModel({
    this.id,
    this.name,
    this.productCode,
    this.rangeHarga,
    this.command,
    this.images,
  });

  factory PulsaModel.fromJson(Map<String, dynamic> json) => PulsaModel(
        id: json["id"],
        name: json["name"],
        productCode: json["product_code"],
        rangeHarga: json["range_harga"],
        command: json["command"],
        images: json["images"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "product_code": productCode,
        "range_harga": rangeHarga,
        "command": command,
        "images": images,
      };

  static List<PulsaModel> fromJsonToList(List data) {
    return List<PulsaModel>.from(data.map(
      (item) => PulsaModel.fromJson(item),
    ));
  }
}
