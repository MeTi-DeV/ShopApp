import 'package:flutter/material.dart';
//comment 1 : create  each item cart here and show some details of products that we choosed
class CartItem extends StatelessWidget {
  final String id;
  final String title;
  final double price;
  final int quantity;
  CartItem(
      this.id,
       this.title,
       this.price,
       this.quantity);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      child: ListTile(
          leading: Container( child: Text('${quantity} x', textAlign: TextAlign.center,)),
          title: Text(title ,style: TextStyle(fontSize:20, fontWeight: FontWeight.bold),),
          subtitle: Text('${(price*quantity)}'),
          trailing: Container(
            decoration:BoxDecoration(color: Colors.pink.shade500, borderRadius: BorderRadius.circular(30)),
            padding: EdgeInsets.all(10),
            child: Text('${price}\$', style: TextStyle(color: Colors.white),),
          )),
    );
  }
}
