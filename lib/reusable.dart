import 'package:flutter/material.dart';

class ReusableBox extends StatelessWidget {
  ReusableBox({
    required this.conversion,
    required this.selectedCardCurrency,
    required this.cryptoName,
  });

  Map<String, int> conversion;
  String selectedCardCurrency;
  String cryptoName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.indigoAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            "$cryptoName =  ${conversion[cryptoName]} $selectedCardCurrency",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}