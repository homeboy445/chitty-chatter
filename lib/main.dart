import 'package:chitty_chatter/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './screens/intropage/intro_page.dart';
import 'package:firebase_core/firebase_core.dart';
import './screens/Home/Home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  await Firebase.initializeApp();
  runApp(Main());
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isUserAuthenticated = false;

  @override
  void initState() {
    super.initState();
    final user = _auth.currentUser;
    if (user != null) {
      setState(() => isUserAuthenticated = true);
    } else {
      setState(() => isUserAuthenticated = false);
    }
  }

  void changeState(status) {
    setState(() {
      print("Called!");
      isUserAuthenticated = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: kPrimaryColor, scaffoldBackgroundColor: Colors.white),
        home: isUserAuthenticated == false
            ? IntroPage(changeState)
            : Home(changeState));
  }
}
