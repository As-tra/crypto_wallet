import 'package:crypto_wallet/controllers/add_asset_dialog_controller.dart';
import 'package:crypto_wallet/widgets/cusmtom_text_field.dart';
import 'package:crypto_wallet/widgets/custom_button.dart';
import 'package:crypto_wallet/widgets/custom_drop_down_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAssetDialogBody extends StatelessWidget {
  final controller = Get.put(AddAssetDialogController());

  AddAssetDialogBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Material(
        color: const Color(0xff16171b),
        child: controller.loading.isTrue
            ? const Center(
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: CircularProgressIndicator(),
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomDropDownButton(controller: controller),
                  CustomTextField(controller: controller),
                  CustomButton(controller: controller),
                ],
              ),
      ),
    );
  }
}
