import 'package:antiqueecom/pages/products_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
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
    },
    {
      'name': "Lamp",
      'picture': "assets/images/products/antique-lamp.jpg",
      'old_price': 1000,
      'price': 870,
    },
    {
      'name': "Telephone",
      'picture': "assets/images/products/atelephone.jpg",
      'old_price': 1000,
      'price': 780,
    },
    {
      'name': "Utinsils",
      'picture': "assets/images/products/autinsils.jpg",
      'old_price': 1000,
      'price': 980,
    },
    {
      'name': "MusicPlayer",
      'picture': "assets/images/products/turntables.png",
      'old_price': 1000,
      'price': 980,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
          childAspectRatio: MediaQuery
              .of(context)
              .size
              .width /
              (MediaQuery
                  .of(context)
                  .size
                  .height / 1.1),),
        itemBuilder: (BuildContext context, int index) {
          return Single_product(
            product_name: product_list[index]['name'],
            product_picture: product_list[index]['picture'],
            product_oldprice: product_list[index]['old_price'],
            product_price: product_list[index]['price'],
          );
        });
  }
}

class Single_product extends StatelessWidget {
  final product_name;
  final product_picture;
  final product_oldprice;
  final product_price;

  Single_product({this.product_name,
    this.product_picture,
    this.product_oldprice,
    this.product_price});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: product_name,
          child: Material(
            child: InkWell(
                onTap: () =>
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) =>
                        (
                            ProductDetails(product_detail_name: product_name,
                              product_detail_oldprice: product_oldprice,
                              product_detail_price: product_price,
                              product_detail_picture: product_picture,
                            )))),
                child: GridTile(

                  footer: Container(


                      color: Colors.white70,
                      child: Column(
                        children: <Widget>[

                          Text(product_name,
                            style: TextStyle(fontWeight: FontWeight.w300,
                                fontSize: 16.0),),

                          Text('\$${product_price}',
                              style: TextStyle(color: Colors.red),),

                        ],
                      )
                  ),
                  child: Image.asset(

                    product_picture,
                    fit: BoxFit.fill,
                  ),
                )),
          )),
    );
  }
}
