import 'package:firebase_security/core/repository/firebase_services.dart';
import 'package:firebase_security/core/routing/router.dart';
import 'package:firebase_security/core/routing/routes.dart';
import 'package:firebase_security/core/view_models/home_view_model.dart';
import 'package:firebase_security/core/view_models/login_view_model.dart';
import 'package:firebase_security/core/view_models/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RegisterViewModel>(
            create: (context) => RegisterViewModel()),
        ChangeNotifierProvider<FirebaseServices>(
            create: (context) => FirebaseServices()),
        ChangeNotifierProvider<LoginViewModel>(
            create: (context) => LoginViewModel()),
        ChangeNotifierProvider<HomeViewModel>(
            create: (context) => HomeViewModel()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: Routes.registerScreen,
        onGenerateRoute: (settings) => PageRoutes.generateRoutes(settings),
      ),
    );
  }
}