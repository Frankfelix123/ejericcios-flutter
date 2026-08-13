# Ejercicios Flutter

Proyecto Flutter que contiene 10 ejercicios prácticos para aprender desarrollo de aplicaciones móviles.

## Ejercicios Incluidos

1. **Tarjeta de Presentación Personal** - Muestra datos personales con diseño organizado
2. **Contador de Personas** - Lleva el conteo de personas que entran y salen
3. **Calculadora de Edad** - Calcula la edad a partir del año de nacimiento
4. **Calculadora de Propinas** - Calcula propina y total a pagar en restaurante
5. **Conversor de Temperatura** - Convierte entre Celsius y Fahrenheit
6. **Semáforo Interactivo** - Simula el funcionamiento de un semáforo
7. **Formulario de Estudiante** - Registra datos básicos de un estudiante
8. **Lista de Compras** - Registra productos que necesitas comprar
9. **Catálogo de Productos** - Muestra un catálogo de productos con detalles
10. **Tareas Pendientes** - Administra tareas personales con prioridad

## Requisitos Previos

- Flutter SDK instalado (versión 3.0.0 o superior)
- Un editor de código recomendado (VS Code, Android Studio, o IntelliJ IDEA)

## Cómo Ejecutar el Proyecto

1. Navega al directorio del proyecto:
   ```bash
   cd ejercicios
   ```

2. Obtén las dependencias:
   ```bash
   flutter pub get
   ```

3. Ejecuta la aplicación:
   ```bash
   flutter run
   ```

## Estructura del Proyecto

```
lib/
├── main.dart                          # Punto de entrada y menú principal
└── exercises/
    ├── ejercicio1_tarjeta_presentacion.dart
    ├── ejercicio2_contador_personas.dart
    ├── ejercicio3_calculadora_edad.dart
    ├── ejercicio4_calculadora_propinas.dart
    ├── ejercicio5_conversor_temperatura.dart
    ├── ejercicio6_semaforo.dart
    ├── ejercicio7_formulario_estudiante.dart
    ├── ejercicio8_lista_compras.dart
    ├── ejercicio9_catalogo_productos.dart
    └── ejercicio10_tareas_pendientes.dart
```

## Características por Ejercicio

### Ejercicio 1: Tarjeta de Presentación
- Usa Scaffold, AppBar, Column, Row, CircleAvatar, Text, Icon, Card, Container
- Fotografía circular
- Nombre con tamaño de letra mayor
- Teléfono y correo con iconos
- Información centrada y adaptada

### Ejercicio 2: Contador de Personas
- StatefulWidget con setState
- Contador inicia en cero
- No permite valores menores que cero
- Actualización inmediata
- Confirmación para reiniciar
- Mensaje "Capacidad alcanzada" al llegar a 20

### Ejercicio 3: Calculadora de Edad
- TextField con TextEditingController
- Validación de nombre no vacío
- Validación de año numérico
- Validación de año no mayor al actual
- Validación de año mayor a 1900
- Mensajes de error
- Botón para limpiar campos

### Ejercicio 4: Calculadora de Propinas
- Monto mayor que cero
- Selección de porcentaje (5%, 10%, 15%, 20%)
- Resultados con dos decimales
- Botón de reinicio
- Mensaje de error para monto inválido

### Ejercicio 5: Conversor de Temperatura
- Campo para temperatura
- Dos opciones de conversión
- Validación de número
- Resultado con dos decimales
- Indicación de unidad (°C o °F)
- Limpieza al cambiar tipo de conversión
- Botón Convertir

### Ejercicio 6: Semáforo Interactivo
- Inicia en rojo
- Luces con Container circular
- Mensajes según luz (Deténgase, Prepárese, Puede avanzar)
- Cambio de color y mensaje con botón
- Icono relacionado con tránsito

### Ejercicio 7: Formulario de Estudiante
- Todos los campos obligatorios
- Validación de edad mayor que cero
- Validación de correo con @ y punto
- Carrera en lista desplegable
- Sexo con botones de opción
- Términos con Checkbox
- Validación antes de registro
- Opción para limpiar formulario

### Ejercicio 8: Lista de Compras
- No agrega productos con nombres vacíos
- ListView para mostrar productos
- Checkbox para cada producto
- Texto tachado al marcar como comprado
- Eliminación con confirmación
- Muestra cantidad de productos pendientes
- Botón para eliminar comprados

### Ejercicio 9: Catálogo de Productos
- Clase Producto con propiedades
- Lista de objetos Producto
- GridView.builder para catálogo
- Tarjetas con imagen, nombre y precio
- Navegación a pantalla de detalles
- Datos enviados entre pantallas
- Botón para regresar

### Ejercicio 10: Tareas Pendientes
- Pantalla principal con lista de tareas
- Botón flotante para agregar
- Formulario en segunda pantalla
- Título y fecha obligatorios
- Fecha con showDatePicker
- Prioridad en lista desplegable
- Texto tachado para completadas
- Opciones para editar y eliminar
- Confirmación antes de eliminar
- Estadísticas en la parte superior

## Aprendizajes Esperados

- Estructura básica de una aplicación Flutter
- Uso de widgets de texto e imágenes
- Organización de elementos con filas y columnas
- Aplicación de estilos básicos
- Uso de StatefulWidget
- Manejo básico de estado con setState
- Eventos de botones
- Condiciones con if
- Uso de AlertDialog
- Uso de TextField o TextFormField
- Lectura de datos mediante TextEditingController
- Conversión de texto a números
- Validaciones básicas
- Operaciones aritméticas sencillas
- Formularios
- Operaciones con números decimales
- Uso de controles de selección
- Formateo de resultados
- Actualización de la interfaz
- Uso de fórmulas matemáticas
- Validación de entradas
- Manejo de variables de estado
- Interpolación de cadenas
- Condicionales
- Cambio dinámico de colores
- Uso de BoxDecoration
- Uso de Form
- Uso de GlobalKey<FormState>
- Validación con validator
- DropdownButtonFormField
- RadioListTile
- CheckboxListTile
- Manejo de formularios extensos
- Manejo de listas
- Uso de ListView.builder
- Agregar, modificar y eliminar elementos
- Creación de modelos de datos sencillos
- Creación de clases y objetos en Dart
- Listas de objetos
- Navegación con Navigator
- Envío de datos entre pantallas
- Uso de ListView o GridView

## Autor

Frank Felix

## Licencia

Este proyecto es para fines educativos.
