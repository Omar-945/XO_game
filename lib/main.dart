import 'package:flutter/material.dart';
import 'package:xo_game/game/game_screen.dart';
import 'package:xo_game/login/login_screen.dart';
import 'package:xo_game/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.route,
      routes: {
        SplashScreen.route: (context) => SplashScreen(),
        GameScreen.route: (context) => GameScreen(),
        LoginScreen.route: (context) => LoginScreen(),
      },
    );
  }
}
