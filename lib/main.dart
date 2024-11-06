import 'package:flutter/material.dart';
import 'package:praktikum_ke3/view/home/home_page.dart';
import 'package:praktikum_ke3/view/list/anime_list.dart';
import 'package:praktikum_ke3/view/shared_pref/shared_pref.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // Tambahkan 'return' di sini
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AnimeListScreen()
    );
  }
}
