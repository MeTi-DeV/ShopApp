import 'package:flutter/material.dart';
import '../widgets/cart_item.dart';
import 'package:provider/provider.dart';
//comment 4 : here i define cart provider with specific name by Cart its mean Cart class and CartItem class both known by a name and its Cart
// I do this provider like this because CartItem in this class and CartItem that i created in widgets folder they have a same name and it was a problem
import '../providers/cart.dart' show Cart;


//coment 1 : create Cart Screen
class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
   
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(5),
            child: Padding(
              padding:  EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total :',
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Chip(
                      backgroundColor: Theme.of(context).primaryColor,
                      label: Text(
                        //comment 2 : show total of Amounts here get from Cart provider and we calculated that by totalAmount dynamic calculator
                        '${cart.totalAmount}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Spacer(),
                  RaisedButton(
                    onPressed: () {},
                    child:
                        Text('Pay Now', style: TextStyle(color: Colors.white)),
                    color: Colors.teal.shade700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  )
                ],
              ),
            ),
          ),
//comment 3 : then we show all products that we chosen and them added to Cart show like a list
            Expanded(
              child: ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (BuildContext context, int index) => Container(
                    child: CartItem(
                      //comment 5 : add .values.toList()[index] : because we need the values of items in Cart provider and we get an error for this case
                      // .values.toList()[index] makes values of items as a list and we can pass them to CartItem
                        cart.items.values.toList()[index].id,
                        cart.items.values.toList()[index].title,
                        cart.items.values.toList()[index].price,
                        cart.items.values.toList()[index].quantity,
                        ),
                  ),
                ),
            ),
            
        
        ],
      ),
    );
  }
}
