import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {

  const CustomText(this.value, {super.key});

  final String value;
  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      softWrap: true,
      style: const TextStyle(fontSize: 18),
    );
  }
}
