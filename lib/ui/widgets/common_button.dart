import 'package:firebase_security/core/utils/color_constants.dart';
import 'package:flutter/material.dart';
import '../../core/utils/text_styles.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Function onPressed;
  const ButtonWidget({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      width: MediaQuery.of(context).size.width,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: ColorConstants.pink),
          backgroundColor: ColorConstants.pink),
        onPressed: () {
          onPressed();
        },
        child: Text(text, style: TextStyles.textStyleFont20Weight600),
      ),
    );
  }
}
