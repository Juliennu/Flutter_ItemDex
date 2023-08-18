import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:item_dex/models/product.dart';

class ProductSizedBox extends StatelessWidget {
  const ProductSizedBox({
    super.key,
    required this.hitProduct,
  });

  final HitProduct hitProduct;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
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
                ],
              ),
            ),
          ),
          Text('${addComma(188800)} 円'), // TODO: あとで直す
        ],
      ),
    );
  }

  String addComma(int price) {
    final formatter = NumberFormat('#,###');
    return formatter.format(price);
  }
}
