//ignore: must_be_immutable
import 'package:flutter/material.dart';

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