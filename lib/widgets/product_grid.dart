import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../widgets/product_item.dart';


class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3 / 2,
        ),
        itemCount: products.length,
        //comment 1 : after I change product class to Providers its time to pass atributes to ProductItem
        //comment 2 : only enough to pass products[index] to updateable data to class  and put ProductItem as a child so easy way :D !!!
        itemBuilder: (BuildContext context, int index) =>
            ChangeNotifierProvider(
              create: (ct) => products[index],
              child: Container(
                padding: EdgeInsets.all(5),
                child: ProductItem(),
              ),
            ));
  }
}
