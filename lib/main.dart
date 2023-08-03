import 'package:flutter/material.dart';
import 'package:prueba_tecnica/screens/menu_screen.dart';
import 'package:prueba_tecnica/screens/get_api_screen.dart';
import 'package:prueba_tecnica/screens/post_screen.dart';

void main() {
  runApp(MyApp());
}

// Clase principal de la aplicación
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Aplicación Flutter', // Título de la aplicación que se muestra en la barra de tareas
      initialRoute: '/', // Ruta inicial de la aplicación
      routes: {
        '/': (context) => const MenuScreen(), // Ruta para mostrar la pantalla de menú
        '/get_api': (context) => const GetApiScreen(), // Ruta para mostrar la pantalla de obtención de datos desde una API
        '/post': (context) => PostScreen(), // Ruta para mostrar la pantalla de envío de datos a través de una API (sin constante)
      },
    );
  }
}
