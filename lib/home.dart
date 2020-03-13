import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation/app_button.dart';
import 'package:navigation/second.dart';

class HomeScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: AppButton(
          color: Colors.greenAccent,
          text: "Next",
          onPressed: () async {
            final String value = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SecondScreen(),
              ),
            );
            debugPrint(value);
          },
        ),
      ),
    );
  }


}
