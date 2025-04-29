import 'package:archonit_test/shared/extensions/theme_extensions/build_context_theme_text_style_extension.dart';
import 'package:archonit_test/src/app/extensions/price_extension.dart';
import 'package:archonit_test/src/features/bitcoin/domain/entity/bitcoin_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CoinCardWidget extends StatelessWidget {
  final BitcoinEntity coin;

  final Color color;

  const CoinCardWidget({
    required this.coin,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20.0),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            bottom: 0,
            child: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: color,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 56 + 8,
            right: 0,
            bottom: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  coin.symbol,
                  style: context.themeTextStyle.title,
                ),
                Text(
                  coin.price.toMoneyFormat(),
                  style: context.themeTextStyle.title,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
