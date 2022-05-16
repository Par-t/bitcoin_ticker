import 'networking.dart';

const apiKey = "0FF80991-4D98-4749-8419-015F2AFA3479";

class CurrencyRate {
  Future<dynamic> getExchangeRate(
      String currencyName, String cryptoName) async {
    NetworkHelper networkHelper = NetworkHelper(
        'https://rest.coinapi.io/v1/exchangerate/$cryptoName/$currencyName?apikey=$apiKey');
    var data = await networkHelper.getData();
    return data;
  }
}
