import 'package:flutter/material.dart';

class EditCustomTextField extends StatelessWidget {
  const EditCustomTextField({
    super.key,
    required this.lableName,
    required this.controller,
  });
  final String lableName;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        label: Text(lableName),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
