import 'package:crypto_wallet/controllers/add_asset_dialog_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropDownButton extends StatelessWidget {
  const CustomDropDownButton({
    super.key,
    required this.controller,
  });

  final AddAssetDialogController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: DropdownButton(
          iconEnabledColor: Colors.white,
          dropdownColor: const Color(0xff16171b),
          focusColor: Colors.transparent,
          isExpanded: true,
          underline: const SizedBox(),
          value: controller.slectedAsset.value,
          items: controller.assets.keys.map(
            (ele) {
              return DropdownMenuItem(
                value: ele,
                child: Text(
                  ele,
                  style: const TextStyle(
                    color: Color(0xffeeeeee),
                    fontSize: 18,
                  ),
                ),
              );
            },
          ).toList(),
          onChanged: (value) {
            if (value != null) {
              controller.slectedAsset.value = value;
            }
          },
        ),
      ),
    );
  }
}
