import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/RoundButtons.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation, ani;
  String s = '';
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    ani = ColorTween(
      begin: Colors.grey,
      end: Colors.white,
    ).animate(animationController);
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.decelerate);
    animationController.forward();

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          s = 'Flash Chat';
        });
      }
    });

    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ani.value,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: Container(
                      child: Image.asset('images/logo.png'),
                      height: animation.value * 60,
                    ),
                  ),
                  DefaultTextStyle(
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(s,
                            speed: Duration(milliseconds: 100)),
                      ],
                    ),
                    style: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.black54),
                  ),
                ],
              ),
              SizedBox(
                height: 48.0,
              ),
              ButtonFornextScreen('Log in', () {
                Navigator.pushNamed(context, LoginScreen.id);
              }, Colors.lightBlueAccent),
              ButtonFornextScreen('Register', () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              }, Colors.blueAccent),
            ],
          ),
        ),
      ),
    );
  }
}
