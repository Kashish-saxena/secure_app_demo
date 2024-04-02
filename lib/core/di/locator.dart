
import 'package:firebase_security/core/repository/firebase_services.dart';
import 'package:firebase_security/core/view_models/home_view_model.dart';
import 'package:firebase_security/core/view_models/login_view_model.dart';
import 'package:firebase_security/core/view_models/register_view_model.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setUpLocator() {
  locator.registerLazySingleton(() => FirebaseServices());
  locator.registerLazySingleton(() => RegisterViewModel());
  locator.registerLazySingleton(() => LoginViewModel());
  locator.registerLazySingleton(() => HomeViewModel());
}
