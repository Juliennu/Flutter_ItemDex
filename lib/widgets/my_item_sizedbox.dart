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

    return ListTile(
      leading: Image.network(hitProduct.image.medium),
      title: Text(
        hitProduct.name,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        hitProduct.brand.name,
      ),
      onTap: () {
        myItemTappedCallback();
      },
    );
  }
}
