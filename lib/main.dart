// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  return runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black54),
        ),
      ),
      // home: WelcomeScreen(),
      routes: {
        WelcomeScreen.id: (context) {
          return WelcomeScreen();
        },
        LoginScreen.id: (context) {
          return LoginScreen();
        },
        RegistrationScreen.id: (context) {
          return RegistrationScreen();
        },
        ChatScreen.id: (context) {
          return ChatScreen();
        },
      },
      initialRoute: WelcomeScreen.id,
    );
  }
}
