import 'package:crypto_wallet/models/coin_data.dart';
import 'package:crypto_wallet/utils/get_crypto_image.dart';
import 'package:flutter/material.dart';

class CoinGeneralInfo extends StatelessWidget {
  const CoinGeneralInfo({
    super.key,
    required this.coin,
  });

  final CoinData coin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 30),
      child: Row(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundImage: NetworkImage(
              getCryptoImage(symbol: coin.symbol!),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "\$${coin.values?.uSD?.price?.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              Text(
                "${coin.values!.uSD!.percentChange24h! > 0 ? '+' : ''}${coin.values?.uSD?.percentChange24h?.toStringAsFixed(2)}%",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: coin.values!.uSD!.percentChange24h! < 0
                      ? Colors.red
                      : Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
