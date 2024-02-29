import 'package:flutter/material.dart';
import 'package:easac_task/core/utils/app_size.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key, required this.widget, required this.color, this.onTap});

  final Widget widget;
  final Color color;
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: AppSize.defaultSize! * 5.6,
        width: AppSize.screenWidth! - (AppSize.defaultSize! * 4),
        decoration: BoxDecoration(
          color: color,
          boxShadow: [
            BoxShadow(
                blurRadius: 20.0,
                color: Colors.grey.withOpacity(.2),
                offset: const Offset(5, 15)),
          ],
        ),
        child: Center(child: widget),
      ),
    );
  }
}
