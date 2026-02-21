import 'package:flutter/material.dart';

class InputLabelWidget extends StatelessWidget {
  const InputLabelWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) =>
      Text(text, style: Theme.of(context).textTheme.headlineMedium);
}
