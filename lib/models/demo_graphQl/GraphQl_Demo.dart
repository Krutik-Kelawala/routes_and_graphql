// To parse this JSON data, do
//
//     final graphqlDemoModel = graphqlDemoModelFromJson(jsonString);

import 'dart:convert';

GraphqlDemoModel graphqlDemoModelFromJson(String str) => GraphqlDemoModel.fromJson(json.decode(str));

String graphqlDemoModelToJson(GraphqlDemoModel data) => json.encode(data.toJson());

class GraphqlDemoModel {
  List<User> users;

  GraphqlDemoModel({
    required this.users,
  });

  factory GraphqlDemoModel.fromJson(Map<String, dynamic> json) => GraphqlDemoModel(
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
      };
}

class User {
  String id;
  String email;
  String password;
  String name;
  String role;
  String avatar;
  DateTime creationAt;
  DateTime updatedAt;

  User({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.role,
    required this.avatar,
    required this.creationAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        password: json["password"],
        name: json["name"],
        role: json["role"],
        avatar: json["avatar"] ?? "",
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

  @override
  String toString() {
    return 'User{id: $id, email: $email, password: $password, name: $name, role: $role, avatar: $avatar, creationAt: $creationAt, updatedAt: $updatedAt}';
  }
}
