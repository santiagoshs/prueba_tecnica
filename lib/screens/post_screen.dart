import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prueba_tecnica/styles/color.dart';

// Pantalla para realizar una solicitud POST a una API
class PostScreen extends StatelessWidget {
  PostScreen({Key? key}) : super(key: key);

  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  // Función para enviar datos a través de una solicitud POST
  void postData() async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'), // URL de la API para realizar la solicitud POST
      body: {
        'title': titleController.text, // Título obtenido del campo de texto
        'body': bodyController.text, // Cuerpo obtenido del campo de texto
      },
    );
    if (response.statusCode == 201) {
      // Post exitoso
      // Aquí puedes manejar la respuesta si es necesario
    }
  }

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ElevatedButton.styleFrom(
      minimumSize: const Size(327, 50),
      backgroundColor: black,
      foregroundColor: white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mediumSpringGreen, // Color de fondo de la barra de navegación
        title: const Text('Realizar POST'), // Título de la barra de navegación
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Título'), // Etiqueta del campo de texto
            ),
            const SizedBox(height: 16),
            TextField(
              controller: bodyController,
              decoration: const InputDecoration(labelText: 'Cuerpo'), // Etiqueta del campo de texto
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: buttonStyle, // Aplicar el estilo definido anteriormente
              onPressed: postData, // Llamar a la función para enviar los datos
              child: const Text('Enviar'), // Texto del botón
            ),
          ],
        ),
      ),
    );
  }
}