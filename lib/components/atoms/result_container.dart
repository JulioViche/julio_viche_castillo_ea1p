import 'package:flutter/material.dart';

class ResultContainer extends StatelessWidget {
  final String result;
  final String defaultText;

  const ResultContainer({
    super.key,
    required this.result,
    this.defaultText = 'El resultado aparecerá aquí',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.teal[100],
      child: Text(
        result.isEmpty ? defaultText : result,
        style: const TextStyle(fontSize: 16),
        textAlign: TextAlign.center,
      ),
    );
  }
}