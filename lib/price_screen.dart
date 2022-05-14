// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:bitcoin_ticker_app/conversion.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

CurrencyRate currencyRate = CurrencyRate();

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  String cryptoName = 'BTC';
  double rate = 0;
  Map<String, int> conversion = {};

  @override
  void initState() {
    super.initState();
    exchangeRate('USD');
  }

  void exchangeRate(String currency) async {
    var currencyData;
    for (String crypto in cryptoList) {
      cryptoName = crypto;
      currencyData = await currencyRate.getExchangeRate(currency, cryptoName);
      setState(() {
        rate = currencyData['rate'];
        int rateInt = rate.toInt();
        conversion[cryptoName] = rateInt;
      });
    }
  }

  DropdownButton getAndroidCurrency() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String currency in currenciesList) {
      var item = DropdownMenuItem(
          value: currency,
          child: Text(
            currency,
            style: const TextStyle(color: Colors.white),
          ));
      dropDownItems.add(item);
    }
    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropDownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value!;
          exchangeRate(selectedCurrency);
        });
      },
    );
  }

  CupertinoPicker getIOSCurrency() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(
        currency,
        style: TextStyle(color: Colors.white),
      ));
    }
    return CupertinoPicker(
        backgroundColor: Colors.indigoAccent,
        magnification: 1.2,
        offAxisFraction: 0,
        itemExtent: 30,
        onSelectedItemChanged: (selectedIndex) {},
        children: pickerItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.indigoAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  "1 BTC =  ${conversion['BTC']} $selectedCurrency",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.indigoAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  "1 ETH =  ${conversion['ETH']} $selectedCurrency",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.indigoAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  "1 LTC =  ${conversion['LTC']} $selectedCurrency",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.indigoAccent,
            child: Platform.isIOS ? getIOSCurrency() : getAndroidCurrency(),
          ),
        ],
      ),
    );
  }
}
