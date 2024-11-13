import 'package:crypto_wallet/widgets/add_asset_dialog.dart';
import 'package:crypto_wallet/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff08080b),
      appBar: _buildAppBar(),
      body: HomeViewBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xff08080b),
      title: const CircleAvatar(
        radius: 22,
        backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=12"),
      ),
      centerTitle: false,
      actions: [
        IconButton(
          onPressed: () {
            Get.dialog(const AddAssetDialog());
          },
          icon: const Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
