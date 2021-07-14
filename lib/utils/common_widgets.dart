import 'package:flutter/material.dart';
import 'package:moviedemo/utils/style.dart';

//ignore: must_be_immutable
class CustomHeading extends StatelessWidget {
  CustomHeading(this.text);

  String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text!,
        overflow: TextOverflow.ellipsis,
        style: TextStyles.largeHeadline!.copyWith(
            fontWeight: FontWeight.bold, color: Theme.of(context).accentColor),
      ),
    );
  }
}

//ignore: must_be_immutable
class CustomSubTitle extends StatelessWidget {
  CustomSubTitle({this.text,this.maxLine});

  String? text;
  var maxLine;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text!,
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
        style: TextStyles.labelName!.copyWith(color: ColorStyles.dark_grey),
      ),
    );
  }
}

//ignore: must_be_immutable
class CustomTitle extends StatelessWidget {
  CustomTitle({this.text, this.maxLines = false});

  String? text;
  var maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text!,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: TextStyles.smallHeadline!.copyWith(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}

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
          ),
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon),
    );
  }
}
