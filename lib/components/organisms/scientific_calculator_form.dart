import 'package:flutter/material.dart';
import '../atoms/custom_text_field.dart';
import '../atoms/result_container.dart';
import '../molecules/calculator_button_row.dart';

class ScientificCalculatorForm extends StatelessWidget {
  final TextEditingController numberController;
  final String result;
  final List<VoidCallback> mathOperations;

  const ScientificCalculatorForm({
    super.key,
    required this.numberController,
    required this.result,
    required this.mathOperations,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: numberController,
          labelText: 'Número',
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 10),
        CalculatorButtonRow(
          buttonTexts: const ['Seno', 'Coseno'],
          onPressedCallbacks: [mathOperations[0], mathOperations[1]],
        ),
        CalculatorButtonRow(
          buttonTexts: const ['Tangente', 'Ln'],
          onPressedCallbacks: [mathOperations[2], mathOperations[3]],
        ),
        const SizedBox(height: 20),
        ResultContainer(result: result, defaultText: 'Resultado'),
      ],
    );
  }
}