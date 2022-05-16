// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:bitcoin_ticker_app/conversion.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bitcoin_ticker_app/reusable.dart';
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
    List<int> rateInt = [];
    var currencyData;
    for (String crypto in cryptoList) {
      cryptoName = crypto;
      currencyData = await currencyRate.getExchangeRate(currency, cryptoName);
      rate = currencyData['rate'];
      rateInt.add(rate.toInt());
    }
    int i = 0;
    setState(() {
      for (String crypto in cryptoList) {
        conversion[crypto] = rateInt[i++];
      }
    });
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
        style: const TextStyle(color: Colors.white),
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
          ReusableBox(
              conversion: conversion,
              selectedCardCurrency: selectedCurrency,
              cryptoName: cryptoList[0]),
          ReusableBox(
              conversion: conversion,
              selectedCardCurrency: selectedCurrency,
              cryptoName: cryptoList[1]),
          ReusableBox(
              conversion: conversion,
              selectedCardCurrency: selectedCurrency,
              cryptoName: cryptoList[2]),
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
