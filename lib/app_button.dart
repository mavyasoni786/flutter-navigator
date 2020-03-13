import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color;

  const AppButton({@required this.text, this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoButton(
        color: color,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w700,
          ),
        ),
        onPressed: onPressed,
      );
    } else {
      return RaisedButton(
        color: color,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w700,
          ),
        ),
        onPressed: onPressed,
      );
    }
  }
}
