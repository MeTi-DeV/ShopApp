import 'package:flutter/material.dart';
//comment 1 : change product class to ChangeNotifier because we have a isFavorite atribute and its changeable
//comment 2 : one of big changes in use Provider  we can define calculate and functions inside them like toggledStatusFavorite in line 19
class Product with ChangeNotifier {
  final String id;
  final String description;
  final String title;
  final double price;
  final String imageUrl;
  bool isFavorite;
  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.imageUrl,
      this.isFavorite = false});

  void toggledStatusFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
