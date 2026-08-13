import 'package:flutter/material.dart';

class Ejercicio4CalculadoraPropinas extends StatefulWidget {
  const Ejercicio4CalculadoraPropinas({super.key});

  @override
  State<Ejercicio4CalculadoraPropinas> createState() => _Ejercicio4CalculadoraPropinasState();
}

class _Ejercicio4CalculadoraPropinasState extends State<Ejercicio4CalculadoraPropinas> {
  final TextEditingController _montoController = TextEditingController();
  double _porcentajePropina = 10.0;
  double _valorPropina = 0.0;
  double _totalPagar = 0.0;
  String _mensajeError = '';

  void _calcularPropina() {
    String montoTexto = _montoController.text.trim();
    
    if (montoTexto.isEmpty) {
      setState(() {
        _mensajeError = 'Por favor ingrese el monto de la cuenta';
        _valorPropina = 0.0;
        _totalPagar = 0.0;
      });
      return;
    }

    double? monto = double.tryParse(montoTexto);
    if (monto == null || monto <= 0) {
      setState(() {
        _mensajeError = 'El monto debe ser mayor que cero';
        _valorPropina = 0.0;
        _totalPagar = 0.0;
      });
      return;
    }

    setState(() {
      _mensajeError = '';
      _valorPropina = monto * (_porcentajePropina / 100);
      _totalPagar = monto + _valorPropina;
    });
  }

  void _reiniciar() {
    setState(() {
      _montoController.clear();
      _porcentajePropina = 10.0;
      _valorPropina = 0.0;
      _totalPagar = 0.0;
      _mensajeError = '';
    });
  }

  @override
  void dispose() {
    _montoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Propinas'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _montoController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Monto de la cuenta',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.attach_money),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Selecciona el porcentaje de propina:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildPorcentajeButton(5),
                _buildPorcentajeButton(10),
                _buildPorcentajeButton(15),
                _buildPorcentajeButton(20),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Porcentaje seleccionado: $_porcentajePropina%',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: _calcularPropina,
              icon: const Icon(Icons.calculate),
              label: const Text('Calcular'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _reiniciar,
              icon: const Icon(Icons.refresh),
              label: const Text('Reiniciar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
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
            if (_valorPropina > 0) ...[
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        'Valor de la propina: RD\$${_valorPropina.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      const Divider(height: 30),
                      Text(
                        'Total a pagar: RD\$${_totalPagar.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildPorcentajeButton(double porcentaje) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _porcentajePropina = porcentaje;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: _porcentajePropina == porcentaje
            ? Theme.of(context).colorScheme.primary
            : Colors.grey[300],
        foregroundColor: _porcentajePropina == porcentaje
            ? Colors.white
            : Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      ),
      child: Text('$porcentaje%'),
    );
  }
}
