import 'package:flutter/material.dart';

enum Prioridad { baja, media, alta }

class Tarea {
  String titulo;
  String descripcion;
  DateTime fechaLimite;
  Prioridad prioridad;
  bool completada;

  Tarea({
    required this.titulo,
    required this.descripcion,
    required this.fechaLimite,
    required this.prioridad,
    this.completada = false,
  });
}

class Ejercicio10TareasPendientes extends StatefulWidget {
  const Ejercicio10TareasPendientes({super.key});

  @override
  State<Ejercicio10TareasPendientes> createState() => _Ejercicio10TareasPendientesState();
}

class _Ejercicio10TareasPendientesState extends State<Ejercicio10TareasPendientes> {
  final List<Tarea> _tareas = [];

  int get _totalTareas => _tareas.length;
  int get _tareasPendientes => _tareas.where((t) => !t.completada).length;
  int get _tareasCompletadas => _tareas.where((t) => t.completada).length;

  void _agregarTarea(Tarea tarea) {
    setState(() {
      _tareas.add(tarea);
    });
  }

  void _toggleCompletada(int index) {
    setState(() {
      _tareas[index].completada = !_tareas[index].completada;
    });
  }

  void _eliminarTarea(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar eliminación'),
          content: Text('¿Estás seguro de que deseas eliminar "${_tareas[index].titulo}"?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _tareas.removeAt(index);
                });
                Navigator.of(context).pop();
              },
              child: const Text('Eliminar'),
            ),
          ],
        );
      },
    );
  }

  void _editarTarea(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FormularioTarea(
          tareaExistente: _tareas[index],
          onGuardar: (tareaEditada) {
            setState(() {
              _tareas[index] = tareaEditada;
            });
          },
        ),
      ),
    );
  }

  Color _getColorPrioridad(Prioridad prioridad) {
    switch (prioridad) {
      case Prioridad.baja:
        return Colors.green;
      case Prioridad.media:
        return Colors.orange;
      case Prioridad.alta:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tareas Pendientes'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatCard('Total', _totalTareas, Colors.blue),
                _buildStatCard('Pendientes', _tareasPendientes, Colors.orange),
                _buildStatCard('Completadas', _tareasCompletadas, Colors.green),
              ],
            ),
          ),
          Expanded(
            child: _tareas.isEmpty
                ? const Center(
                    child: Text(
                      'No hay tareas pendientes',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: _tareas.length,
                    itemBuilder: (context, index) {
                      final tarea = _tareas[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: ListTile(
                          leading: Checkbox(
                            value: tarea.completada,
                            onChanged: (_) => _toggleCompletada(index),
                          ),
                          title: Text(
                            tarea.titulo,
                            style: TextStyle(
                              decoration: tarea.completada
                                  ? TextDecoration.lineThrough
                                  : null,
                              color: tarea.completada ? Colors.grey : null,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tarea.descripcion,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today,
                                    size: 14,
                                    color: Colors.grey[600],
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Fecha: ${tarea.fechaLimite.day}/${tarea.fechaLimite.month}/${tarea.fechaLimite.year}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: _getColorPrioridad(tarea.prioridad),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      tarea.prioridad.name.toUpperCase(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit, color: Colors.blue),
                                onPressed: () => _editarTarea(index),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () => _eliminarTarea(index),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormularioTarea(
                onGuardar: _agregarTarea,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildStatCard(String label, int value, Color color) {
    return Column(
      children: [
        Text(
          '$value',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}

class FormularioTarea extends StatefulWidget {
  final Tarea? tareaExistente;
  final Function(Tarea) onGuardar;

  const FormularioTarea({
    super.key,
    this.tareaExistente,
    required this.onGuardar,
  });

  @override
  State<FormularioTarea> createState() => _FormularioTareaState();
}

class _FormularioTareaState extends State<FormularioTarea> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();
  
  DateTime? _fechaLimite;
  Prioridad _prioridad = Prioridad.media;

  @override
  void initState() {
    super.initState();
    if (widget.tareaExistente != null) {
      _tituloController.text = widget.tareaExistente!.titulo;
      _descripcionController.text = widget.tareaExistente!.descripcion;
      _fechaLimite = widget.tareaExistente!.fechaLimite;
      _prioridad = widget.tareaExistente!.prioridad;
    }
  }

  void _seleccionarFecha() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _fechaLimite ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _fechaLimite = picked;
      });
    }
  }

  void _guardar() {
    if (_formKey.currentState!.validate()) {
      if (_fechaLimite == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Debe seleccionar una fecha límite')),
        );
        return;
      }

      final tarea = Tarea(
        titulo: _tituloController.text,
        descripcion: _descripcionController.text,
        fechaLimite: _fechaLimite!,
        prioridad: _prioridad,
        completada: widget.tareaExistente?.completada ?? false,
      );

      widget.onGuardar(tarea);
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _tituloController.dispose();
    _descripcionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tareaExistente == null 
            ? 'Nueva Tarea' 
            : 'Editar Tarea'),
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
                controller: _tituloController,
                decoration: const InputDecoration(
                  labelText: 'Título',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.title),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El título es obligatorio';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descripcionController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Descripción',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.description),
                ),
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: _seleccionarFecha,
                child: InputDecorator(
                  decoration: const InputDecoration(
                    labelText: 'Fecha límite',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.calendar_today),
                  ),
                  child: Text(
                    _fechaLimite == null
                        ? 'Seleccionar fecha'
                        : '${_fechaLimite!.day}/${_fechaLimite!.month}/${_fechaLimite!.year}',
                  ),
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<Prioridad>(
                value: _prioridad,
                decoration: const InputDecoration(
                  labelText: 'Prioridad',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.flag),
                ),
                items: Prioridad.values.map((Prioridad prioridad) {
                  return DropdownMenuItem<Prioridad>(
                    value: prioridad,
                    child: Text(prioridad.name.toUpperCase()),
                  );
                }).toList(),
                onChanged: (Prioridad? newValue) {
                  setState(() {
                    _prioridad = newValue!;
                  });
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: _guardar,
                icon: const Icon(Icons.save),
                label: const Text('Guardar'),
                style: ElevatedButton.styleFrom(
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
