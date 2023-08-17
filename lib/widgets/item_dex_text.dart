import 'package:flutter/material.dart';

class ItemDexText {
  Text createHeaderTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
