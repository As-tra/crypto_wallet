import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final String title;
  final String subtitle;
  const GridItem({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xff16171b),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              "$subtitle\$",
              style: const TextStyle(
                color: Color(0xffFF8C42),
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
