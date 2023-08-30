import 'package:flutter/material.dart';
import 'package:item_dex/models/product.dart';
import 'package:provider/provider.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

class SelectDateScreen extends StatelessWidget {
  const SelectDateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HitProduct>(builder: (context, item, child) {
      return SizedBox(
        height: 250,
        child: ScrollDatePicker(
          selectedDate: item.purchaseDate,
          locale: const Locale('ja', 'JP'), // TODO: 日本語表示に直す
          onDateTimeChanged: (date) {
            item.updateMyItem(item.purchasePrice, date,
                item.warrantyPriod); // TODO: 変更した箇所だけ引数を渡せるようにしたい
          },
        ),
      );
    });
  }
}
