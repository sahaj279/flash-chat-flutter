import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/components/RoundButtons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String pass = '';
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                  onChanged: (value) {
                    email = value;
                  },
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: kInputButtonStyle),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                  obscureText: true,
                  onChanged: (value) {
                    pass = value;
                  },
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration:
                      kInputButtonStyle.copyWith(hintText: 'Enter password')),
              SizedBox(
                height: 24.0,
              ),
              ButtonFornextScreen('Log In', () async {
                try {
                  setState(() {
                    showSpinner = true;
                  });
                  UserCredential user = await _auth.signInWithEmailAndPassword(
                      email: email, password: pass);
                  setState(() {
                    showSpinner = false;
                  });
                  if (user != null) {
                    Navigator.pushNamed(context, ChatScreen.id);
                  }
                } catch (e) {
                  print(e);
                }
              }, Colors.lightBlueAccent),
            ],
          ),
        ),
      ),
    );
  }
}
