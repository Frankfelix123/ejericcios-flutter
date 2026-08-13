import 'package:flutter/material.dart';

class Ejercicio6Semaforo extends StatefulWidget {
  const Ejercicio6Semaforo({super.key});

  @override
  State<Ejercicio6Semaforo> createState() => _Ejercicio6SemaforoState();
}

class _Ejercicio6SemaforoState extends State<Ejercicio6Semaforo> {
  String _luzActual = 'rojo';

  void _cambiarLuz() {
    setState(() {
      if (_luzActual == 'rojo') {
        _luzActual = 'verde';
      } else if (_luzActual == 'verde') {
        _luzActual = 'amarillo';
      } else {
        _luzActual = 'rojo';
      }
    });
  }

  Color _getColorLuz(String luz) {
    switch (luz) {
      case 'rojo':
        return _luzActual == 'rojo' ? Colors.red : Colors.red.withOpacity(0.3);
      case 'amarillo':
        return _luzActual == 'amarillo' ? Colors.yellow : Colors.yellow.withOpacity(0.3);
      case 'verde':
        return _luzActual == 'verde' ? Colors.green : Colors.green.withOpacity(0.3);
      default:
        return Colors.grey;
    }
  }

  String _getMensaje() {
    switch (_luzActual) {
      case 'rojo':
        return 'Deténgase';
      case 'amarillo':
        return 'Prepárese';
      case 'verde':
        return 'Puede avanzar';
      default:
        return '';
    }
  }

  IconData _getIcono() {
    switch (_luzActual) {
      case 'rojo':
        return Icons.block;
      case 'amarillo':
        return Icons.warning;
      case 'verde':
        return Icons.check_circle;
      default:
        return Icons.traffic;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Semáforo Interactivo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: _getColorLuz('rojo'),
                      shape: BoxShape.circle,
                      boxShadow: _luzActual == 'rojo'
                          ? [
                              BoxShadow(
                                color: Colors.red.withOpacity(0.5),
                                blurRadius: 20,
                                spreadRadius: 10,
                              ),
                            ]
                          : [],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: _getColorLuz('amarillo'),
                      shape: BoxShape.circle,
                      boxShadow: _luzActual == 'amarillo'
                          ? [
                              BoxShadow(
                                color: Colors.yellow.withOpacity(0.5),
                                blurRadius: 20,
                                spreadRadius: 10,
                              ),
                            ]
                          : [],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: _getColorLuz('verde'),
                      shape: BoxShape.circle,
                      boxShadow: _luzActual == 'verde'
                          ? [
                              BoxShadow(
                                color: Colors.green.withOpacity(0.5),
                                blurRadius: 20,
                                spreadRadius: 10,
                              ),
                            ]
                          : [],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Icon(
              _getIcono(),
              size: 60,
              color: _luzActual == 'rojo'
                  ? Colors.red
                  : _luzActual == 'amarillo'
                      ? Colors.yellow[700]
                      : Colors.green,
            ),
            const SizedBox(height: 20),
            Text(
              _getMensaje(),
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: _luzActual == 'rojo'
                    ? Colors.red
                    : _luzActual == 'amarillo'
                        ? Colors.yellow[700]
                        : Colors.green,
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton.icon(
              onPressed: _cambiarLuz,
              icon: const Icon(Icons.traffic),
              label: const Text('Cambiar luz'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
