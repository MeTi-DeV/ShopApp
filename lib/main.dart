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
    //comment 1 : after create products file and install Provider package its time to use Provider
    //comment 2 : wrap MaterialApp to ChangeNotifierProvider its make our main.dart to providerable 
    // and apply Provider  package atributes here
    //comment 3 : ChangeNotifierProvider for give changes and updated changes to Provider constractor
    //comment 4 : one of important properties is create for say where should storage new updates and we pass new updates to our provider file like Products.dart
    return ChangeNotifierProvider(
      create: (ctx) => Products(),
      child: MaterialApp(
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
