import 'package:currency_converter/currency_converter_material_page.dart';
import 'package:flutter/material.dart';
// ignore_for_file: format

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CurrencyConverterMaterialPage());
  }
}