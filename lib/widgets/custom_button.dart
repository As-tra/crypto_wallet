import 'package:crypto_wallet/controllers/add_asset_dialog_controller.dart';
import 'package:crypto_wallet/controllers/assets_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.controller});
  final AddAssetDialogController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AssetsController assetsController = Get.find<AssetsController>();
        assetsController.addTrackedAsset(
          controller.slectedAsset.value,
          controller.assetAmount.value,
          controller.assets[controller.slectedAsset.value]!,
        );
        Get.back();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffFF8C42),
        ),
        child: const Text(
          "A D D    A S S E T",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
