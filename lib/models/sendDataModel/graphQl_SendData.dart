// To parse this JSON data, do
//
//     final sendDataDemoModel = sendDataDemoModelFromJson(jsonString);

import 'dart:convert';

SendDataDemoModel sendDataDemoModelFromJson(String str) => SendDataDemoModel.fromJson(json.decode(str));

String sendDataDemoModelToJson(SendDataDemoModel data) => json.encode(data.toJson());

class SendDataDemoModel {
  AddUser addUser;

  SendDataDemoModel({
    required this.addUser,
  });

  factory SendDataDemoModel.fromJson(Map<String, dynamic> json) => SendDataDemoModel(
    addUser: AddUser.fromJson(json["addUser"]),
  );

  Map<String, dynamic> toJson() => {
    "addUser": addUser.toJson(),
  };
}

class AddUser {
  String id;
  String email;
  String password;
  String name;
  String role;
  String avatar;
  DateTime creationAt;
  DateTime updatedAt;

  AddUser({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.role,
    required this.avatar,
    required this.creationAt,
    required this.updatedAt,
  });

  factory AddUser.fromJson(Map<String, dynamic> json) => AddUser(
    id: json["id"],
    email: json["email"],
    password: json["password"],
    name: json["name"],
    role: json["role"],
    avatar: json["avatar"],
    creationAt: DateTime.parse(json["creationAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "password": password,
    "name": name,
    "role": role,
    "avatar": avatar,
    "creationAt": creationAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
