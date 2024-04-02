import 'dart:developer';
import 'package:encrypt/encrypt.dart' as enc;
import 'package:firebase_security/core/enums/view_state.dart';
import 'package:firebase_security/core/models/environments.dart';
import 'package:firebase_security/core/repository/firebase_services.dart';
import 'package:firebase_security/core/routing/routes.dart';
import 'package:firebase_security/core/utils/string_constants.dart';
import 'package:firebase_security/core/view_models/base_model.dart';
import 'package:firebase_security/ui/widgets/common_snackbar.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends BaseModel {
  final TextEditingController emailController= TextEditingController();
  final TextEditingController passwordController= TextEditingController();
  bool passwordVisibility=true;
  FirebaseServices services = FirebaseServices();


  void visible(bool visibility) {
    passwordVisibility=!visibility;
    debugPrint("$passwordVisibility");
    notifyListeners();
  }

  String decrypttData(String text) {
    final keyData = enc.Key.fromUtf8(Environment.keyData);
    final iv = enc.IV.fromUtf8(Environment.ivKey);
    final encrypter = enc.Encrypter(enc.AES(keyData, padding: null));
    final encypted = enc.Encrypted.from64(text);
    final decrypted = encrypter.decrypt(encypted, iv: iv);
    debugPrint(">>>>>>>>>>$decrypted");
    debugPrint(">>>>>>>>>>$decrypted");
    return decrypted;
  }

  Future<void> signIn(BuildContext context) async {
    state = ViewState.busy;
    if (emailController.text.toString().isNotEmpty &&
        passwordController.text.toString().isNotEmpty) {
      state = ViewState.idle;
      try {
        log(emailController.text);
        state = ViewState.busy;
        final user = await services.checkCredentials(
            emailController.text, passwordController.text);
        log("userDetails: ${user?.email}");
        log("userDetails: ${user?.password}");
        log("user decrypted Password: ${decrypttData(user?.password ?? "")}");
        String ecryptedPassword = decrypttData(user?.password ?? "");
        if (passwordController.text.toString() == ecryptedPassword &&
            emailController.text.toString() == user?.email) {
          state = ViewState.idle;
          if (context.mounted) {
            snackBar(context, StringConstants.loggedIn);
            Navigator.popAndPushNamed(
              context,
              Routes.homeScreen,
            );
          }
        } else {
          if (context.mounted) {
            snackBar(context, StringConstants.enterCorrectDetail);
            state = ViewState.idle;
          }
        }
      } catch (e) {
        if (context.mounted) {
          log(e.toString());
          snackBar(context, e.toString());
          state = ViewState.idle;
        }
      }
    } else {
      state = ViewState.idle;
      if (context.mounted) {
        snackBar(context, StringConstants.enterDetails);
      }
    }
  }
}
