import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_security/core/models/user_model.dart';
import 'package:firebase_security/core/view_models/base_model.dart';

class FirebaseServices extends BaseModel {
  late CollectionReference _userCollection;
  FirebaseServices.internal() {
    _userCollection = FirebaseFirestore.instance.collection("users");
  }
  static final FirebaseServices _instance = FirebaseServices.internal();
  factory FirebaseServices() {
    return _instance;
  }
  Future<UserModel?> registerUser(UserModel user) async {
    try {
      final existingUser =
          await _userCollection.where("email", isEqualTo: user.email).get();

      if (existingUser.docs.isEmpty) {
        await _userCollection.doc(user.id).set(
              user.toJson(),
            );
        DocumentSnapshot snapshot = await FirebaseFirestore.instance
            .collection("users")
            .doc(user.id)
            .get();
        log("User registered successfully: ${snapshot.data().toString()}");
        return user;
      } else {
        log("User with email ${user.email} already exists.");
        return null;
      }
    } on FirebaseException catch (e) {
      log("Error registering user: $e");
      return null;
    }
  }

  Future<UserModel?> checkCredentials(
      String? email, String? password) async {
    try {
     final snapshot = await _userCollection.where("email", isEqualTo: email).get();
    final userData = snapshot.docs
        .map((e) =>
            UserModel.fromJson(e as DocumentSnapshot<Map<String, dynamic>>))
        .single;
        log(userData.email.toString());
      return userData;
    } catch (e) {
      log('Exception occurred while checking credentials: $e');
      return null;
    }
  }
}
