import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation/widgets/app_button.dart';
import 'package:navigation/widgets/input_edit_text.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FocusNode _nameFocus = FocusNode();

  final GlobalKey<FormState> _key = GlobalKey();

  String _name;
  String _strSecond="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Form(
        key: _key,
        autovalidate: true,
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _getNameTextField(),
                _getAppButton(),
                _getTextData()
              ],
            ),
          ),
        ),
      ),
    );
  }

  void dispose() {
    _nameFocus.dispose();
    super.dispose();
  }

  _getTextData(){
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Text(
          _strSecond,
        style: TextStyle(
          fontSize: 30
        ),
      ),
    );
  }

  _getNameTextField() => Container(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: MyTextInputField(
        textInputAction: TextInputAction.done,
        focusNode: _nameFocus,
        labelText: "Name",
        validator: (value) {
          return isEmpty(
            context,
            value,
            "Enter Name",
          );
        },
        onSaved: (value) {
          _name = value;
        },
        keyboardType: TextInputType.text,
      ),
    );

  _getAppButton() => Container(
      padding: EdgeInsets.all(8.0),
      child: AppButton(
        color: Colors.greenAccent,
        text: "Next",
        onPressed: () async {
          if (_key.currentState.validate()) {
            _key.currentState.save();
            final previousData =
            await Navigator.pushNamed(context, "/second", arguments: _name);
            setState(() {
              _strSecond = previousData;
            });
          }
        },
      ),
    );
}

String isEmpty(BuildContext context, String value, String message) {
  if (value.isEmpty) {
    return message;
  } else {
    return null;
  }
}
