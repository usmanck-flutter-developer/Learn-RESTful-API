import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RowComponentEx4 extends StatelessWidget {
  String title, value;
  RowComponentEx4({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(title), Text(value)],
    );
  }
}
