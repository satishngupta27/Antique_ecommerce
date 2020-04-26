import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cart_Products extends StatefulWidget {
  @override
  _Cart_ProductsState createState() => _Cart_ProductsState();
}

class _Cart_ProductsState extends State<Cart_Products> {
  var cart_product_list = [
    {
      'name': "Chair",
      'picture': "assets/images/products/achair.jpg",
      'old_price': 1000,
      'price': 900,
    },
    {
      'name': "Clock",
      'picture': "assets/images/products/aclock.png",
      'old_price': 1000,
      'price': 830,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return Single_Cart_product(
            cart_product_name: cart_product_list[index]['name'],
            cart_product_picture: cart_product_list[index]['picture'],
            cart_product_oldprice: cart_product_list[index]['oldprice'],
            cart_product_price: cart_product_list[index]['price'],
          );
        });
  }
}

class Single_Cart_product extends StatelessWidget {
  final cart_product_name;
  final cart_product_picture;
  final cart_product_oldprice;
  final cart_product_price;

  Single_Cart_product(
      {this.cart_product_name,
      this.cart_product_picture,
      this.cart_product_oldprice,
      this.cart_product_price});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.asset(
              cart_product_picture,
              height: 100.0,
              width: 100.0,
            ),
            title: Text(cart_product_name),
            subtitle: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  child: Text('\$${cart_product_price}'),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text('Qty : ' + '5'),
                ),
              ],
            ),
            trailing: Container(
              height: 100,
              width: 125,
              child: Row(
                children: <Widget>[
                  IconButton(icon: Icon(Icons.arrow_left), onPressed: () {}),
                  Text('data'),
                  IconButton(icon: Icon(Icons.arrow_right), onPressed: () {}),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
