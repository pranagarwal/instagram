import 'package:flutter/material.dart';

class TextFieldd extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final IconButton? iconButton;
  final TextInputType textInputType;
  TextFieldd({
    Key? key,
    required this.textEditingController,
    this.isPass = false,
    required this.hintText,
    required this.textInputType,
    this.iconButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    @override
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintStyle: const TextStyle(
          fontSize: 14,
        ),
        hintText: hintText,
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        fillColor: Colors.grey[850],
        contentPadding: const EdgeInsets.all(15),
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
