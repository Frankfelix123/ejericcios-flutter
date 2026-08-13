import 'package:flutter/material.dart';

class Ejercicio5ConversorTemperatura extends StatefulWidget {
  const Ejercicio5ConversorTemperatura({super.key});

  @override
  State<Ejercicio5ConversorTemperatura> createState() => _Ejercicio5ConversorTemperaturaState();
}

class _Ejercicio5ConversorTemperaturaState extends State<Ejercicio5ConversorTemperatura> {
  final TextEditingController _temperaturaController = TextEditingController();
  String _tipoConversion = 'Celsius a Fahrenheit';
  String _resultado = '';
  String _mensajeError = '';

  void _convertir() {
    String temperaturaTexto = _temperaturaController.text.trim();
    
    if (temperaturaTexto.isEmpty) {
      setState(() {
        _mensajeError = 'Por favor ingrese una temperatura';
        _resultado = '';
      });
      return;
    }

    double? temperatura = double.tryParse(temperaturaTexto);
    if (temperatura == null) {
      setState(() {
        _mensajeError = 'El campo debe contener un número válido';
        _resultado = '';
      });
      return;
    }

    setState(() {
      _mensajeError = '';
      double resultado;
      
      if (_tipoConversion == 'Celsius a Fahrenheit') {
        resultado = (temperatura * 9 / 5) + 32;
        _resultado = '${resultado.toStringAsFixed(2)} °F';
      } else {
        resultado = (temperatura - 32) * 5 / 9;
        _resultado = '${resultado.toStringAsFixed(2)} °C';
      }
    });
  }

  void _cambiarTipoConversion(String nuevoTipo) {
    setState(() {
      _tipoConversion = nuevoTipo;
      _resultado = '';
      _mensajeError = '';
    });
  }

  @override
  void dispose() {
    _temperaturaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversor de Temperatura'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _temperaturaController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Temperatura',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.thermostat),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Selecciona el tipo de conversión:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('Celsius a Fahrenheit'),
                    value: 'Celsius a Fahrenheit',
                    groupValue: _tipoConversion,
                    onChanged: (value) {
                      if (value != null) {
                        _cambiarTipoConversion(value);
                      }
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('Fahrenheit a Celsius'),
                    value: 'Fahrenheit a Celsius',
                    groupValue: _tipoConversion,
                    onChanged: (value) {
                      if (value != null) {
                        _cambiarTipoConversion(value);
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: _convertir,
              icon: const Icon(Icons.sync_alt),
              label: const Text('Convertir'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
            ),
            const SizedBox(height: 30),
            if (_mensajeError.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.red[100],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.red),
                ),
                child: Text(
                  _mensajeError,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.red[900],
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            if (_resultado.isNotEmpty)
              Card(
                elevation: 4,
                color: Theme.of(context).colorScheme.primaryContainer,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.check_circle,
                        size: 60,
                        color: Colors.green,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Resultado:',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        _resultado,
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
