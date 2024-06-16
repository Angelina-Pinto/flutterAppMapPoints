import 'package:flutter/material.dart';
import 'package:flutter_map_points/src/views/screen_map.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mapas',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: FlutterScreenMap()
      ),
    );
  }
}