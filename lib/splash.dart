import 'dart:async';
import 'package:flutter/material.dart';
import 'package:xo_game/game/game_screen.dart';
import 'package:xo_game/login/login_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String route = "splash";

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () {
      Navigator.pop(context);
      Navigator.pushNamed(context, LoginScreen.route);
    });
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/splash.jpg'),
            ),
            color: Color(0xFFc4bab8)),
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(
            top: 600,
          ),
          child: Text(
            "X_O Game",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xFF55504f)),
          ),
        ),
      ),
    );
  }
}
