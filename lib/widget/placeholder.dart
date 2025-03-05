
import 'package:flutter/material.dart';

class CustomePlaceholder extends StatelessWidget {
  const CustomePlaceholder(this.value,{super.key});

  final String value;
  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      softWrap: true,
      style: const TextStyle(fontSize: 20,color: Colors.black45),
    );
  }
}
