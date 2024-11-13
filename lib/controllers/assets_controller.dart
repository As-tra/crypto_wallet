import 'dart:convert';
import 'package:crypto_wallet/models/api_response.dart';
import 'package:crypto_wallet/models/coin_data.dart';
import 'package:crypto_wallet/models/tracked_asset.dart';
import 'package:crypto_wallet/services/http_service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AssetsController extends GetxController {
  RxList<TrackedAsset> trackedAssets = <TrackedAsset>[].obs;
  RxList<CoinData> coinsData = <CoinData>[].obs;
  RxBool loading = false.obs;
  final String trackedAssetsKey = "tacked_assets";

  @override
  void onInit() async {
    super.onInit();
    await _getAssets();
    _loadTrackedAssets();
  }

  Future<void> _getAssets() async {
    loading.value = true;
    HttpService httpService = Get.find<HttpService>();
    var response =
        await httpService.get(url: "https://api.cryptorank.io/v1/currencies");
    coinsData.value = CurrenciesListAPIResponse.fromJson(response).data ?? [];
    loading.value = false;
  }

  void addTrackedAsset(String name, double amout, String symbol) async {
    // search first if the asset already exist
    for (var item in trackedAssets) {
      if (item.name == name) {
        item.amount = item.amount! + amout;
        trackedAssets.refresh();
        return;
      }
    }
    trackedAssets.add(
      TrackedAsset(name: name, amount: amout, symbol: symbol),
    );
    List<String> data =
        trackedAssets.map((asset) => jsonEncode(asset)).toList();
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setStringList("tacked_assets", data);
  }

  void _loadTrackedAssets() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    List<String>? data = sharedPreferences.getStringList(trackedAssetsKey);
    if (data != null) {
      trackedAssets.value = data.map((ele) {
        return TrackedAsset.fromJson(jsonDecode(ele));
      }).toList();
      trackedAssets.refresh();
    }
  }

  double getProtfolioValue() {
    double total = 0;
    for (TrackedAsset asset in trackedAssets) {
      total += asset.amount! * getAssetPrice(assetName: asset.name!);
    }
    return total;
  }

  double getAssetPrice({required String assetName}) {
    CoinData? coinData = getCoinData(assetName: assetName);
    return coinData?.values?.uSD?.price?.toDouble() ?? 0;
  }

  CoinData? getCoinData({required String assetName}) {
    for (var asset in coinsData) {
      if (asset.name == assetName) {
        return asset;
      }
    }
    return null;
  }
}
