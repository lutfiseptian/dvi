// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';
import 'dart:math';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  var username;
  var email;
  var id;
  var token;


  UserModel({
    this.id,
    this.email,
    this.token,
    this.username
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        email: json['email'],
        token: json['token'],
        username: json['username']
 
      );

  static List<UserModel> fromJsonToList(List data) {
    return List<UserModel>.from(data.map(
      (item) => UserModel.fromJson(item),
    ));
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "username": username,
      "email": email,
      "token": token,
      
 
    };
  }

  String toJson() => json.encode(toMap());
}