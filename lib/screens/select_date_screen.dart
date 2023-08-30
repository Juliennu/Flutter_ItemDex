import 'package:flutter/material.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

class SelectDateScreen extends StatelessWidget {
  final DateTime purchaseDate;
  final int? purchasePrice;
  final DateTime warrantyPriod;
  final ValueChanged<DateTime> onDateTimeChanged;

  const SelectDateScreen({
    super.key,
    required this.purchaseDate,
    this.purchasePrice,
    required this.warrantyPriod,
    required this.onDateTimeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ScrollDatePicker(
        selectedDate: purchaseDate,
        locale: const Locale('ja', 'JP'), // TODO: 日本語表示に直す
        onDateTimeChanged: onDateTimeChanged,
      ),
    );
  }
}
