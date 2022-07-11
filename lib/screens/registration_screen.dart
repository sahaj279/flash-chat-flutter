import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/components/RoundButtons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'reg';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
                    //Do something with the user input.
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: kInputButtonStyle),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                  obscureText: true,
                  onChanged: (value) {
                    pass = value;
                    //Do something with the user input.
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: kInputButtonStyle.copyWith(
                      hintText: 'Enter your Password')),
              SizedBox(
                height: 24.0,
              ),
              ButtonFornextScreen('Register', () async {
                try {
                  setState(() {
                    showSpinner = true;
                  });
                  final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email, password: pass);
                  setState(() {
                    showSpinner = false;
                  });
                  if (newUser != null)
                    Navigator.pushNamed(context, ChatScreen.id);
                } on Exception catch (e) {
                  print(e);
                }
              }, Colors.blueAccent)
            ],
          ),
        ),
      ),
    );
  }
}
