import 'package:flutter/material.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

class SelectDateScreen extends StatelessWidget {
  const SelectDateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime.now();

    return SizedBox(
      height: 250,
      child: ScrollDatePicker(
        selectedDate: selectedDate,
        locale: const Locale('ja', ''), // TODO: 日本語表示に直す
        onDateTimeChanged: (value) {
          selectedDate = value;
        },
      ),
    );
  }
}
