import 'package:crypto_wallet/models/coin_data.dart';
import 'package:crypto_wallet/widgets/coin_general_info.dart';
import 'package:crypto_wallet/widgets/grid_item.dart';
import 'package:flutter/material.dart';

class DetailsViewBody extends StatelessWidget {
  final CoinData coin;

  const DetailsViewBody({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          CoinGeneralInfo(coin: coin),
          Expanded(
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .9,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              children: [
                GridItem(
                  title: "Circulating Supply",
                  subtitle: coin.circulatingSupply.toString(),
                ),
                GridItem(
                  title: "Maximum Supply",
                  subtitle: coin.maxSupply.toString(),
                ),
                GridItem(
                  title: "Total Supply",
                  subtitle: coin.totalSupply.toString(),
                ),
                GridItem(
                  title: "MarketCap Value",
                  subtitle: coin.values!.uSD!.marketCap!.round().toString(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
