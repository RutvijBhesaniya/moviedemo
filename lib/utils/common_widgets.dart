import 'package:flutter/material.dart';
import 'package:moviedemo/utils/style.dart';

//ignore: must_be_immutable
class CustomTitle extends StatelessWidget {
  CustomTitle(
      {this.text,
      this.color,
      this.fontWeight,
      this.fontSize,
      this.style,
      this.maxLine});

  String? text;
  var maxLine;

  var color;
  var fontWeight;
  var fontSize;
  var style;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text!,
          maxLines: maxLine, overflow: TextOverflow.ellipsis, style: style
          // style: TextStyles.smallHeadline!.copyWith(
          //   fontWeight: FontWeight.bold,
          //   color: Theme.of(context).accentColor,
          // ),
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

//ignore: must_be_immutable
class CustomImage extends StatelessWidget {
  String? image;
  var borderRadius;

  CustomImage({this.image, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new NetworkImage(image!),
          fit: BoxFit.fill,
        ),
        borderRadius: borderRadius,
      ),
    );
  }
}
