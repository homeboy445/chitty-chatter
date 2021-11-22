import 'package:chitty_chatter/constants.dart';
import 'package:chitty_chatter/screens/components/rounded_button.dart';
import 'package:chitty_chatter/screens/components/textfield_container.dart';
import 'package:chitty_chatter/screens/login/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'body.dart';

class RegisterPage extends StatefulWidget {
  final Function function;
  RegisterPage(this.function);
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String username = '', email = '', password = '';
  bool loading = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child: loading == false
                ? Background(
                    child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: Text("Register", style: kPrimaryTextStyle)),
                        SvgPicture.asset('assets/icons/signup.svg',
                            height: size.height * 0.36),
                        SizedBox(height: 6),
                        TextFieldContainer(
                            text: "Username",
                            icon: Icon(Icons.person, color: kPrimaryColor),
                            isObscure: false,
                            function: (val) {
                              username = val;
                            }),
                        TextFieldContainer(
                            text: "Email",
                            icon: Icon(Icons.email, color: kPrimaryColor),
                            isObscure: false,
                            function: (val) {
                              email = val;
                            }),
                        TextFieldContainer(
                            text: "Password",
                            icon: Icon(Icons.lock, color: kPrimaryColor),
                            isObscure: true,
                            function: (val) {
                              password = val;
                            }),
                        RoundedButton(
                            text: 'Register',
                            primaryColor: kPrimaryColor,
                            textColor: Colors.white,
                            function: () async {
                              if (email.length == 0 || password.length == 0) {
                                return;
                              }
                              setState(() {
                                loading = true;
                              });
                              try {
                                final newUser =
                                    await _auth.createUserWithEmailAndPassword(
                                        email: email, password: password);
                                print(newUser);
                                email = '';
                                password = '';
                                widget.function(true);
                                Navigator.pop(context);
                              } catch (e) {
                                print("ERROR!");
                                print(e);
                              } finally {
                                setState(() => loading = false);
                              }
                              // print(username);
                              // print(email);
                              // print(password);
                            }),
                        SizedBox(height: 1),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        LoginPage(widget.function)));
                          },
                          child: Text("Already have an accound? Login",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0,
                                  fontFamily: 'Poppins',
                                  color: kPrimaryColor)),
                        )
                      ],
                    ),
                  ))
                : SpinKitWave(color: Colors.red, size: 50.0)));
  }
}
