import 'package:flutter/material.dart';

class Producto {
  final String nombre;
  final double precio;
  final String descripcion;
  final String imagen;
  final String categoria;

  const Producto({
    required this.nombre,
    required this.precio,
    required this.descripcion,
    required this.imagen,
    required this.categoria,
  });
}

class Ejercicio9CatalogoProductos extends StatelessWidget {
  const Ejercicio9CatalogoProductos({super.key});

  final List<Producto> _productos = const [
    Producto(
      nombre: 'Computadora Portátil',
      precio: 25000.00,
      descripcion: 'Laptop de alto rendimiento con procesador Intel i7, 16GB RAM y SSD de 512GB. Ideal para trabajo y gaming.',
      imagen: '💻',
      categoria: 'Electrónica',
    ),
    Producto(
      nombre: 'Teléfono Móvil',
      precio: 18000.00,
      descripcion: 'Smartphone con pantalla AMOLED de 6.5 pulgadas, cámara de 108MP y batería de 5000mAh.',
      imagen: '📱',
      categoria: 'Electrónica',
    ),
    Producto(
      nombre: 'Audífonos Bluetooth',
      precio: 2500.00,
      descripcion: 'Audífonos inalámbricos con cancelación de ruido y hasta 30 horas de batería.',
      imagen: '🎧',
      categoria: 'Audio',
    ),
    Producto(
      nombre: 'Teclado Mecánico',
      precio: 3500.00,
      descripcion: 'Teclado gaming RGB con switches mecánicos azules y retroiluminación personalizable.',
      imagen: '⌨️',
      categoria: 'Accesorios',
    ),
    Producto(
      nombre: 'Reloj Inteligente',
      precio: 4500.00,
      descripcion: 'Smartwatch con monitor de ritmo cardíaco, GPS integrado y resistencia al agua.',
      imagen: '⌚',
      categoria: 'Wearables',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Productos'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: _productos.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetalleProducto(
                      producto: _productos[index],
                    ),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 120,
                    color: Theme.of(context).colorScheme.primaryContainer,
                    child: Center(
                      child: Text(
                        _productos[index].imagen,
                        style: const TextStyle(fontSize: 60),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _productos[index].nombre,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'RD\$${_productos[index].precio.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            _productos[index].categoria,
                            style: const TextStyle(fontSize: 10),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetalleProducto extends StatelessWidget {
  final Producto producto;

  const DetalleProducto({super.key, required this.producto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle del Producto'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 250,
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Center(
                child: Text(
                  producto.imagen,
                  style: const TextStyle(fontSize: 120),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    producto.nombre,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      producto.categoria,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'RD\$${producto.precio.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Descripción:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    producto.descripcion,
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Regresar al catálogo'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
