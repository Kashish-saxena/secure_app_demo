import 'package:firebase_security/core/enums/view_state.dart';
import 'package:firebase_security/core/routing/routes.dart';
import 'package:firebase_security/core/utils/color_constants.dart';
import 'package:firebase_security/core/utils/image_constants.dart';
import 'package:firebase_security/core/utils/string_constants.dart';
import 'package:firebase_security/core/utils/text_styles.dart';
import 'package:firebase_security/core/utils/validations.dart';
import 'package:firebase_security/core/view_models/register_view_model.dart';
import 'package:firebase_security/ui/screens/base_view.dart';
import 'package:firebase_security/ui/widgets/common_button.dart';
import 'package:firebase_security/ui/widgets/common_icon_button.dart';
import 'package:firebase_security/ui/widgets/common_snackbar.dart';
import 'package:firebase_security/ui/widgets/common_textformfield.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  RegisterViewModel? model;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterViewModel>(
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
        child: model?.state == ViewState.idle
            ? Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          StringConstants.welcome,
                          style: TextStyles.textStyleFont36Weight700.copyWith(
                            color: ColorConstants.pink,
                          ),
                        ),
                      ],
                    ),
                    TextFormFieldWidget(
                      controller:
                          model?.nameController ?? TextEditingController(),
                      obscureText: false,
                      hint: StringConstants.name,
                      prefixIcon: Icons.person,
                      validator: (val) => Validations.isNameValid(val),
                    ),
                    const SizedBox(height: 16),
                    TextFormFieldWidget(
                      controller:
                          model?.emailController ?? TextEditingController(),
                      obscureText: false,
                      hint: StringConstants.userNameOrEmail,
                      prefixIcon: Icons.person,
                      validator: (val) => Validations.isEmailValid(val),
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
                      validator: (val) => Validations.isPasswordValid(val),
                    ),
                    const SizedBox(height: 16),
                    ButtonWidget(
                      text: StringConstants.register,
                      onPressed: () {
                        if (formKey.currentState?.validate() ?? false) {
                          model?.signUp(context);
                        } else {
                          snackBar(context, StringConstants.fillSignUpDetails);
                          
                        }
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
                          StringConstants.loginAccount,
                          style: TextStyles.textStyleFont14Weight400,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.loginScreen);
                          },
                          child: Text(
                            StringConstants.login,
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
              )
            : const CircularProgressIndicator(color: ColorConstants.red),
      ),
    );
  }
}
