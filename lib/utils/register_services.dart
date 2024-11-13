import 'package:crypto_wallet/controllers/assets_controller.dart';
import 'package:crypto_wallet/services/http_service.dart';
import 'package:get/get.dart';

Future<void> registerServices() async {
  
  Get.put(HttpService());
}

Future<void> setUpControllers() async {
  Get.put(AssetsController());
}
