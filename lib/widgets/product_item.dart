import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String imageUrl;
  // final String title;
  // final double price;
  // ProductItem(this.id, this.imageUrl, this.title, this.price);
  @override
  Widget build(BuildContext context) {
    //comment 2 : change product to listen off other than favorite icon part that created by Consumer
    final product = Provider.of<Product>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed('product-details', arguments: product.id);
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(product.title, textAlign: TextAlign.center),
          //comment 1 : Consumer is for components that only change in big components we can put them in this widget
          // like here now the button that changing is favorite icon so put it in Consumer
          //Consumer has 3 parameters
          //context ,
          //product: the object we will get  data from that
          // child: here I chnge it to _ because I dont use it
          // but child is for a  part of Consumer widget that is will never chnage and its fix always
          leading: Consumer<Product>(builder: (context, product, _) {
            return IconButton(
              onPressed: () => product.toggledStatusFavorite(),
              icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border),
              color: Theme.of(context).accentColor,
            );
          }),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart),
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}

//
