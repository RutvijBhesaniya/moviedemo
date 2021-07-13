import 'package:flutter/material.dart';
import 'package:moviedemo/view/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String name = " ";
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                'assets/images/images.png',
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Welcome',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    TextFormField(

                      decoration: InputDecoration(
                        hintText: 'Enter Username',
                        labelText: 'Username',

                      ),
                      controller: _nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter some value';
                        }

                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter Password',
                        labelText: 'Password',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter some value';
                        } else if (value.length < 8) {
                          return 'Plesae Enter value above 8';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),

              // Material(
              //   color: Colors.deepPurple,
              //   borderRadius: BorderRadius.circular(
              //     changeButton ? 50 : 8,
              //   ),
              //   child: InkWell(
              //     onTap: () => moveToHome(context),
              //     child: AnimatedContainer(
              //       duration: Duration(seconds: 1),
              //       alignment: Alignment.center,
              //       height: 40,
              //       width: changeButton ? 50 : 150,
              //       child: changeButton
              //           ? Icon(
              //         Icons.done,
              //         color: Colors.white,
              //       )
              //           : Text(
              //         'Login',
              //         style: TextStyle(
              //           fontWeight: FontWeight.bold,
              //           fontSize: 18,
              //           color: Colors.white,
              //         ),
              //       ),
              //     ),
              //   ),
              // )
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(name:_nameController.text),
                      ),
                    );
                  }
                },
                child: Text('Login'),
                style: TextButton.styleFrom(minimumSize: Size(150, 40)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
