import 'package:flutter/material.dart';

class Ejercicio1TarjetaPresentacion extends StatelessWidget {
  const Ejercicio1TarjetaPresentacion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarjeta de Presentación'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/avatar_placeholder.png'),
                    child: Icon(Icons.person, size: 60),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Frank Felix',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Desarrollador Flutter',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.phone, color: Colors.blue),
                              const SizedBox(width: 12),
                              const Text(
                                '+1 809-555-0123',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          const Divider(height: 24),
                          Row(
                            children: [
                              const Icon(Icons.email, color: Colors.red),
                              const SizedBox(width: 12),
                              const Text(
                                'frank.felix@email.com',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          const Divider(height: 24),
                          Row(
                            children: [
                              const Icon(Icons.location_on, color: Colors.green),
                              const SizedBox(width: 12),
                              const Text(
                                'Santo Domingo, República Dominicana',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Desarrollador apasionado por crear aplicaciones móviles '
                    'con tecnología Flutter. Me encanta aprender nuevas tecnologías '
                    'y compartir conocimiento con la comunidad.',
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
