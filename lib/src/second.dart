import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation/widgets/app_button.dart';
import 'package:navigation/widgets/input_edit_text.dart';

import 'home.dart';

class SecondScreen extends StatelessWidget {
  final FocusNode _previousFocus = FocusNode();

  final GlobalKey<FormState> _key = GlobalKey();

  String _strPrevious = "";

  @override
  Widget build(BuildContext context) {
    final String args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
              Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios),
          onPressed: () => _gotoPreviousScreen(context),
        ),
        title: Text(args),
      ),
      body: Form(
        key: _key,
        autovalidate: true,
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _getPreviousTextField(context),
                _getAppButton(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getAppButton(BuildContext context) => Container(
        padding: EdgeInsets.all(8.0),
        child: AppButton(
          color: Colors.greenAccent,
          text: "Back",
          onPressed: () {
            if (_key.currentState.validate()) {
              _key.currentState.save();
              _gotoPreviousScreen(context);
            }
          },
        ),
      );

  _gotoPreviousScreen(BuildContext context) =>
      Navigator.pop(context, _strPrevious);

  _getPreviousTextField(BuildContext context) => Container(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
        child: MyTextInputField(
          textInputAction: TextInputAction.done,
          focusNode: _previousFocus,
          labelText: "Pervious",
          validator: (value) {
            return isEmpty(
              context,
              value,
              "Enter Previous Data",
            );
          },
          onSaved: (value) {
            _strPrevious = value;
          },
          keyboardType: TextInputType.text,
        ),
      );
}
