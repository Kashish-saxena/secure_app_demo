import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_security/core/di/locator.dart';
import 'package:firebase_security/core/models/environments.dart';
import 'package:firebase_security/core/utils/firebase_options.dart';
import 'package:firebase_security/ui/screens/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:screen_protector/screen_protector.dart';

void main() async {
  setUpLocator();
  await dotenv.load(fileName: Environment.fileName);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await ScreenProtector.protectDataLeakageOn();
  await ScreenProtector.preventScreenshotOn();
  runApp(const MyApp());
}
