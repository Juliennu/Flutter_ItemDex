import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:item_dex/models/product_data.dart';
import 'package:item_dex/screens/home_screen.dart';
import 'package:provider/provider.dart';

// 非同期処理のためmain関数をFutureに変更
Future<void> main() async {
  await dotenv.load(fileName: '.env'); // .envファイルを読み込み
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductData(),
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          home: const HomeScreen(),
        );
      },
    );
  }
}
