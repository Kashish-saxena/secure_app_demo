import 'package:firebase_security/core/utils/string_constants.dart';
import 'package:firebase_security/core/view_models/home_view_model.dart';
import 'package:firebase_security/ui/screens/base_view.dart';
import 'package:firebase_security/ui/widgets/common_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  HomeViewModel? model;
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (model) {
        this.model = model;
      },
      builder: (context, model, child) {
        return SafeArea(
          child: Scaffold(
            body: buildBody(context),
          ),
        );
      },
    );
  }

  Widget buildBody(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonWidget(
              text: StringConstants.getLocation,
              onPressed: () {
                model?.checkPermission(context);
              },
            ),
            ButtonWidget(
              text: StringConstants.fingerPrint,
              onPressed: () {
                model?.authenticateFingerprint(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
