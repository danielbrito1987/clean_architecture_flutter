import 'package:flutter/material.dart';
import 'package:hyrule/screens/categories.dart';

void main() {
  runApp(const Hyrule());
}

class Hyrule extends StatelessWidget {
  const Hyrule({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hyrule',
      theme: ThemeData(
          colorSchemeSeed: Colors.blue,
          brightness: Brightness.dark,
          useMaterial3: true,
          fontFamily: "Roboto"),
      home: const Categories(),
    );
  }
}
