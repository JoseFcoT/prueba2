import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(JsonApp());
}

class JsonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JsonScreen(),
    );
  }
}

class JsonScreen extends StatefulWidget {
  @override
  _JsonScreenState createState() => _JsonScreenState();
}

class _JsonScreenState extends State<JsonScreen> {
  List<dynamic> datos = [];

  @override
  void initState() {
    super.initState();
    cargarDatos();
  }

  Future<void> cargarDatos() async {
    final jsonString = await rootBundle.loadString('assets/datos.json');
    final jsonData = json.decode(jsonString);
    setState(() {
      datos = jsonData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Datos JSON'),
      ),
      body: ListView.builder(
        itemCount: datos.length,
        itemBuilder: (BuildContext context, int index) {
          final dato = datos[index];
          return ListTile(
            title: Text(dato['nombre']),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Edad: ${dato['edad']}'),
                Text('Ciudad: ${dato['ciudad']}'),
              ],
            ),
          );
        },
      ),
    );
  }
}

