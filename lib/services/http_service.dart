import 'package:crypto_wallet/constants.dart';
import 'package:dio/dio.dart';

class HttpService {
  final Dio _dio = Dio();

  HttpService() {
    _configureDio();
  }

  void _configureDio() {
    _dio.options =
        BaseOptions(baseUrl: "https://api.cryptorank.io/v1/", queryParameters: {
      "api_key": kApiKey,
    });
  }

  Future<dynamic> get({required String url}) async {
    Response response = await _dio.get(url);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('Connection Error:${response.statusMessage}');
    }
  }
}
