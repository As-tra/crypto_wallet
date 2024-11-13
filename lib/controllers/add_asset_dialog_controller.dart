import 'dart:developer';

import 'package:crypto_wallet/models/api_response.dart';
import 'package:crypto_wallet/services/http_service.dart';
import 'package:get/get.dart';

class AddAssetDialogController extends GetxController {
  RxBool loading = true.obs;
  RxMap<String, String> assets = <String, String>{}.obs;
  RxString slectedAsset = "".obs;
  RxDouble assetAmount = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    _getAssets();
  }

  Future<void> _getAssets() async {
    loading.value = true;
    HttpService httpService = Get.find<HttpService>();
    try {
      var response =
          await httpService.get(url: "https://api.cryptorank.io/v1/currencies");
      CurrenciesListAPIResponse currenciesListAPIResponse =
          CurrenciesListAPIResponse.fromJson(response);
      currenciesListAPIResponse.data?.forEach((e) {
        assets[e.name!] = e.symbol!;
      });
      slectedAsset.value = assets.keys.first;
    } catch (e) {
      log(e.toString());
    }
    loading.value = false;
  }
}
