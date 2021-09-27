import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class ProductsDetaillsScreen extends StatelessWidget {
  static const routeName = 'product-details';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    //comment 1 : use findById(String id) for has a shorter code use item.firstWhere((product)=> product.id==productId) as a function inside of Products file and pass productId to that and  call it here
    final loadProducts =
        Provider.of<Products>(context, listen: false).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadProducts.title),
      ),
    );
  }
}
