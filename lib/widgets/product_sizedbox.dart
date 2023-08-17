import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:item_dex/models/product.dart';

class ProductSizedBox extends StatelessWidget {
  const ProductSizedBox({
    super.key,
    required this.hitProduct,
    // required this.info,
  });

  // final Info info;
  final HitProduct hitProduct;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // TODO: レイアウトは後で直す
          children: [
            SizedBox(
              height: 80,
              width: 80,
              child: Image.network(hitProduct.image.medium),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hitProduct.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  hitProduct.brand.name,
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
              ],
            ),
            Text('${addComma(188800)} 円'), // TODO: あとで直す
          ],
        ),
      ),
    );
  }

  String addComma(int price) {
    final formatter = NumberFormat('#,###');
    return formatter.format(price);
  }
}
