// To parse this JSON data, do
//
//     final transactionModel = transactionModelFromJson(jsonString);

import 'dart:convert';

List<TransactionModel> transactionModelFromJson(String str) =>
    List<TransactionModel>.from(
        json.decode(str).map((x) => TransactionModel.fromJson(x)));

String transactionModelToJson(List<TransactionModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TransactionModel {
  var id;
  var userId;
  var vaNumber;
  var amount;
  var status;
  var notes;
  var seri;

  TransactionModel(
      {this.id,
      this.userId,
      this.vaNumber,
      this.amount,
      this.status,
      this.seri,
      this.notes});

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
          id: json["id"],
          userId: json["user_id"],
          vaNumber: json["va_number"],
          amount: json["amount"],
          status: json["status"],
          seri: json['seri'],
          notes: json['notes']);

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "va_number": vaNumber,
        "amount": amount,
        "status": status,
        "notes": notes,
        "seri": seri
      };
}
