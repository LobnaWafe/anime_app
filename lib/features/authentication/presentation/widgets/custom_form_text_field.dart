
import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  const CustomFormTextField({
    super.key,
    required this.hintText,
    required this.textController,
    required this.check,
  });
  final String hintText;
  final TextEditingController textController;
  final int check;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "feild is required";
        } else if (check == 0 && !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
          return "invalid email";
        } else if (value.length < 6 && check == 1) {
          return "password must be at least 6 character";
        } else {
          return null;
        }
      },
      controller: textController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 10),
        hintText: hintText,
        border: buildOutLineBorder(),
        focusedBorder: buildOutLineBorder(),
      ),
    );
  }

  OutlineInputBorder buildOutLineBorder() {
    return OutlineInputBorder(borderRadius: BorderRadius.circular(12));
  }
}