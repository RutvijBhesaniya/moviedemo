//ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:moviedemo/utils/style.dart';


//ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {this.hintText,
        this.validation,
        this.obscureText = false,
        this.prefixIcon,
        this.suffixIcon});

  String? hintText;
  var validation;
  bool obscureText;
  var prefixIcon;
  var suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validation,
      obscureText: obscureText,
      style: TextStyle(
        color: ColorStyles.grey,
      ),
      decoration: InputDecoration(
          fillColor: ColorStyles.light_grey,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            borderSide: BorderSide.none,
          ),
          hintStyle: TextStyles.smallHeadline!.copyWith(
            color: ColorStyles.grey,
            fontFamily: 'WorksSans',
          ),
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon),
    );
  }
}