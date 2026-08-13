import 'package:flutter/material.dart';

class Ejercicio7FormularioEstudiante extends StatefulWidget {
  const Ejercicio7FormularioEstudiante({super.key});

  @override
  State<Ejercicio7FormularioEstudiante> createState() => _Ejercicio7FormularioEstudianteState();
}

class _Ejercicio7FormularioEstudianteState extends State<Ejercicio7FormularioEstudiante> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _matriculaController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _edadController = TextEditingController();
  
  String? _carreraSeleccionada;
  String? _sexoSeleccionado;
  bool _terminosAceptados = false;

  final List<String> _carreras = [
    'Ingeniería de Sistemas',
    'Ingeniería Civil',
    'Medicina',
    'Derecho',
    'Administración de Empresas',
    'Psicología',
    'Arquitectura',
  ];

  void _registrarEstudiante() {
    if (_formKey.currentState!.validate()) {
      if (!_terminosAceptados) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Debe aceptar los términos y condiciones')),
        );
        return;
      }

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Registro Exitoso'),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Matrícula: ${_matriculaController.text}'),
                  const SizedBox(height: 8),
                  Text('Nombre: ${_nombreController.text}'),
                  const SizedBox(height: 8),
                  Text('Correo: ${_correoController.text}'),
                  const SizedBox(height: 8),
                  Text('Carrera: $_carreraSeleccionada'),
                  const SizedBox(height: 8),
                  Text('Edad: ${_edadController.text}'),
                  const SizedBox(height: 8),
                  Text('Sexo: $_sexoSeleccionado'),
                  const SizedBox(height: 8),
                  Text('Términos aceptados: Sí'),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cerrar'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _limpiarFormulario();
                },
                child: const Text('Limpiar formulario'),
              ),
            ],
          );
        },
      );
    }
  }

  void _limpiarFormulario() {
    setState(() {
      _matriculaController.clear();
      _nombreController.clear();
      _correoController.clear();
      _edadController.clear();
      _carreraSeleccionada = null;
      _sexoSeleccionado = null;
      _terminosAceptados = false;
    });
  }

  @override
  void dispose() {
    _matriculaController.dispose();
    _nombreController.dispose();
    _correoController.dispose();
    _edadController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario de Estudiante'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _matriculaController,
                decoration: const InputDecoration(
                  labelText: 'Matrícula',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.badge),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'La matrícula es obligatoria';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(
                  labelText: 'Nombre completo',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El nombre es obligatorio';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _correoController,
                decoration: const InputDecoration(
                  labelText: 'Correo electrónico',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El correo es obligatorio';
                  }
                  if (!value.contains('@') || !value.contains('.')) {
                    return 'El correo debe contener @ y un punto';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _carreraSeleccionada,
                decoration: const InputDecoration(
                  labelText: 'Carrera',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.school),
                ),
                items: _carreras.map((String carrera) {
                  return DropdownMenuItem<String>(
                    value: carrera,
                    child: Text(carrera),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _carreraSeleccionada = newValue;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Debe seleccionar una carrera';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _edadController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Edad',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.cake),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'La edad es obligatoria';
                  }
                  int? edad = int.tryParse(value);
                  if (edad == null || edad <= 0) {
                    return 'La edad debe ser un número mayor que cero';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              const Text(
                'Sexo:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  RadioListTile<String>(
                    title: const Text('Masculino'),
                    value: 'Masculino',
                    groupValue: _sexoSeleccionado,
                    onChanged: (value) {
                      setState(() {
                        _sexoSeleccionado = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('Femenino'),
                    value: 'Femenino',
                    groupValue: _sexoSeleccionado,
                    onChanged: (value) {
                      setState(() {
                        _sexoSeleccionado = value;
                      });
                    },
                  ),
                ],
              ),
              if (_sexoSeleccionado == null)
                Padding(
                  padding: const EdgeInsets.only(left: 12, bottom: 8),
                  child: Text(
                    'Debe seleccionar el sexo',
                    style: TextStyle(color: Colors.red[700], fontSize: 12),
                  ),
                ),
              const SizedBox(height: 16),
              CheckboxListTile(
                title: const Text('Acepto los términos y condiciones'),
                value: _terminosAceptados,
                onChanged: (bool? value) {
                  setState(() {
                    _terminosAceptados = value ?? false;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: _registrarEstudiante,
                icon: const Icon(Icons.person_add),
                label: const Text('Registrar'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: _limpiarFormulario,
                icon: const Icon(Icons.clear),
                label: const Text('Limpiar formulario'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
