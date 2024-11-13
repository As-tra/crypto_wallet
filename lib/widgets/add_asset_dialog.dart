import 'package:crypto_wallet/widgets/add_asset_dialog_body.dart';
import 'package:flutter/material.dart';

class AddAssetDialog extends StatelessWidget {
  const AddAssetDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        clipBehavior: Clip.antiAlias,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        height: MediaQuery.sizeOf(context).height * .4,
        width: MediaQuery.sizeOf(context).width * .8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xff16171b),
        ),
        child: AddAssetDialogBody(),
      ),
    );
  }
}
