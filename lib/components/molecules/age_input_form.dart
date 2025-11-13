import 'package:flutter/material.dart';
import '../atoms/custom_text_field.dart';
import '../atoms/custom_button.dart';
import 'size_selector.dart';

class AgeInputForm extends StatelessWidget {
  final TextEditingController controller;
  final String selectedSize;
  final Function(String?) onSizeChanged;
  final VoidCallback onCalculate;

  const AgeInputForm({
    super.key,
    required this.controller,
    required this.selectedSize,
    required this.onSizeChanged,
    required this.onCalculate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: controller,
          labelText: 'Edad del perro (años)',
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 20),
        SizeSelector(
          selectedSize: selectedSize,
          onChanged: onSizeChanged,
        ),
        const SizedBox(height: 20),
        CustomButton(
          onPressed: onCalculate,
          text: 'Calcular Edad Humana',
        ),
      ],
    );
  }
}