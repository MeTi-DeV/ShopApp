import 'package:flutter/material.dart';

// comment 1 : first create a class for our cart properties like CardItem
class CardItem {
  final String id;
  final String title;
  final double price;
  final int quantity;
  CardItem(
      {required this.id,
      required this.title,
      required this.price,
      required this.quantity});
}

//comment 2 : then create our second class this is mixin class like product class and products class its for changeable items
class Card with ChangeNotifier {
  Map<String, CardItem> _items = {};
  Map<String, CardItem> get items {
    return {..._items};
  }

// comment 3 : create addItem function for add products to Cart screen it has 3 arguments
// productId: use CardItem id as key and each item will has a key like its id
  void addItem(String productId, String title, double price) {
    //comment 4 : here we have a if statement and it say if there was a product with key or productId update it data
    if (_items.containsKey(productId)) {
      //comment 5 : update card items is possible by .update() method
      // first argument get productId(key) then replaced new data instead old data by second argument that a function with argument like existingCardItem
      // we replaced new data by existingCardItem on CardItem objects
      _items.update(
          productId,
          (existingCardItem) => CardItem(
              id: existingCardItem.id,
              title: existingCardItem.title,
              price: existingCardItem.price,
      //comment 6 : for quantity update counts of that item to more than 1
              quantity: existingCardItem.quantity + 1));
    } 
    //comment 7 : otherwise if we add new items without any id 
    else {
      //comment 8 : for create  an id and value the rest of the features use putIfAbsent()
      // first argument grt key and second argument is a function for pass data to CardItem atributes
      //here use create product DateTime as id its not good way to define a new id but for now its good
      _items.putIfAbsent(
        productId,
        () => CardItem(
            id: DateTime.now().toString(),
            title: title,
            price: price,
            quantity: 1),
      );
    }
    print(_items.keys);
  }
}
