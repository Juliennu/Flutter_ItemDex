import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:item_dex/models/product.dart';
import 'package:item_dex/screens/select_date_screen.dart';
import 'package:provider/provider.dart';

class MyItemDetailListTile extends StatelessWidget {
  const MyItemDetailListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String dateFormatter(DateTime date) {
      return DateFormat.yMMMMd().format(date); // TODO: 日本語表示に直す
    }

    return Consumer<HitProduct>(builder: (context, item, child) {
      return ListTile(
          leading: const Text('購入日'),
          trailing: Text(dateFormatter(item.purchaseDate)),
          onTap: () {
            // ハーフモーダル
            showModalBottomSheet(
              context: context,
              builder: (context) => const SelectDateScreen(),
            );
          });
    });
  }
}
