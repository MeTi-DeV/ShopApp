import 'package:flutter/material.dart';

class Product {
  final String id;
  final String description;
  final String title;
  final double price;
  final String imageUrl;
  // bool favorite = false;
   Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.imageUrl,
      // required this.favorite
      });
}
