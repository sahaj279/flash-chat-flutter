import 'package:flutter/material.dart';

class ButtonFornextScreen extends StatelessWidget {
  final String text;
  final void Function()? onPress;
  final Color colour;
  ButtonFornextScreen(this.text, this.onPress, this.colour);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPress,
          minWidth: 200.0,
          height: 42.0,
          child: Text(text),
        ),
      ),
    );
  }
}
