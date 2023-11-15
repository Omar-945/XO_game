import 'dart:async';

import 'package:flutter/material.dart';
import 'package:xo_game/game/boardItem.dart';

class GameScreen extends StatefulWidget {
  static const String route = "gamescreen";

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int score1 = 0;
  int score2 = 0;
  List<String> bord = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  List<Color> bordColor = [
    Color(0xFFFFFFFF),
    Color(0xFFFFFFFF),
    Color(0xFFFFFFFF),
    Color(0xFFFFFFFF),
    Color(0xFFFFFFFF),
    Color(0xFFFFFFFF),
    Color(0xFFFFFFFF),
    Color(0xFFFFFFFF),
    Color(0xFFFFFFFF),
  ];
  List<Color> border = [
    Colors.grey.shade400,
    Colors.grey.shade400,
    Colors.grey.shade400,
    Colors.grey.shade400,
    Colors.grey.shade400,
    Colors.grey.shade400,
    Colors.grey.shade400,
    Colors.grey.shade400,
    Colors.grey.shade400,
  ];
  List<Color> symbolColor = [
    Color(0xFF46A3FF),
    Color(0xFF46A3FF),
    Color(0xFF46A3FF),
    Color(0xFF46A3FF),
    Color(0xFF46A3FF),
    Color(0xFF46A3FF),
    Color(0xFF46A3FF),
    Color(0xFF46A3FF),
    Color(0xFF46A3FF),
  ];

  @override
  Widget build(BuildContext context) {
    BordData data = ModalRoute.of(context)?.settings.arguments as BordData;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 150),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            data.player1,
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text("Score $score1"),
                        ],
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            data.player2,
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text("Score $score2"),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    BoardItem(
                      symbol: bord[0],
                      itemColor: bordColor[0],
                      border: border[0],
                      symboleColor: symbolColor[0],
                      index: 0,
                      press: onPress,
                    ),
                    BoardItem(
                      symbol: bord[1],
                      itemColor: bordColor[1],
                      border: border[1],
                      symboleColor: symbolColor[1],
                      index: 1,
                      press: onPress,
                    ),
                    BoardItem(
                      symbol: bord[2],
                      itemColor: bordColor[2],
                      border: border[2],
                      symboleColor: symbolColor[2],
                      index: 2,
                      press: onPress,
                    ),
                  ],
                ),
                Row(
                  children: [
                    BoardItem(
                      symbol: bord[3],
                      itemColor: bordColor[3],
                      border: border[3],
                      symboleColor: symbolColor[3],
                      index: 3,
                      press: onPress,
                    ),
                    BoardItem(
                      symbol: bord[4],
                      itemColor: bordColor[4],
                      border: border[4],
                      symboleColor: symbolColor[4],
                      index: 4,
                      press: onPress,
                    ),
                    BoardItem(
                      symbol: bord[5],
                      itemColor: bordColor[5],
                      border: border[5],
                      symboleColor: symbolColor[5],
                      index: 5,
                      press: onPress,
                    ),
                  ],
                ),
                Row(
                  children: [
                    BoardItem(
                      symbol: bord[6],
                      itemColor: bordColor[6],
                      border: border[6],
                      symboleColor: symbolColor[6],
                      index: 6,
                      press: onPress,
                    ),
                    BoardItem(
                      symbol: bord[7],
                      itemColor: bordColor[7],
                      border: border[7],
                      symboleColor: symbolColor[7],
                      index: 7,
                      press: onPress,
                    ),
                    BoardItem(
                      symbol: bord[8],
                      itemColor: bordColor[8],
                      border: border[8],
                      symboleColor: symbolColor[8],
                      index: 8,
                      press: onPress,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  int cont = 0;

  void onPress(int index) {
    if (bord[index].isNotEmpty) {
      return;
    }
    if (cont.isEven) {
      bord[index] = 'X';
      bordColor[index] = Color(0x8346A3FF);
      border[index] = Color(0xFF46A3FF);
    } else {
      bord[index] = 'O';
      bordColor[index] = Color(0x83FF827E);
      border[index] = Color(0xFFFF827E);
      symbolColor[index] = Color(0xFFFF827E);
    }
    cont++;
    if (winer('X')) {
      score1++;
      initBoard();
    } else if (winer("O")) {
      score2++;
      initBoard();
    } else if (cont == 9) {
      initBoard();
    }
    setState(() {});
  }

  bool winer(String symbol) {
    for (int i = 0; i < 9; i += 3) {
      if (bord[i] == symbol && bord[i + 1] == symbol && bord[i + 2] == symbol) {
        bordColor[i] = Colors.green[200]!;
        border[i] = Colors.green;
        symbolColor[i] = Colors.green;
        bordColor[i + 1] = Colors.green[200]!;
        border[i + 1] = Colors.green;
        symbolColor[i + 1] = Colors.green;
        bordColor[i + 2] = Colors.green[200]!;
        border[i + 2] = Colors.green;
        symbolColor[i + 2] = Colors.green;
        return true;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (bord[i] == symbol && bord[i + 3] == symbol && bord[i + 6] == symbol) {
        bordColor[i] = Colors.green[200]!;
        border[i] = Colors.green;
        symbolColor[i] = Colors.green;
        bordColor[i + 3] = Colors.green[200]!;
        border[i + 3] = Colors.green;
        symbolColor[i + 3] = Colors.green;
        bordColor[i + 6] = Colors.green[200]!;
        border[i + 6] = Colors.green;
        symbolColor[i + 6] = Colors.green;
        return true;
      }
    }
    if (bord[0] == symbol && bord[4] == symbol && bord[8] == symbol) {
      bordColor[0] = Colors.green[200]!;
      border[0] = Colors.green;
      symbolColor[0] = Colors.green;
      bordColor[4] = Colors.green[200]!;
      border[4] = Colors.green;
      symbolColor[4] = Colors.green;
      bordColor[8] = Colors.green[200]!;
      border[8] = Colors.green;
      symbolColor[8] = Colors.green;
      return true;
    }
    if (bord[2] == symbol && bord[4] == symbol && bord[6] == symbol) {
      bordColor[2] = Colors.green[200]!;
      border[2] = Colors.green;
      symbolColor[2] = Colors.green;
      bordColor[4] = Colors.green[200]!;
      border[4] = Colors.green;
      symbolColor[4] = Colors.green;
      bordColor[6] = Colors.green[200]!;
      border[6] = Colors.green;
      symbolColor[6] = Colors.green;
      return true;
    }
    return false;
  }

  void initBoard() {
    Timer(Duration(seconds: 2), () {
      setState(() {
        bord = [
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
        ];
        bordColor = [
          Color(0xFFFFFFFF),
          Color(0xFFFFFFFF),
          Color(0xFFFFFFFF),
          Color(0xFFFFFFFF),
          Color(0xFFFFFFFF),
          Color(0xFFFFFFFF),
          Color(0xFFFFFFFF),
          Color(0xFFFFFFFF),
          Color(0xFFFFFFFF),
        ];
        border = [
          Colors.grey.shade400,
          Colors.grey.shade400,
          Colors.grey.shade400,
          Colors.grey.shade400,
          Colors.grey.shade400,
          Colors.grey.shade400,
          Colors.grey.shade400,
          Colors.grey.shade400,
          Colors.grey.shade400,
        ];
        symbolColor = [
          Color(0xFF46A3FF),
          Color(0xFF46A3FF),
          Color(0xFF46A3FF),
          Color(0xFF46A3FF),
          Color(0xFF46A3FF),
          Color(0xFF46A3FF),
          Color(0xFF46A3FF),
          Color(0xFF46A3FF),
          Color(0xFF46A3FF),
        ];
        cont = 0;
      });
    });
  }
}

class BordData {
  String player1;
  String player2;

  BordData(this.player1, this.player2);
}
