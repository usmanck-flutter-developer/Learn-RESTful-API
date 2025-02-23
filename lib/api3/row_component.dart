import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RowComponent extends StatelessWidget {
  String title, value;
  RowComponent({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(title), Text(value)],
    );
  }
}
