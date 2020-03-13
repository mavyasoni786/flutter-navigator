import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation/app_button.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
              Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios),
          onPressed: () => _gotoPreviousScreen(context),
        ),
        title: Text("Second"),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: AppButton(
          color: Colors.greenAccent,
          text: "Back",
          onPressed: () {
            _gotoPreviousScreen(context);
          },
        ),
      ),
    );
  }

  _gotoPreviousScreen(BuildContext context) => Navigator.pop(context, "Test");
}
