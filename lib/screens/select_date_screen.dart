import 'package:flutter/material.dart';
import 'package:item_dex/models/tile_type.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

class SelectDateScreen extends StatelessWidget {
  final TileType tileType;
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateTimeChanged;

  const SelectDateScreen({
    super.key,
    required this.tileType,
    required this.selectedDate,
    required this.onDateTimeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ScrollDatePicker(
        selectedDate: selectedDate,
        locale: const Locale('ja', 'JP'), // TODO: 日本語表示に直す
        minimumDate: tileType == TileType.warrantyPriod
            ? DateTime(2023, 1, 1)
            : DateTime(1995, 1, 1),
        maximumDate:
            tileType == TileType.warrantyPriod ? DateTime(2040, 12, 31) : null,
        onDateTimeChanged: onDateTimeChanged,
      ),
    );
  }
}
