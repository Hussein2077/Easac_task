import 'package:flutter/material.dart';
import 'package:easac_task/core/resource_manager/colors.dart';
import 'package:easac_task/core/utils/app_size.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;

  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.defaultSize! * 6,
      width: AppSize.screenWidth! - (AppSize.defaultSize! * 4),
      
      child: TextFormField(
        
        decoration: InputDecoration(
            labelText: widget.labelText,
            contentPadding: EdgeInsets.all(5),
            labelStyle: TextStyle(
                color: AppColors.greyColor,
            ),
            prefixIcon: widget.prefixIcon,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.greyColor.withOpacity(.4)
              ),

            ),
          focusedBorder:  OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.greyColor.withOpacity(.4)
              )
          ),
        ),

        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
      ),
    );
  }
}
