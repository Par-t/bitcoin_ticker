// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
//
// class LoadingScreen extends StatefulWidget {
//   @override
//   _LoadingScreenState createState() => _LoadingScreenState();
// }
//
// class _LoadingScreenState extends State<LoadingScreen> {
//   void getLocationData() async {
//     CurrencyRate currencyRate = CurrencyRate();
//
//     var currencyData = await currencyRate.getExchangeRate(currency, cryptoName)
//
//     Navigator.push(context, MaterialPageRoute(builder: (context) {
//       return PriceScreen(locationWeatherData: weatherData);
//     }));
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     getLocationData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SpinKitWanderingCubes(
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
// }
