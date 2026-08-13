import 'package:flutter/material.dart';

class Ejercicio3CalculadoraEdad extends StatefulWidget {
  const Ejercicio3CalculadoraEdad({super.key});

  @override
  State<Ejercicio3CalculadoraEdad> createState() => _Ejercicio3CalculadoraEdadState();
}

class _Ejercicio3CalculadoraEdadState extends State<Ejercicio3CalculadoraEdad> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _anioController = TextEditingController();
  String _resultado = '';

  void _calcularEdad() {
    String nombre = _nombreController.text.trim();
    String anioTexto = _anioController.text.trim();

    if (nombre.isEmpty) {
      setState(() {
        _resultado = 'Error: El nombre no puede estar vacío';
      });
      return;
    }

    int? anio = int.tryParse(anioTexto);
    if (anio == null) {
      setState(() {
        _resultado = 'Error: El año debe ser un valor numérico';
      });
      return;
    }

    int anioActual = DateTime.now().year;

    if (anio > anioActual) {
      setState(() {
        _resultado = 'Error: El año no puede ser mayor al año actual';
      });
      return;
    }

    if (anio < 1900) {
      setState(() {
        _resultado = 'Error: El año debe ser mayor que 1900';
      });
      return;
    }

    int edad = anioActual - anio;
    setState(() {
      _resultado = '$nombre, tienes aproximadamente $edad años';
    });
  }

  void _limpiarCampos() {
    setState(() {
      _nombreController.clear();
      _anioController.clear();
      _resultado = '';
    });
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _anioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Edad'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nombreController,
              decoration: const InputDecoration(
                labelText: 'Nombre',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _anioController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Año de nacimiento',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.calendar_today),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: _calcularEdad,
                  icon: const Icon(Icons.calculate),
                  label: const Text('Calcular edad'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: _limpiarCampos,
                  icon: const Icon(Icons.clear),
                  label: const Text('Limpiar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            if (_resultado.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: _resultado.startsWith('Error') 
                      ? Colors.red[100] 
                      : Colors.green[100],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: _resultado.startsWith('Error') 
                        ? Colors.red 
                        : Colors.green,
                  ),
                ),
                child: Text(
                  _resultado,
                  style: TextStyle(
                    fontSize: 18,
                    color: _resultado.startsWith('Error') 
                        ? Colors.red[900] 
                        : Colors.green[900],
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
