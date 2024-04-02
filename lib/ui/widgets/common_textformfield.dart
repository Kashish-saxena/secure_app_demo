import 'package:firebase_security/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import '../../core/utils/color_constants.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String hint;
  final IconData prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? Function(dynamic)? validator;
  final Function(String)? onChange;

  final TextEditingController controller;
  const TextFormFieldWidget({
    super.key,
    required this.hint,
    required this.prefixIcon,
    this.suffixIcon,
    required this.obscureText,
    this.validator,
    required this.controller,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyles.textStyleFont12Weight500
          .copyWith(color: Theme.of(context).colorScheme.secondary),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
    
      onChanged: onChange,
      cursorColor: ColorConstants.black,
      obscureText: obscureText,
      decoration: InputDecoration(
        fillColor: ColorConstants.greyF3F3F3,
        filled: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 1)),
        hintText: hint,
        hintStyle: TextStyles.textStyleFont12Weight500,
        suffixIcon: suffixIcon,
        prefixIcon: Icon(
          prefixIcon,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
