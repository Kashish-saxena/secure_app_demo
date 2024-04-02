import 'package:permission_handler/permission_handler.dart';

class LimitPermissions {
  static const permission = Permission.location;
  static Future<void> requestPermission() async {
    if (await permission.isDenied) {
      await permission.request();
    }
  }
  static Future<bool> checkPermissionStatus() async {
  return await permission.status.isGranted;
}
static Future<bool> shouldShowRequestRationale() async {
  return await permission.shouldShowRequestRationale;
}

}
