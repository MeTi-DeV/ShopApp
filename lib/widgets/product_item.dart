import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  //comment 1 : after its time to disable variables that we created for ProductItem class in constructor of this class
  // final String id;
  // final String imageUrl;
  // final String title;
  // final double price;
  // ProductItem(this.id, this.imageUrl, this.title, this.price);
  @override
  Widget build(BuildContext context) {
    //comment 2 : just we have to create a new variable like product in resive updated data from Product class that is inside Provider folder
    final product = Provider.of<Product>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed('product-details', arguments: product.id);
          },
          child: Image.network(
            //comment 3 : change to product.imageUrl

            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
            backgroundColor: Colors.black87,
            //comment 4 : change to product.title
            title: Text(product.title, textAlign: TextAlign.center),
            leading: IconButton(
              //comment 5 : here we call toggledStatusFavorite that created in product class
              onPressed: () => product.toggledStatusFavorite(),
              icon: Icon(
                //comment 6 : use product.isFavorite for while we chose or not chose favorite IconButton
                  product.isFavorite ? Icons.favorite : Icons.favorite_border),
              color: Theme.of(context).accentColor,
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart),
              color: Theme.of(context).accentColor,
            )),
      ),
    );
  }
}
