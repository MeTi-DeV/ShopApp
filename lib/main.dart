import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/products_detaills_screen.dart';
import './providers/products.dart';
import './screens/overview_products_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  
    return ChangeNotifierProvider(
      create: (ctx) => Products(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.purple,
            fontFamily: 'Lato',
            accentColor: Colors.deepOrange),
        debugShowMaterialGrid: false,
        title: 'My Shop',
        home: OverviewProductsScreen(),
        routes: {
          ProductsDetaillsScreen.routeName: (ctx) => ProductsDetaillsScreen()
        },
      ),
    );
  }
}
