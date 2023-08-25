import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:item_dex/models/product.dart';

class MyItemSizedBox extends StatelessWidget {
  final HitProduct hitProduct;
  final Function myItemTappedCallback;

  const MyItemSizedBox({
    super.key,
    required this.hitProduct,
    required this.myItemTappedCallback,
  });

  @override
  Widget build(BuildContext context) {
    String priceFormatter(int? price) {
      if (price == null) {
        return '';
      } else {
        final formatter = NumberFormat('#,###');
        return '購入価格: ${formatter.format(price)} 円';
      }
    }

    Row row = Row(
      children: [
        SizedBox(
          height: 80,
          width: 80,
          child: Image.network(hitProduct.image.medium),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hitProduct.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  hitProduct.brand.name,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: [
                    // 購入価格
                    Text(
                      priceFormatter(hitProduct.purchasePrice),
                    ),
                    // const SizedBox(
                    //   width: 8,
                    // ),
                    // // 購入日
                    // const Text(
                    //   '2023/8/22',
                    // ),
                    // 保証期限
                    // const Text(
                    //   '保証期限: 2024/8/22',
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          myItemTappedCallback();
        },
        child: row,
      ),
    );
  }
}
