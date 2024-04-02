import 'dart:developer';
import 'package:local_auth/local_auth.dart';

class LocalAuth {
  static final auth = LocalAuthentication();

  static Future<bool> checkBioAuth() async {
    final isAvailable = await auth.canCheckBiometrics;
    final isSupported = await auth.isDeviceSupported();
    return isAvailable && isSupported;
  }

  static Future<bool> authenticate() async {
    final isAuthAvailable = await checkBioAuth();
    log(isAuthAvailable.toString());
    if (isAuthAvailable == false) {
      return false;
    }
    try {
      return await auth.authenticate(
          localizedReason: 'Use fingerprint to login');
    } catch (e) {
      log('error is $e');
      return false;
    }
  }

  static Future<void> getBio() async {
    List<BiometricType> availableBio = await auth.getAvailableBiometrics();
    log('Available Biometrics are $availableBio');
  }
}
