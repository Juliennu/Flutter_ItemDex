import 'package:flutter/material.dart';
import 'package:item_dex/models/product.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

List<HitProduct> myItems = [];

class ProductSizedBox extends StatefulWidget {
  const ProductSizedBox({
    super.key,
    required this.hitProduct,
  });

  final HitProduct hitProduct;

  @override
  State<ProductSizedBox> createState() => _ProductSizedBoxState();
}

class _ProductSizedBoxState extends State<ProductSizedBox> {
  @override
  Widget build(BuildContext context) {
    Row row = Row(
      children: [
        SizedBox(
          height: 80,
          width: 80,
          child: Image.network(widget.hitProduct.image.medium),
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
                  widget.hitProduct.name,
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
                  widget.hitProduct.brand.name,
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
      image: SizedBox(
        height: 150,
        width: 150,
        child: Image.network(widget.hitProduct.image.medium),
      ),
      title: widget.hitProduct.name,
      buttons: [
        DialogButton(
          child: const Text(
            '所持品に追加',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          onPressed: () {
            setState(() {
              myItems.add(widget.hitProduct);
              Navigator.pop(context);
            });
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
