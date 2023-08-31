import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UpdatePriceScreen extends StatelessWidget {
  final int? purchasePrice;
  final Function(int?) onOKPressed;

  const UpdatePriceScreen({
    super.key,
    this.purchasePrice,
    required this.onOKPressed,
  });

  @override
  Widget build(BuildContext context) {
    int? updatedPrice = purchasePrice;

    // keyboard をスクロール範囲に入れる
    return SingleChildScrollView(
      child: Container(
        // keyboard の上に要素を表示するようにする(MediaQuery)
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  // 入力ソースを数値のみに制限
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  autofocus: true,
                  autocorrect: false,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 4,
                      ),
                    ),
                  ),
                  onChanged: (priceText) {
                    int? price = int.parse(priceText);
                    updatedPrice = price;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                FilledButton(
                  style: FilledButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    onOKPressed(updatedPrice);
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
