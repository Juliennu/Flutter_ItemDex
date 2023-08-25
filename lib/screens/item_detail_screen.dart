import 'package:flutter/material.dart';
import 'package:item_dex/widgets/item_dex_text.dart';

class ItemDetailScreen extends StatelessWidget {
  const ItemDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final itemDexText = ItemDexText();

    return Scaffold(
      appBar: AppBar(
        title: itemDexText.createHeaderTitle('アイテム詳細'),
      ),
    );
  }
}
