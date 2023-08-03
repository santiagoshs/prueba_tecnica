import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Pantalla para obtener datos desde una API
class GetApiScreen extends StatefulWidget {
  const GetApiScreen({Key? key}) : super(key: key);

  @override
  _GetApiScreenState createState() => _GetApiScreenState();
}

class _GetApiScreenState extends State<GetApiScreen> {
  List<dynamic> data = [];

  @override
  void initState() {
    super.initState();
    fetchData(); // Llamar a la función para obtener datos desde la API cuando se inicie la pantalla
  }

  // Función para obtener datos desde la API
  void fetchData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      setState(() {
        data = jsonDecode(response.body); // Decodificar los datos de la respuesta de la API
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Información de la API'), // Título de la barra de navegación
      ),
      body: ListView.separated(
        itemCount: data.length, // Cantidad de elementos a mostrar en la lista
        separatorBuilder: (context, index) => const SizedBox(height: 10), // Espacio entre cada elemento
        itemBuilder: (context, index) {
          return Center(
            child: SizedBox(
              width: 350,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Borde redondeado de la tarjeta
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data[index]['title'], // Título del elemento de la API
                        style: const TextStyle(
                          fontWeight: FontWeight.bold, // Estilo del título en negrita
                        ),
                        textAlign: TextAlign.center, // Alinear el título al centro
                      ),
                      const SizedBox(height: 8),
                      Text(data[index]['body']), // Cuerpo del elemento de la API
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}