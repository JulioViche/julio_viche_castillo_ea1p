import 'package:flutter/material.dart';

class CalculadoraPerruna extends StatefulWidget {
  const CalculadoraPerruna({super.key});

  @override
  State<CalculadoraPerruna> createState() => _CalculadoraPerrunaState();
}

class _CalculadoraPerrunaState extends State<CalculadoraPerruna> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora Perruna'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Calculadora Perruna'),
          const SizedBox(height: 20),
          const Text(
            'Esta es la segunda pantalla.\n\n'
            'Aquí se pueden implementar más funciones.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Volver'),
          ),
        ],
      ),
    );
  }
}