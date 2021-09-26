import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../widgets/product_item.dart';
//comment 1 : extract our GridView part to new widget and import Provider file here and use data are inside this file
class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //comment 2 : storage Provider data in new variable like productsData  
    final productsData = Provider.of<Products>(context);
    //comment 3 : product has only one atribute by name items get these data and storage in products
//comment 4 : to continues we use it as refrence of products atributes and pass them to ProductItem
    final products = productsData.items;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 3 / 2,
      ),
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.all(5),
          child: ProductItem(products[index].id, products[index].imageUrl,
              products[index].title, products[index].price),
        );
      },
    );
  }
}
