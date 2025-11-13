import 'package:flutter/material.dart';
import 'dart:math';
import 'CalculadoraPerruna.dart';

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

  void _navegarACalculadoraPerruna() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CalculadoraPerruna())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora Científica'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Calculadora Científica'),
          const SizedBox(height: 20),
              
          TextField(
            controller: _numeroController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Número',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
              
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _calcularSeno,
                child: const Text('Seno'),
              ),
              ElevatedButton(
                onPressed: _calcularCoseno,
                child: const Text('Coseno'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _calcularTangente,
                child: const Text('Tangente'),
              ),
              ElevatedButton(
                onPressed: _calcularLogaritmoNatural,
                child: const Text('Ln'),
              ),
            ],
          ),
          const SizedBox(height: 20),
              
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              _resultado.isEmpty ? 'Resultado' : _resultado,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
              
          ElevatedButton(
            onPressed: _navegarACalculadoraPerruna,
            child: const Text('Ir a Calculadora Perruna'),
          ),
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