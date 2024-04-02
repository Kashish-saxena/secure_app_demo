import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get fileName {
    if (kReleaseMode) {
      return '.env.production';
    }
    return '.env.development';
  }
  static String get ivKey{
    return dotenv.env['IV_KEY']??"IV_KEY not found";
  }
  static String get keyData{
    return dotenv.env['KEY_DATA']??"KEY_DATA not found";
  }
}