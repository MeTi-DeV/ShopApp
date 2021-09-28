import 'package:flutter/material.dart';
import '../widgets/product_grid.dart';
//comment 2 : define Filters options as enum function
enum FavoriteOptions { All, Favorite }
//comment 3 : change widget to StatefulWidget because this screen is changeable with filters
class OverviewProductsScreen extends StatefulWidget {
  @override
  State<OverviewProductsScreen> createState() => _OverviewProductsScreenState();
}

class _OverviewProductsScreenState extends State<OverviewProductsScreen> {
  //comment 4 : define a bool variable for handle filters All products and Favorite products
  var _selectFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [ 
            //comment 1 : PopupMenuButton is a menu with three dots
            PopupMenuButton(
              //comment 5 : onSelected is property for clickabel PopupMenuItems
              onSelected: (FavoriteOptions selectedValue) {
                //comment 6 :put if statement in setState because application ui change by these if statements
                setState(() {
                  if (selectedValue == FavoriteOptions.Favorite) {
                    _selectFavorite = true;
                  } else {
                    _selectFavorite = false;
                  }
                });
              },
              //comment 7 : itemBuilder is for create PopupMenuButton options it has child for title and value for resive
              // handle data and change ui by tap on one of these

              itemBuilder: (_) => [
                PopupMenuItem(
                    child: Text('Show Favorite'),
                    value: FavoriteOptions.Favorite),
                PopupMenuItem(
                    child: Text('Show All'), value: FavoriteOptions.All)
              ],
            ),
          ],
          title: Text('Shop App'),
        ),
        //comment 8 : pass _selectFavorite to ProductGrid for show all products and favorite products by this variable
        body: ProductGrid(_selectFavorite));
  }
}
