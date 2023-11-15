import 'package:flutter/material.dart';

typedef callBack = void Function(int index);

class BoardItem extends StatelessWidget {
  String symbol;
  Color itemColor;
  Color border;
  Color symboleColor;
  int index;
  callBack press;

  BoardItem({
    super.key,
    required this.symbol,
    required this.itemColor,
    required this.border,
    required this.symboleColor,
    required this.index,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        press(index);
      },
      child: Container(
        width: 112,
        height: 122,
        margin: EdgeInsets.all(3),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: border), color: itemColor),
        child: Center(
          child: Text(
            symbol,
            style: TextStyle(
                color: symboleColor, fontSize: 30, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
