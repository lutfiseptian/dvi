// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  var id;
  var name;
  var code;
  var price;
  var images;
  var popular;

  var productCode;
  var rangeHarga;
  var command;
  var normalPrice;
  var bestPrice;
  var type;
  var description;
  var addional1;
  var destTopup;
  var product;
  var harga;
  var nominal;
  var notes;
  var isSelected;

  var qty;
  ProductModel(
      {this.id,
      this.name,
      this.code,
      this.notes,
      this.price,
      this.images,
      this.popular,
      this.productCode,
      this.rangeHarga,
      this.command,
      this.normalPrice,
      this.bestPrice,
      this.type,
      this.description,
      this.qty,
      this.destTopup,
      this.addional1,
      this.product,
      this.nominal,
      this.isSelected,
      this.harga});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      id: json["id"],
      name: json["name"],
      code: json["code"],
      notes: json["notes"],
      price: json["price"],
      images: json["images"],
      popular: json["popular"],
      productCode: json["product_code"],
      rangeHarga: json["range_harga"],
      command: json["command"],
      normalPrice: json["normal_price"],
      bestPrice: json["best_price"],
      description: json['descripsi'],
      addional1: json['addional1'],
      type: json['type'] ?? "",
      destTopup: json['dest_topup'] ?? "",
      nominal: json['nominal'],
      product: json['produk'],
      harga: json['harga'],
      isSelected: json['is_selected'] ?? false,
      qty: json['qty']);

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "name": name,
  //       "code": code,
  //       "price": price,
  //       "images": images,
  //       "popular": popular,
  //     };

  static List<ProductModel> fromJsonToList(List data) {
    return List<ProductModel>.from(data.map(
      (item) => ProductModel.fromJson(item),
    ));
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "code": code,
      "price": price,
      "images": images,
      "notes": notes,
      "popular": popular,
      "product_code": productCode,
      "range_harga": rangeHarga,
      "commmand": command,
      "normmal_price": normalPrice,
      "best_price": bestPrice,
      "description": description,
      "addionnal1": addional1,
      "type": type,
      "dest_topup": destTopup,
      "nominal": nominal,
      "product": "product",
      "harga": harga,
      "qty": qty
    };
  }

  String toJson() => json.encode(toMap());
}
