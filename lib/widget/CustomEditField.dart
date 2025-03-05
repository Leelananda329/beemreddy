import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomEditfield extends StatelessWidget {
  const CustomEditfield(this.value,{super.key,
    this.width,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.inputFormatters});

  final String value;
  final int? width;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      minLines: width??1,
      maxLines: 5,
      keyboardType:keyboardType??TextInputType.text,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        hintText: value,
        border: const OutlineInputBorder(), // Adds a border around the TextField
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), // Adds padding
      ),
    )
    ;
  }
}
