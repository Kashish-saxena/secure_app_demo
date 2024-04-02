
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? email;
  String? password;
  String? name;

  UserModel({
    this.id,
    this.email,
    this.password,
    this.name
  });

  factory UserModel.fromJson(DocumentSnapshot<Map<String, dynamic>> json) {
    final data = json.data()!;
    return UserModel(
      id: json.id,
      email: data["email"],
      password: data["password"],
      name: data["name"],
    );
  }
  Map<String, dynamic> toJson() => {
        "id": id ?? "",
        "email": email ?? "",
        "password": password ?? "",
        "name": name ?? "",
      };
}
