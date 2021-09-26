import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;
  final double price;
  ProductItem(this.id, this.imageUrl, this.title, this.price);
  @override
  Widget build(BuildContext context) {
    //comment 1 : GridTile is new widget  and it's like ListTile work 
    return GridTile(
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black45,
        title: Text(title,
            textAlign: TextAlign.center),
            leading: IconButton(onPressed: (){}, icon: Icon(Icons.favorite),),
            trailing: IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart))
      ),
    );
  }
}
