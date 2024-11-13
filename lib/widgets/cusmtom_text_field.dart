import 'package:crypto_wallet/controllers/add_asset_dialog_controller.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
  });

  final AddAssetDialogController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        controller.assetAmount.value = double.tryParse(value) ?? 0.0;
      },
      keyboardType: TextInputType.number,
      style: const TextStyle(
        color: Color(0xffeeeeee),
        fontSize: 18,
      ),
      decoration: InputDecoration(
        hintText: "0.0",
        hintStyle: const TextStyle(
          color: Color(0xffeeeeee),
          fontSize: 18,
        ),
        border: _buildborder(),
        enabledBorder: _buildborder(),
      ),
    );
  }

  OutlineInputBorder _buildborder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.white),
    );
  }
}
