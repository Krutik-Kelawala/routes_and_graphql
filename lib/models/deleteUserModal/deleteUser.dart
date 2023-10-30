// To parse this JSON data, do
//
//     final deleteUserModel = deleteUserModelFromJson(jsonString);

import 'dart:convert';

DeleteUserModel deleteUserModelFromJson(String str) => DeleteUserModel.fromJson(json.decode(str));

String deleteUserModelToJson(DeleteUserModel data) => json.encode(data.toJson());

class DeleteUserModel {
  bool deleteUser;

  DeleteUserModel({
    required this.deleteUser,
  });

  factory DeleteUserModel.fromJson(Map<String, dynamic> json) => DeleteUserModel(
    deleteUser: json["deleteUser"],
  );

  Map<String, dynamic> toJson() => {
    "deleteUser": deleteUser,
  };
}
