import 'package:flutter/material.dart';
import '../utils/images.dart';

class MyTextInputField extends StatefulWidget {

  final TextEditingController controller;
  final String hint;
  final String labelText;
  final FocusNode focusNode;
  final FormFieldValidator<String> validator;
  final FormFieldSetter<String> onSaved;
  final Function endIconClick;

  final ValueChanged<String> onFieldSubmitted;

  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool enabled;
  bool isObscureText;
  final bool isPassword;
  final String initialValue;
  final String endIcon;

  MyTextInputField(
      {Key key,
      this.controller,
      this.focusNode,
      this.hint,
      this.labelText,
      this.validator,
      this.onSaved,
      this.keyboardType,
      this.textInputAction,
      this.enabled = true,
      this.isObscureText = false,
      this.isPassword = false,
      this.initialValue,
      this.onFieldSubmitted,
      this.endIcon,
      this.endIconClick})
      : super(key: key);

  @override
  _MyTextInputFieldState createState() => _MyTextInputFieldState();
}

class _MyTextInputFieldState extends State<MyTextInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      enabled: widget.enabled,
      decoration: InputDecoration(
        hintText: widget.hint,
        labelText: widget.labelText,
        border: OutlineInputBorder(),
        suffixIcon: _suffixIconCheck(),
      ),
      onSaved: widget.onSaved,
      validator: widget.validator,
      initialValue: widget.initialValue,
      onFieldSubmitted: widget.onFieldSubmitted,
      obscureText: widget.isObscureText == null ? false : widget.isObscureText,
    );
  }

  _suffixIconCheck() =>
      (widget.isPassword == null || widget.isPassword == false)
          ? widget.endIcon != null
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    widget.endIcon,
                    width: 20,
                    height: 20,
                    scale: 2.5,
                  ),
                )
              : null
          : (widget.isPassword
              ? GestureDetector(
                  onTap: () {
                    if (widget.endIconClick != null) {
                      widget.endIconClick(!widget.isObscureText);
                    }
                    setState(() {
                      widget.isObscureText = !widget.isObscureText;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      widget.isObscureText ? widget.endIcon : icPassCodeVisible,
                      width: 20,
                      height: 20,
                      scale: 2.5,
                    ),
                  ),
                )
              : null);
}
