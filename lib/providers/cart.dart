import 'package:flutter/material.dart';

// comment 1 : first create a class for our cart properties like CartItem
class CartItem {
  final String id;
  final String title;
  final double price;
  final int quantity;
  CartItem(
      {required this.id,
      required this.title,
      required this.price,
      required this.quantity});
}

//comment 2 : then create our second class this is mixin class like product class and products class its for changeable items
class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};
  Map<String, CartItem> get items {
    return {..._items};
  }

// comment 3 : create addItem function for add products to Cart screen it has 3 arguments
// productId: use CartItem id as key and each item will has a key like its id
  void addItem(String productId, String title, double price) {
    //comment 4 : here we have a if statement and it say if there was a product with key or productId update it data
    if (_items.containsKey(productId)) {
      //comment 5 : update cart items is possible by .update() method
      // first argument get productId(key) then replaced new data instead old data by second argument that a function with argument like existingCartItem
      // we replaced new data by existingCartItem on CartItem objects
      _items.update(
          productId,
          (existingCartItem) => CartItem(
              id: existingCartItem.id,
              title: existingCartItem.title,
              price: existingCartItem.price,
              //comment 6 : for quantity update counts of that item to more than 1
              quantity: existingCartItem.quantity + 1));
    }
    //comment 7 : otherwise if we add new items without any id
    else {
      //comment 8 : for create  an id and value the rest of the features use putIfAbsent()
      // first argument grt key and second argument is a function for pass data to CartItem atributes
      //here use create product DateTime as id its not good way to define a new id but for now its good
      _items.putIfAbsent(
        productId,
        () => CartItem(
            id: DateTime.now().toString(),
            title: title,
            price: price,
            quantity: 1),
      );
    }
    print(_items.keys);
    notifyListeners();
  }
  int get itemCount{
    return _items.length;
  }
}
