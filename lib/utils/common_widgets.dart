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
          fontWeight: FontWeight.bold,
          color: ColorStyles.black,
        ),
      ),
    );
  }
}

//ignore: must_be_immutable
class CustomSubTitle extends StatelessWidget {
  CustomSubTitle(this.text);

  String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text!,
        overflow: TextOverflow.ellipsis,
        style: TextStyles.labelName!.copyWith(
          color: ColorStyles.grey,
        ),
      ),
    );
  }
}

//ignore: must_be_immutable
class CustomTitle extends StatelessWidget {
  CustomTitle(this.text, {this.maxLine});

  String? text;
  bool? maxLine = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text!,
        overflow: TextOverflow.ellipsis,
        style: TextStyles.smallHeadline!.copyWith(
          fontWeight: FontWeight.bold,
          color: ColorStyles.black,
        ),
      ),
    );
  }
}
