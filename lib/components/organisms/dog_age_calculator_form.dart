import 'package:flutter/material.dart';
import '../atoms/result_container.dart';
import '../molecules/dog_image_widget.dart';
import '../molecules/age_input_form.dart';

class DogAgeCalculatorForm extends StatelessWidget {
  final TextEditingController ageController;
  final String selectedSize;
  final String result;
  final Function(String?) onSizeChanged;
  final VoidCallback onCalculate;

  const DogAgeCalculatorForm({
    super.key,
    required this.ageController,
    required this.selectedSize,
    required this.result,
    required this.onSizeChanged,
    required this.onCalculate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DogImageWidget(
          imageUrl: 'https://pixnio.com/free-images/2024/04/30/2024-04-30-06-59-43-1536x1024.jpg',
        ),
        const SizedBox(height: 20),
        AgeInputForm(
          controller: ageController,
          selectedSize: selectedSize,
          onSizeChanged: onSizeChanged,
          onCalculate: onCalculate,
        ),
        const SizedBox(height: 20),
        ResultContainer(result: result),
      ],
    );
  }
}