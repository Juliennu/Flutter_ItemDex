import 'package:flutter/material.dart';
import 'package:item_dex/data/models/product.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ProductSizedBox extends StatelessWidget {
  final HitProduct hitProduct;
  final Function dialogButtonOnTapCallback;

  const ProductSizedBox({
    super.key,
    required this.hitProduct,
    required this.dialogButtonOnTapCallback,
  });

  @override
  Widget build(BuildContext context) {
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
              ],
            ),
          ),
        ),
      ],
    );

    Alert alert = Alert(
      context: context,
      style: const AlertStyle(
          animationType: AnimationType.grow,
          animationDuration: Duration(
            milliseconds: 150,
          )),
      image: SizedBox(
        height: 150,
        width: 150,
        child: Image.network(hitProduct.image.medium),
      ),
      title: hitProduct.name,
      buttons: [
        DialogButton(
          child: const Text(
            'マイアイテムに追加',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          onPressed: () {
            dialogButtonOnTapCallback();
            Navigator.pop(context);
          },
        ),
      ],
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          alert.show();
        },
        child: row,
      ),
    );
  }
}
