import 'package:flutter/material.dart';

class Producto {
  String nombre;
  bool comprado;

  Producto({required this.nombre, this.comprado = false});
}

class Ejercicio8ListaCompras extends StatefulWidget {
  const Ejercicio8ListaCompras({super.key});

  @override
  State<Ejercicio8ListaCompras> createState() => _Ejercicio8ListaComprasState();
}

class _Ejercicio8ListaComprasState extends State<Ejercicio8ListaCompras> {
  final TextEditingController _productoController = TextEditingController();
  final List<Producto> _productos = [];

  void _agregarProducto() {
    String nombre = _productoController.text.trim();
    
    if (nombre.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('El nombre del producto no puede estar vacío')),
      );
      return;
    }

    setState(() {
      _productos.add(Producto(nombre: nombre));
      _productoController.clear();
    });
  }

  void _toggleComprado(int index) {
    setState(() {
      _productos[index].comprado = !_productos[index].comprado;
    });
  }

  void _eliminarProducto(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar eliminación'),
          content: Text('¿Estás seguro de que deseas eliminar "${_productos[index].nombre}"?'),
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
                  _productos.removeAt(index);
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

  void _eliminarComprados() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar eliminación'),
          content: const Text('¿Estás seguro de que deseas eliminar todos los productos comprados?'),
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
                  _productos.removeWhere((producto) => producto.comprado);
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

  int get _productosPendientes {
    return _productos.where((producto) => !producto.comprado).length;
  }

  @override
  void dispose() {
    _productoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Compras'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _productoController,
                    decoration: const InputDecoration(
                      labelText: 'Producto',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.shopping_bag),
                    ),
                    onSubmitted: (_) => _agregarProducto(),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: _agregarProducto,
                  icon: const Icon(Icons.add),
                  label: const Text('Agregar'),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Productos pendientes: $_productosPendientes',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                if (_productos.any((p) => p.comprado))
                  TextButton.icon(
                    onPressed: _eliminarComprados,
                    icon: const Icon(Icons.delete_sweep),
                    label: const Text('Eliminar comprados'),
                  ),
              ],
            ),
          ),
          Expanded(
            child: _productos.isEmpty
                ? const Center(
                    child: Text(
                      'No hay productos en la lista',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: _productos.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4,
                        ),
                        child: ListTile(
                          leading: Checkbox(
                            value: _productos[index].comprado,
                            onChanged: (_) => _toggleComprado(index),
                          ),
                          title: Text(
                            _productos[index].nombre,
                            style: TextStyle(
                              decoration: _productos[index].comprado
                                  ? TextDecoration.lineThrough
                                  : null,
                              color: _productos[index].comprado
                                  ? Colors.grey
                                  : null,
                            ),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _eliminarProducto(index),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
