import 'package:flutter/material.dart';
import 'package:prueba_tecnica/styles/color.dart';

// Pantalla de menú principal
class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    // Estilo del botón
    final buttonStyle = ElevatedButton.styleFrom(
      minimumSize: const Size(200, 50),
      backgroundColor: black,
      foregroundColor: white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(50))
      )
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'), // Título de la barra de navegación
        backgroundColor: mediumSpringGreen, // Color de fondo de la barra de navegación
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Obten la informacion y publica tu informacion!', // Mensaje de instrucción
              style: TextStyle(fontSize: 18), // Estilo del texto del mensaje
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: buttonStyle, // Aplicar el estilo definido anteriormente
              onPressed: () {
                Navigator.pushNamed(context, '/get_api'); // Navegar a la pantalla de obtención de información desde una API
              },
              child: const Text('Ver información'), // Texto del botón
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: buttonStyle, // Aplicar el estilo definido anteriormente
              onPressed: () {
                Navigator.pushNamed(context, '/post'); // Navegar a la pantalla de envío de información a través de una API
              },
              child: const Text('Realizar POST'), // Texto del botón
            ),
          ],
        ),
      ),
    );
  }
}
