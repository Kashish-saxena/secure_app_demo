// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC_bY2nPZwx-TiYoBPBKtRPjFeV-wn_BTg',
    appId: '1:605964894467:web:25e77f386ab0c66a93e936',
    messagingSenderId: '605964894467',
    projectId: 'flutterfirebase-a5567',
    authDomain: 'flutterfirebase-a5567.firebaseapp.com',
    storageBucket: 'flutterfirebase-a5567.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAAKjzOjhKno3dDaZaXqBUz1U1MYeHFIrk',
    appId: '1:605964894467:android:b88040963ac1389593e936',
    messagingSenderId: '605964894467',
    projectId: 'flutterfirebase-a5567',
    storageBucket: 'flutterfirebase-a5567.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAk0h4zoCsNCQxqzSXxN-_eDlhtXQxpCtg',
    appId: '1:605964894467:ios:08dd1e5637821f1893e936',
    messagingSenderId: '605964894467',
    projectId: 'flutterfirebase-a5567',
    storageBucket: 'flutterfirebase-a5567.appspot.com',
    iosBundleId: 'com.example.firebaseSecurity',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAk0h4zoCsNCQxqzSXxN-_eDlhtXQxpCtg',
    appId: '1:605964894467:ios:568a9d9415a0d2b393e936',
    messagingSenderId: '605964894467',
    projectId: 'flutterfirebase-a5567',
    storageBucket: 'flutterfirebase-a5567.appspot.com',
    iosBundleId: 'com.example.firebaseSecurity.RunnerTests',
  );
}
