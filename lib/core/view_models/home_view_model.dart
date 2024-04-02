import 'package:firebase_security/core/repository/local_auth_service.dart';
import 'package:firebase_security/core/utils/string_constants.dart';
import 'package:firebase_security/core/view_models/base_model.dart';
import 'package:firebase_security/ui/widgets/common_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeViewModel extends BaseModel {
  Future<bool> authenticateFingerprint(BuildContext context) async {
    bool authenticated = await LocalAuth.authenticate();
    if (authenticated) {
      if (context.mounted) {
        snackBar(context, StringConstants.authenticationSuccessful);
      }
      return true;
    } else {
      if (context.mounted) {
        snackBar(context, StringConstants.authenticationFailed);
      }
      return authenticated;
    }
  }

  void checkPermission(context) async {
    var status = await Permission.location.request();
    if (status == PermissionStatus.granted) {
      snackBar(context, "Permission already granted");
    } else if (await Permission.speech.isPermanentlyDenied) {
      openAppSettings();
    } else {
      snackBar(context, StringConstants.permissionDenied);
      openAppSettings();
    }
  }
}
