import 'package:flutter/material.dart';
import 'package:easac_task/core/utils/app_size.dart';

class SocialAuthRow extends StatelessWidget {
  const SocialAuthRow(
      {super.key,
      required this.text,
      required this.icon,
      required this.textColor});

  final String text;
  final Widget icon;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       icon,
        SizedBox(width: AppSize.defaultSize,),
        Text(
          text,
          style: TextStyle(
              fontSize: AppSize.defaultSize! * 1.5,
              fontWeight: FontWeight.w500,
              color: textColor),
        ),
      ],
    );
  }
}
