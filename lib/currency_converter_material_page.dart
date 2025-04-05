import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatelessWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  Widget build(BuildContext context) {

    final border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
        width: 1,
        strokeAlign: BorderSide.strokeAlignOutside,
      ),
      borderRadius: BorderRadius.circular(14),
    );

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 96, 125, 139),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 96, 125, 139),
        title: Text('Currency Converter'),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 25,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '0',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(7),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter The Amount In USD',
                  hintStyle: TextStyle(color: Colors.black, fontSize: 20),
                  prefixIcon: Icon(Icons.monetization_on_outlined),
                  prefixIconColor: const Color(0xFF000000),
                  filled: true,
                  fillColor: Color.fromARGB(255, 166, 187, 197),
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7 , vertical: 3),
              child: ElevatedButton(
                 
                onPressed: () {
                  if (kDebugMode) {
                    print('Button Clicked');
                  }
                },
                style:  ElevatedButton.styleFrom(
                  elevation: 15,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)
                    ),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50)
                  ),
                  child: Text('Convert')
              ),
            ),
          ],
        ),
      ),
    );
  }
}