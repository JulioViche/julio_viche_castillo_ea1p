import 'package:flutter/material.dart';
import 'dart:math';
import 'CalculadoraPerruna.dart';
import '../components/atoms/custom_button.dart';
import '../components/organisms/scientific_calculator_form.dart';

// TEMPLATE/PAGE - Estructura completa usando Atomic Design
class CalculadoraCientifica extends StatefulWidget {
  const CalculadoraCientifica({super.key});

  @override
  State<CalculadoraCientifica> createState() => _CalculadoraCientificaState();
}

class _CalculadoraCientificaState extends State<CalculadoraCientifica> {
  final TextEditingController _numeroController = TextEditingController();
  String _resultado = '';

  void _calcularSeno() {
    try {
      double numero = double.parse(_numeroController.text);
      double resultado = sin(numero);
      setState(() {
        _resultado = 'sen($numero) = ${resultado.toStringAsFixed(6)}';
      }); 
    } catch (e) {
      setState(() {
        _resultado = 'Error: Ingrese un número válido';
      });
    }
  }

  void _calcularCoseno() {
    try {
      double numero = double.parse(_numeroController.text);
      double resultado = cos(numero);
      setState(() {
        _resultado = 'cos($numero) = ${resultado.toStringAsFixed(6)}';
      });
    } catch (e) {
      setState(() {
        _resultado = 'Error: Ingrese un número válido';
      });
    }
  }

  void _calcularTangente() {
    try {
      double numero = double.parse(_numeroController.text);
      double resultado = tan(numero);
      setState(() {
        _resultado = 'tan($numero) = ${resultado.toStringAsFixed(6)}';
      });
    } catch (e) {
      setState(() {
        _resultado = 'Error: Ingrese un número válido';
      });
    }
  }

  void _calcularLogaritmoNatural() {
    try {
      double numero = double.parse(_numeroController.text);
      if (numero <= 0) {
        setState(() {
          _resultado = 'Error: El logaritmo natural requiere un número positivo';
        });
        return;
      }
      double resultado = log(numero);
      setState(() {
        _resultado = 'ln($numero) = ${resultado.toStringAsFixed(6)}';
      });
    } catch (e) {
      setState(() {
        _resultado = 'Error: Ingrese un número válido';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora Científica'),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CalculadoraPerruna())
            ),
            icon: const Icon(Icons.pets),
            tooltip: 'Ir a Calculadora Perruna',
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Calculadora Científica'),
          const SizedBox(height: 20),
          
          // ORGANISM - Formulario completo de calculadora científica
          ScientificCalculatorForm(
            numberController: _numeroController,
            result: _resultado,
            mathOperations: [
              _calcularSeno,
              _calcularCoseno,
              _calcularTangente,
              _calcularLogaritmoNatural,
            ],
          ),
          
          const SizedBox(height: 20),
          
        ],
      ),
    );
  }

  @override
  void dispose() {
    _numeroController.dispose();
    super.dispose();
  }
}