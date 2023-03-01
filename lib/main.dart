import 'package:flutter/material.dart';
import 'package:test_project_dev_pace/pages/logo_items_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LogoItemsPage(),
    );
  }
}


