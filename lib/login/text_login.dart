import 'package:flutter/material.dart';

typedef callBack = void Function(String content);

class TextLogin extends StatelessWidget {
  String name;

  callBack changed;

  TextLogin(this.name, this.changed);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: TextField(
          cursorColor: Colors.brown,
          onChanged: (name) {
            changed(name);
          },
          decoration: InputDecoration(
            label: Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xFF55504f),
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                width: 3,
                color: Color(0xFF55504f),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 3,
                color: Color(0xbb55504f),
              ),
            ),
          ),
        ));
  }
}
