import 'package:flutter/material.dart';
import 'package:moviedemo/utils/common_widgets/custom_title.dart';
import 'package:moviedemo/utils/constant_strings.dart';
import 'package:moviedemo/utils/style.dart';

class MediaScreen extends StatefulWidget {
  const MediaScreen({Key? key}) : super(key: key);

  @override
  _MediaScreenState createState() => _MediaScreenState();
}

class _MediaScreenState extends State<MediaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomTitle(text:ConstantStrings.mediaScreen,style: TextStyles.smallHeadline!.copyWith(
          fontWeight: FontWeight.bold,fontFamily: 'WorksSans',
          color: Theme.of(context).accentColor,
        ),)
      ),
    );
  }
}
