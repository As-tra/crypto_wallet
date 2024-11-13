import 'package:crypto_wallet/models/coin_data.dart';
import 'package:crypto_wallet/widgets/details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsView extends StatelessWidget {
  final CoinData coin;
  const DetailsView({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff08080b),
      appBar: _buildAppBar(),
      body: DetailsViewBody(
        coin: coin,
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      ),
      backgroundColor: const Color(0xff08080b),
      title: Text(
        coin.name!,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Color(0xffFF8C42),
        ),
      ),
    );
  }
}
