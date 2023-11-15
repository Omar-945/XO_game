import 'package:flutter/material.dart';
import 'package:xo_game/game/game_screen.dart';
import 'package:xo_game/login/text_login.dart';

class LoginScreen extends StatelessWidget {
  static const String route = "login";

  @override
  Widget build(BuildContext context) {
    String player1 = '';
    String player2 = '';
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Color(0xFFc4bab8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 100,
                ),
                child: Image.asset('assets/splash.jpg'),
              ),
              Text(
                "X_O Game",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF55504f)),
              ),
              SizedBox(
                height: 100,
              ),
              TextLogin("Player 1 Name", (String name) {
                player1 = name;
              }),
              SizedBox(
                height: 20,
              ),
              TextLogin("Player 2 Name", (String name) {
                player2 = name;
              }),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                    color: Colors.brown[600],
                    borderRadius: BorderRadius.circular(30)),
                child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, GameScreen.route,
                          arguments: BordData(player1, player2));
                    },
                    child: Text(
                      'Start',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
