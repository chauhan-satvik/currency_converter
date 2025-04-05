import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() => _CurrencyConverterMaterialPageState();
}

class _CurrencyConverterMaterialPageState extends State<CurrencyConverterMaterialPage> {
  final TextEditingController _controller = TextEditingController();
  double? convertedAmount;

  Future<double> fetchExchangeRate() async {
    final url = Uri.parse('https://api.exchangerate-api.com/v4/latest/USD');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['rates']['INR'];
    } else {
      throw Exception('Failed to load exchange rate');
    }
  }

  void convertCurrency() async {
    final input = _controller.text;
    final usd = double.tryParse(input);

    if (usd != null) {
      final rate = await fetchExchangeRate();
      setState(() {
        convertedAmount = usd * rate;
      });
    } else {
      setState(() {
        convertedAmount = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.black,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(14),
    );

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 96, 125, 139),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 96, 125, 139),
        title: const Text('Currency Converter'),
        centerTitle: true,
        titleTextStyle: const TextStyle(fontSize: 25),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              convertedAmount == null
                  ? '0'
                  : '₹${convertedAmount!.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(7),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Enter The Amount In USD',
                  hintStyle: const TextStyle(color: Colors.black, fontSize: 20),
                  prefixIcon: const Icon(Icons.monetization_on_outlined),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: const Color.fromARGB(255, 166, 187, 197),
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
              child: ElevatedButton(
                onPressed: convertCurrency,
                style: ElevatedButton.styleFrom(
                  elevation: 15,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Convert'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}