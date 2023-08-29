import 'package:flutter/material.dart';
import 'package:item_dex/screens/select_date_screen.dart';

class MyItemDetailListTile extends StatelessWidget {
  const MyItemDetailListTile({super.key});

  @override
  Widget build(BuildContext context) {
    // enum TileType {
    //   date,
    //   price,
    //   memo,
    // }
    return ListTile(
        leading: const Text('購入日'),
        trailing: const Text('2023/7/12'),
        onTap: () {
          // ハーフモーダル
          showModalBottomSheet(
            context: context,
            builder: (context) => const SelectDateScreen(),
          );
        });
  }
}
