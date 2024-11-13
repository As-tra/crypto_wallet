import 'package:crypto_wallet/controllers/assets_controller.dart';
import 'package:flutter/material.dart';

class PortfolioBalance extends StatelessWidget {
  const PortfolioBalance({
    super.key,
    required this.assetsController,
  });

  final AssetsController assetsController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TweenAnimationBuilder(
          duration: const Duration(seconds: 1),
          tween: Tween<double>(
              begin: 0, end: assetsController.getProtfolioValue()),
          builder: (context, value, child) {
            return Text(
              "${value.toStringAsFixed(2)}\$",
              style: const TextStyle(
                fontSize: 44,
                fontWeight: FontWeight.bold,
                color: Color(0xffFF8C42),
              ),
            );
          },
        ),
      ],
    );
  }
}
