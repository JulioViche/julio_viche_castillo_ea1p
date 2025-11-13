import 'package:flutter/material.dart';
import '../atoms/custom_button.dart';

class CalculatorButtonRow extends StatelessWidget {
  final List<String> buttonTexts;
  final List<VoidCallback> onPressedCallbacks;

  const CalculatorButtonRow({
    super.key,
    required this.buttonTexts,
    required this.onPressedCallbacks,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(buttonTexts.length, (index) {
        return CustomButton(
          onPressed: onPressedCallbacks[index],
          text: buttonTexts[index],
        );
      }),
    );
  }
}