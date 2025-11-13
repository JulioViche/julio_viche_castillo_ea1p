import 'package:flutter/material.dart';

class SizeSelector extends StatelessWidget {
  final String selectedSize;
  final Function(String?) onChanged;

  const SizeSelector({
    super.key,
    required this.selectedSize,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Tamaño de raza:'),
        DropdownButton<String>(
          value: selectedSize,
          items: const [
            DropdownMenuItem(value: 'pequeña', child: Text('Pequeña')),
            DropdownMenuItem(value: 'mediana', child: Text('Mediana')),
            DropdownMenuItem(value: 'grande', child: Text('Grande')),
          ],
          onChanged: onChanged,
        ),
      ],
    );
  }
}