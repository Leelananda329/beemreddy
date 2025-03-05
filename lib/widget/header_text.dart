import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  const HeaderText(this.value, {super.key});

  final String value;
  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      softWrap: true,
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    );
  }
}
