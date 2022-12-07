// Nama  : Nadifa Habsari
// NIM   : 124200049
// Plug  : B

import 'package:flutter/material.dart';
import 'package:responsi_124200049/list_matches.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Responsi Praktikum Aplikasi Mobile',
      home: ListMatches(),
    );
  }
}