import 'package:firebase_security/core/enums/view_state.dart';
import 'package:firebase_security/core/routing/routes.dart';
import 'package:firebase_security/core/utils/color_constants.dart';
import 'package:firebase_security/core/utils/image_constants.dart';
import 'package:firebase_security/core/utils/string_constants.dart';
import 'package:firebase_security/core/utils/text_styles.dart';
import 'package:firebase_security/core/view_models/login_view_model.dart';
import 'package:firebase_security/ui/screens/base_view.dart';
import 'package:firebase_security/ui/widgets/common_button.dart';
import 'package:firebase_security/ui/widgets/common_icon_button.dart';
import 'package:firebase_security/ui/widgets/common_textformfield.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  LoginViewModel? model;
  GlobalKey<FormState> loginKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
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

  Widget buildBody(context) {
    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: model?.state == ViewState.idle? Form(
          key: loginKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    StringConstants.welcomeBack,
                    style: TextStyles.textStyleFont36Weight700.copyWith(
                      color: ColorConstants.pink,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextFormFieldWidget(
                controller: model?.emailController ?? TextEditingController(),
                obscureText: false,
                hint: StringConstants.userNameOrEmail,
                prefixIcon: Icons.person,
              ),
              const SizedBox(height: 16),
              TextFormFieldWidget(
                controller:
                    model?.passwordController ?? TextEditingController(),
                hint: StringConstants.password,
                prefixIcon: Icons.lock,
                obscureText: model?.passwordVisibility ?? false,
                suffixIcon: IconButton(
                  onPressed: () {
                    model?.visible(model!.passwordVisibility);
                  },
                  icon: Icon(
                    model?.passwordVisibility ?? false
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: ColorConstants.grey676767,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ButtonWidget(
                text: StringConstants.login,
                onPressed: () {
                  model?.signIn(context);
                },
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  StringConstants.or,
                  style: TextStyles.textStyleFont12Weight500.copyWith(
                    color: ColorConstants.pink,
                  ),
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButtonWidget(image: ImageConstants.googleImage),
                  IconButtonWidget(image: ImageConstants.appleImage),
                  IconButtonWidget(image: ImageConstants.facebookImage),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    StringConstants.createAnAccountRegister,
                    style: TextStyles.textStyleFont14Weight400,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.popAndPushNamed(context, Routes.registerScreen);
                    },
                    child: Text(
                      StringConstants.register,
                      style: TextStyles.textStyleFont14Weight600.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.red,
                        decorationThickness: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ):const CircularProgressIndicator(color: ColorConstants.red,),
      ),
    );
  }
}
