import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chitty_chatter/constants.dart';
import 'package:chitty_chatter/screens/login/login_page.dart';
import 'package:chitty_chatter/screens/register/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../components/rounded_button.dart';
import 'body.dart';

class IntroPage extends StatelessWidget {
  final Function function;

  IntroPage(this.function);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Background(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: DefaultTextStyle(
                    style: kPrimaryTextStyle,
                    child: AnimatedTextKit(animatedTexts: [
                      TypewriterAnimatedText('Chitty_Chatter')
                    ]),
                  ) /* Text("Chitty_Chatter", style: kPrimaryTextStyle) */,
                ),
                SizedBox(height: size.height * 0.05),
                SvgPicture.asset('assets/icons/chat.svg',
                    height: size.height * 0.49),
                SizedBox(height: 25.0),
                RoundedButton(
                    text: "Login",
                    primaryColor: kPrimaryColor,
                    textColor: Colors.white,
                    function: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginPage(function)));
                    }),
                RoundedButton(
                    text: "Register",
                    primaryColor: kPrimaryLightColor,
                    textColor: kPrimaryColor,
                    function: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage(function)));
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
