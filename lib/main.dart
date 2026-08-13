import 'package:flutter/material.dart';
import 'exercises/ejercicio1_tarjeta_presentacion.dart';
import 'exercises/ejercicio2_contador_personas.dart';
import 'exercises/ejercicio3_calculadora_edad.dart';
import 'exercises/ejercicio4_calculadora_propinas.dart';
import 'exercises/ejercicio5_conversor_temperatura.dart';
import 'exercises/ejercicio6_semaforo.dart';
import 'exercises/ejercicio7_formulario_estudiante.dart';
import 'exercises/ejercicio8_lista_compras.dart';
import 'exercises/ejercicio9_catalogo_productos.dart';
import 'exercises/ejercicio10_tareas_pendientes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicios Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MenuPrincipal(),
    );
  }
}

class MenuPrincipal extends StatelessWidget {
  const MenuPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicios Flutter'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildExerciseCard(
            context,
            '1. Tarjeta de Presentación',
            'Muestra datos personales con diseño organizado',
            Icons.person,
            const Ejercicio1TarjetaPresentacion(),
          ),
          _buildExerciseCard(
            context,
            '2. Contador de Personas',
            'Lleva el conteo de personas que entran y salen',
            Icons.people,
            const Ejercicio2ContadorPersonas(),
          ),
          _buildExerciseCard(
            context,
            '3. Calculadora de Edad',
            'Calcula la edad a partir del año de nacimiento',
            Icons.cake,
            const Ejercicio3CalculadoraEdad(),
          ),
          _buildExerciseCard(
            context,
            '4. Calculadora de Propinas',
            'Calcula propina y total a pagar en restaurante',
            Icons.restaurant,
            const Ejercicio4CalculadoraPropinas(),
          ),
          _buildExerciseCard(
            context,
            '5. Conversor de Temperatura',
            'Convierte entre Celsius y Fahrenheit',
            Icons.thermostat,
            const Ejercicio5ConversorTemperatura(),
          ),
          _buildExerciseCard(
            context,
            '6. Semáforo Interactivo',
            'Simula el funcionamiento de un semáforo',
            Icons.traffic,
            const Ejercicio6Semaforo(),
          ),
          _buildExerciseCard(
            context,
            '7. Formulario de Estudiante',
            'Registra datos básicos de un estudiante',
            Icons.school,
            const Ejercicio7FormularioEstudiante(),
          ),
          _buildExerciseCard(
            context,
            '8. Lista de Compras',
            'Registra productos que necesitas comprar',
            Icons.shopping_cart,
            const Ejercicio8ListaCompras(),
          ),
          _buildExerciseCard(
            context,
            '9. Catálogo de Productos',
            'Muestra un catálogo de productos con detalles',
            Icons.inventory_2,
            const Ejercicio9CatalogoProductos(),
          ),
          _buildExerciseCard(
            context,
            '10. Tareas Pendientes',
            'Administra tareas personales con prioridad',
            Icons.task,
            const Ejercicio10TareasPendientes(),
          ),
        ],
      ),
    );
  }

  Widget _buildExerciseCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    Widget exercisePage,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => exercisePage),
          );
        },
      ),
    );
  }
}
