import 'package:crypto_wallet/controllers/assets_controller.dart';
import 'package:crypto_wallet/models/tracked_asset.dart';
import 'package:crypto_wallet/utils/create_particles.dart';
import 'package:crypto_wallet/utils/get_crypto_image.dart';
import 'package:crypto_wallet/views/details_view.dart';
import 'package:crypto_wallet/widgets/protfolio_balance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:particles_flutter/particles_engine.dart';

class HomeViewBody extends StatelessWidget {
  final AssetsController assetsController = Get.find<AssetsController>();
  HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    const Text(
                      "Y O U R   B A L A N C E",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    PortfolioBalance(assetsController: assetsController),
                    const SizedBox(height: 50),
                    const Row(
                      children: [
                        Text(
                          "P O R T F O L I O",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              SliverFillRemaining(
                child: Stack(
                  children: [
                    Particles(
                      awayRadius: 150,
                      particles: generateParticles(),
                      height: MediaQuery.sizeOf(context).height,
                      width: MediaQuery.sizeOf(context).width,
                      onTapAnimation: true,
                      awayAnimationDuration: const Duration(milliseconds: 100),
                      awayAnimationCurve: Curves.linear,
                      enableHover: true,
                      hoverRadius: 90,
                      connectDots: true,
                    ),
                    ListView.builder(
                      itemCount: assetsController.trackedAssets.length,
                      itemBuilder: (context, index) {
                        TrackedAsset asset =
                            assetsController.trackedAssets[index];
                        return GestureDetector(
                          onTap: () {
                            Get.to(() {
                              return DetailsView(
                                coin: assetsController.getCoinData(
                                  assetName: asset.name!,
                                )!,
                              );
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: const Color(0xff16171b),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 22,
                                  backgroundImage: NetworkImage(
                                    getCryptoImage(symbol: asset.symbol!),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      asset.name!,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "${asset.amount}",
                                      style: const TextStyle(
                                        color: Color(0xffbcbcbc),
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Text(
                                  "${(assetsController.getAssetPrice(assetName: asset.name!) * asset.amount!).toStringAsFixed(2)} USD",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
