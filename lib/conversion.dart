import 'networking.dart';

const apiKey = "902BF62D-D828-4F23-88F5-8006FEF30B1B";

class CurrencyRate {
  Future<dynamic> getExchangeRate(
      String currencyName, String cryptoName) async {
    NetworkHelper networkHelper = NetworkHelper(
        'https://rest.coinapi.io/v1/exchangerate/$cryptoName/$currencyName?apikey=$apiKey');
    var data = await networkHelper.getData();
    return data;
  }
}
