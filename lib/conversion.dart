import 'networking.dart';

const apiKey = "<YOUR_API_KEY>";

class CurrencyRate {
  Future<dynamic> getExchangeRate(
      String currencyName, String cryptoName) async {
    NetworkHelper networkHelper = NetworkHelper(
        'https://rest.coinapi.io/v1/exchangerate/$cryptoName/$currencyName?apikey=$apiKey');
    var data = await networkHelper.getData();
    return data;
  }
}
