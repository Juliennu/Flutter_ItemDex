import 'package:flutter/material.dart';
import 'package:item_dex/data/models/product.dart';

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
    return Card(
      child: ListTile(
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
      ),
    );
  }
}
