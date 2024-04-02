import 'dart:math';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_security/core/enums/view_state.dart';
import 'package:firebase_security/core/models/environments.dart';
import 'package:firebase_security/core/models/user_model.dart';
import 'package:firebase_security/core/repository/firebase_services.dart';
import 'package:firebase_security/core/routing/routes.dart';
import 'package:firebase_security/core/utils/string_constants.dart';
import 'package:firebase_security/core/view_models/base_model.dart';
import 'package:firebase_security/ui/widgets/common_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as enc;

class RegisterViewModel extends BaseModel {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  bool passwordVisibility = true;
  FirebaseServices services = FirebaseServices();
  final _randomUserId = Random();

  bool? get mounted => null;

  void visible(bool visibility) {
    passwordVisibility = !visibility;
    debugPrint("$passwordVisibility");
    notifyListeners();
  }

  String encryptData(String text) {
    String encryptedPassword = "";
    final plainText = text;
    final keyData = enc.Key.fromUtf8(Environment.keyData);
    final iv = enc.IV.fromUtf8(Environment.ivKey);
    final encrypter = enc.Encrypter(enc.AES(keyData, padding: null));
    final encypted = encrypter.encrypt(plainText, iv: iv);
    // final decrypted = encrypter.decrypt(encypted, iv: iv);
    encryptedPassword = encypted.base64;
    return encryptedPassword;
  }

  String getUserId() {
    String id = "";
    for (var i = 0; i < 16; i++) {
      id += _randomUserId.nextInt(10).toString();
    }
    return id;
  }

  Future<void> signUp(BuildContext context) async {
    String password = encryptData(passwordController.text);
    state = ViewState.busy;
    try {
      state = ViewState.idle;

      UserModel user = UserModel(
        id: getUserId(),
        email: emailController.text,
        password: password,
        name: nameController.text,
      );
      state = ViewState.busy;
      UserModel? registeredUser = await services.registerUser(user);
       state = ViewState.idle;
      if (registeredUser != null) {
        emailController.clear();
        passwordController.clear();
        nameController.clear();
       
        if (context.mounted) {
          
          snackBar(context, StringConstants.successSignUp);
          Navigator.popAndPushNamed(context, Routes.loginScreen);
        }
      } else {
        if (context.mounted) {
          snackBar(context, StringConstants.userAlreadyExist);
        }
        state = ViewState.idle;
      }
      state = ViewState.idle;
    } on FirebaseException catch (e) {
      if (context.mounted) {
        snackBar(context, e.toString());
        state = ViewState.idle;
      }
    }
  }
}
