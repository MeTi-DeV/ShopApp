import 'package:flutter/material.dart';
import './screens/overview_products_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue,
      fontFamily: 'Lato',
      accentColor: Colors.orangeAccent
      ),
      debugShowMaterialGrid: false,
      title: 'My Shop',
      home: OverviewProductsScreen()
    );
  }
}

