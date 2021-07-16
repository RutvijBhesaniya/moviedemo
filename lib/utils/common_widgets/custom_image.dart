//ignore: must_be_immutable
import 'package:flutter/material.dart';

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