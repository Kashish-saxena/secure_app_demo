import 'package:firebase_security/core/routing/routes.dart';
import 'package:firebase_security/ui/screens/home_screen.dart';
import 'package:firebase_security/ui/screens/login_screen.dart';
import 'package:firebase_security/ui/screens/register_screen.dart';
import 'package:flutter/material.dart';

class PageRoutes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (context) => RegisterScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      default:
        return MaterialPageRoute(
            builder: (context) => const Text("No Page exists..."));
    }
  }
}
