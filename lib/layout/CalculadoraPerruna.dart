import 'package:flutter/material.dart';
import '../components/atoms/custom_button.dart';
import '../components/organisms/dog_age_calculator_form.dart';

class CalculadoraPerruna extends StatefulWidget {
  const CalculadoraPerruna({super.key});

  @override
  State<CalculadoraPerruna> createState() => _CalculadoraPerrunaState();
}

class _CalculadoraPerrunaState extends State<CalculadoraPerruna> {
  final TextEditingController _edadController = TextEditingController();
  String _tamanoRaza = 'pequeña';
  String _resultado = '';

  void _calcularEdadHumana() {
    try {
      int edadPerro = int.parse(_edadController.text);
      int edadHumana;
      
      switch (_tamanoRaza) {
        case 'pequeña':
          edadHumana = edadPerro * 6;
          break;
        case 'mediana':
          edadHumana = edadPerro * 7;
          break;
        case 'grande':
          edadHumana = edadPerro * 8;
          break;
        default:
          edadHumana = edadPerro * 7;
      }

      setState(() {
        _resultado = 'Un perro de raza $_tamanoRaza de $edadPerro años tiene $edadHumana años humanos';
      });
    } catch (e) {
      setState(() {
        _resultado = 'Error: Ingrese una edad válida';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Edad Perruna'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Calculadora de Edad Perruna'),
            const SizedBox(height: 20),
            
            // ORGANISM - Componente complejo que agrupa funcionalidad
            DogAgeCalculatorForm(
              ageController: _edadController,
              selectedSize: _tamanoRaza,
              result: _resultado,
              onSizeChanged: (String? newValue) {
                setState(() {
                  _tamanoRaza = newValue!;
                });
              },
              onCalculate: _calcularEdadHumana,
            ),
            

          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _edadController.dispose();
    super.dispose();
  }
}