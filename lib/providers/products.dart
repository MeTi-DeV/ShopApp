import 'package:flutter/material.dart';
import '../models/product.dart';
//comment 1 : one of most important Part is Provider for state management our application 
// its work for changes on parts of application its see to changes and update them 
// its help to we have a better and cleaner main.dart file 


//comment 2 : first install Provider package I dont import that here but this file is for my products properties
//comment 3 : for create this class we use 'with' and ChangeNotifier its mean our class maybe changeable and user add more products to this file
// so define List with properties of Product class and make this name to _items
class Products with ChangeNotifier {
  List<Product> _items =[
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];
  //comment 4 : after use dynamic calculation method and make it name to items
  List<Product> get items {
    //comment 5 : return it as[..._items] for say this list maybe is a list different counts and its will be addable and deleteable to _items list
    return [..._items];
  }
//comment 6 : define addProducts for add more products and inside it we have notifyListeners for give changes and updated changes to Provider constractor
  void addProducts() {
    notifyListeners();
  }
}
