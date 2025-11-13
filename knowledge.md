# Knowledge Base - Proyecto Flutter Mobile Development

> **Contexto**: Este knowledge base está basado en un **proyecto Flutter básico** que sirve como fundamento para el aprendizaje de desarrollo móvil. El proyecto implementa conceptos fundamentales como navegación entre pantallas, widgets básicos, y estructura de aplicaciones Flutter. Es un **proyecto de aprendizaje inicial** que establece las bases para desarrollos más complejos.

## 1. Estructura del Proyecto Flutter

### Organización de Carpetas
```
lib/
├── main.dart          # Punto de entrada de la aplicación
├── core/              # Componentes reutilizables
│   └── Btn.dart
└── layout/            # Páginas/Pantallas
    ├── PaginaUno.dart
    └── PaginaDos.dart
```

### Buenas Prácticas de Estructura
- **Separación de responsabilidades**: Componentes en `core/`, pantallas en `layout/`
- **Nomenclatura**: PascalCase para clases, camelCase para archivos
- **Modularización**: Un widget por archivo

## 2. Dart - Fundamentos del Lenguaje

### Sintaxis Básica
```dart
// Importaciones
import 'package:flutter/material.dart';
import '../core/Btn.dart';  // Importación relativa

// Función principal
void main() {
  runApp(PrimerApp());
}

// Comentarios
// Comentario de línea
/* Comentario de bloque */
```

### Tipos de Clases y Widgets

#### StatelessWidget (Sin estado)
```dart
class PrimerApp extends StatelessWidget {
  const PrimerApp({super.key});  // Constructor con super.key
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(/* ... */);
  }
}
```

#### StatefulWidget (Con estado)
```dart
class paginaUno extends StatefulWidget {
  const paginaUno({super.key});

  @override
  State<paginaUno> createState() => _paginaUnoState();
}

class _paginaUnoState extends State<paginaUno> {
  @override
  Widget build(BuildContext context) {
    return Container(/* ... */);
  }
}
```

### Parámetros y Constructores
```dart
class newBoton extends StatelessWidget {
  final String textito;  // Parámetro final (inmutable)
  
  // Constructor con parámetros requeridos
  const newBoton({super.key, required this.textito});
}
```

## 3. Flutter - Estructura de Widgets

### MaterialApp - Configuración Principal
```dart
MaterialApp(
  title: 'Aplicacion de Practica',
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.limeAccent)
  ),
  home: Scaffold(/* ... */)
)
```

### Scaffold - Estructura Básica de Pantalla
```dart
Scaffold(
  appBar: AppBar(
    title: Text('Titulo del AppBar'),
    backgroundColor: Colors.white70,
    actions: [  // Lista de widgets para acciones
      IconButton(onPressed: (){}, icon: Icon(Icons.search)),
      IconButton(onPressed: (){}, icon: Icon(Icons.access_alarm)),
    ]
  ),
  body: paginaUno(),  // Contenido principal
)
```

### Widgets de Layout

#### Container
```dart
Container(
  width: 50,  // Ancho fijo
  child: Column(/* ... */)  // Hijo único
)
```

#### Column (Layout Vertical)
```dart
Column(
  children: [  // Lista de widgets hijos
    Text('Texto 1'),
    Text('Texto 2'),
    newBoton(textito: "Botón")
  ],
)
```

### Widgets Interactivos

#### ElevatedButton
```dart
ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.lightGreen,
  ),
  onPressed: () {  // Función callback
    // Lógica del botón
  },
  child: Text(textito)  // Contenido del botón
)
```

## 4. Navegación Entre Pantallas

### Navigator.push()
```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => pagina_dos())
);
```

### Conceptos de Navegación
- **Context**: Referencia al árbol de widgets
- **MaterialPageRoute**: Transición estándar de Material Design
- **Builder**: Función que construye la nueva pantalla

## 5. Gestión de Estado y Ciclo de Vida

### StatelessWidget vs StatefulWidget
- **StatelessWidget**: Para widgets que no cambian (estáticos)
- **StatefulWidget**: Para widgets que pueden cambiar su estado
- **Estado Privado**: Clases `_State` con underscore (privadas)

### Método build()
```dart
@override
Widget build(BuildContext context) {
  return Widget();  // Siempre debe retornar un Widget
}
```

## 6. Importaciones y Dependencias

### Tipos de Importaciones
```dart
// Framework Flutter
import 'package:flutter/material.dart';

// Importación del propio proyecto
import 'package:app_sem_cinco/layout/PaginaUno.dart';

// Importación relativa
import '../core/Btn.dart';
```

### Configuración en pubspec.yaml
```yaml
name: app_sem_cinco
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
```

## 7. Buenas Prácticas Aplicadas

### Nomenclatura
- **Clases**: PascalCase (`PrimerApp`, `newBoton`)
- **Variables**: camelCase (`textito`)
- **Archivos**: PascalCase para widgets (`PaginaUno.dart`)

### Organización del Código
- Un widget por archivo
- Separación lógica en carpetas (`core/`, `layout/`)
- Comentarios explicativos en español
- Constructores con `super.key` para performance

### Reutilización de Componentes
- Widgets personalizados (`newBoton`)
- Parámetros configurables (`textito`)
- Separación de lógica y presentación

## 8. Colores y Temas

### Definición de Colores
```dart
// Colores predefinidos
Colors.limeAccent
Colors.white70
Colors.lightGreen

// Esquema de colores desde semilla
ColorScheme.fromSeed(seedColor: Colors.limeAccent)
```

### Aplicación de Temas
```dart
theme: ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.limeAccent)
)
```

## 9. Conceptos de Testing (Preparado pero no implementado)

### Estructura de Tests
```dart
// Importación para tests
import 'package:flutter_test/flutter_test.dart';

// Test básico (comentado en el proyecto)
testWidgets('Description', (WidgetTester tester) async {
  // Lógica de test
});
```

## 10. Integración Android

### MainActivity.kt
```kotlin
package com.denisemimi.app_sem_cinco
import io.flutter.embedding.android.FlutterActivity
class MainActivity : FlutterActivity()
```

### Conceptos Aprendidos
- **Kotlin**: Lenguaje nativo de Android
- **FlutterActivity**: Clase base para integración Flutter-Android
- **Package**: Organización de código en Android

## 11. Patrones de Diseño Identificados

### Widget Composition Pattern
- Composición de widgets pequeños para crear interfaces complejas
- Reutilización a través de parámetros

### Builder Pattern
- Uso en `MaterialPageRoute(builder: (context) => Widget())`
- Construcción dinámica de widgets

### Observer Pattern (Implícito)
- `StatefulWidget` y `setState()` para reactivity
- Context para comunicación entre widgets

---

## Resumen de Tecnologías y Conceptos

**Lenguajes**: Dart, Kotlin  
**Framework**: Flutter  
**Paradigmas**: Programación orientada a objetos, Programación reactiva  
**Patrones**: Widget composition, Builder, Observer  
**Arquitectura**: Component-based architecture  
**Navegación**: Stack-based navigation  
**Estado**: Stateful/Stateless pattern