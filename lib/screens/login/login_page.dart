import 'package:chitty_chatter/constants.dart';
import 'package:chitty_chatter/screens/register/register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'body.dart';
import '../components/rounded_button.dart';
import '../components/textfield_container.dart';

class LoginPage extends StatefulWidget {
  Function function;
  LoginPage(this.function);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '', password = '';
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
                        margin: EdgeInsets.only(top: 50),
                        child: Text("Login", style: kPrimaryTextStyle)),
                    SizedBox(height: size.height * 0.08),
                    SvgPicture.asset("assets/icons/login.svg",
                        height: size.height * 0.35),
                    SizedBox(height: 4.0),
                    TextFieldContainer(
                        text: 'Your Email',
                        icon: Icon(Icons.email, color: kPrimaryColor),
                        isObscure: false,
                        function: (val) {
                          email = val;
                        }),
                    TextFieldContainer(
                        text: 'Your Password',
                        icon: Icon(Icons.lock, color: kPrimaryColor),
                        isObscure: true,
                        function: (val) {
                          password = val;
                        }),
                    RoundedButton(
                        text: "Login",
                        textColor: Colors.white,
                        primaryColor: kPrimaryColor,
                        function: () async {
                          print("----LOGING..IN------");
                          if (email.length == 0 || password.length == 0) {
                            return;
                          }
                          print("TRIED!");
                          try {
                            setState(() => loading = true);
                            final userAuth =
                                await _auth.signInWithEmailAndPassword(
                                    email: email, password: password);
                            print("SUCCESSFULL!");
                            print(userAuth);
                            if (userAuth != null) {
                              widget.function(true);
                              Navigator.pop(context);
                            }
                          } catch (e) {
                            print("ERROR!");
                            print(e);
                          } finally {
                            setState(() => loading = false);
                          }
                          // print(email);
                          // print(password);
                        }),
                    SizedBox(height: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    RegisterPage(widget.function)));
                      },
                      child: Text("New here? Register",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                              fontFamily: 'Poppins',
                              color: kPrimaryColor)),
                    )
                  ],
                ),
              ))
            : SpinKitWave(color: Colors.red, size: 50.0),
      ),
    );
  }
}
