import 'package:flutter/material.dart';
import 'package:moviedemo/generated/l10n.dart';
import 'package:moviedemo/utils/common_widgets/moviedemo_textformfield.dart';
import 'package:moviedemo/utils/common_widgets/moviedemo_title.dart';
import 'package:moviedemo/utils/constant_strings.dart';
import 'package:moviedemo/utils/style.dart';
import 'package:moviedemo/view/widgets/bottom_navigation_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/images/images.png',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 20),
                  child: MovieDemoTitle(
                    // text: ConstantStrings.welCome,
                    text: S.of(context).welCome,
                    style: TextStyles.smallHeadline!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'WorksSans',
                      color: Theme.of(context).accentColor,
                    ),
                  )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Column(
                  children: [
                    MovieDemoTextFormField(
                      hintText: S.of(context).username,
                      validation: validateUsername,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: MovieDemoTextFormField(
                        hintText: S.of(context).password,
                        obscureText: true,
                        validation: validatePassword,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                // HomeScreen(name: _nameController.text),
                                BottomNavigationBars(
                                    name: nameController.text)),
                      );
                    }
                  },
                  child: MovieDemoTitle(
                    text: ConstantStrings.login,
                    style: TextStyles.smallHeadline!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'WorksSans',
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

///validation of user name
String? validateUsername(var value) {
  if (value.isEmpty) {
    return 'Please Enter Some Value';
  }
}

///validation of password
String? validatePassword(var value) {
  if (value.isEmpty) {
    return 'Please enter some value';
  } else if (value.length < 8) {
    return 'Please Enter value above 8';
  }
}
