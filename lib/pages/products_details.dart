import 'package:antiqueecom/main.dart';
import 'package:flutter/material.dart';


class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_oldprice;
  final product_detail_price;
  final product_detail_picture;

  ProductDetails({this.product_detail_name,
    this.product_detail_oldprice,
    this.product_detail_price,
    this.product_detail_picture});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Text('Antique')),
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),

        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 300,
            child: GridTile(
              child: Container(
                color: Colors.white70,
                child: Image.asset(widget.product_detail_picture),
              ),
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(widget.product_detail_name),
                  title: Text("\$${widget.product_detail_price}"),
                  trailing: Text(
                    "\$${widget.product_detail_oldprice}",
                    style: TextStyle(decoration: TextDecoration.lineThrough),
                  ),
                ),
              ),
            ),
          ),
          //===============first button==================
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Quantity'),
                            content: Text('Choose qty'),
                            actions: <Widget>[
                              MaterialButton(onPressed: () {
                                Navigator.of(context).pop(context);
                              }, child: Text('Close'),),
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text('Qty'),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          //=====================second button=======================
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                    onPressed: () {},
                    color: Colors.red,
                    textColor: Colors.white,
                    elevation: 0.2,
                    child: Text('Buy Now')),
              ),
              IconButton(
                  icon: Icon(Icons.shopping_cart),
                  color: Colors.red,
                  onPressed: () {}),
              IconButton(
                  icon: Icon(Icons.favorite_border),
                  color: Colors.red,
                  onPressed: () {}),
            ],
          ),
          Divider(),
          ListTile(
            title: Text('Product Details'),
            subtitle: Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),


          ),
          Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text('Product Name'),),
              Padding(padding: const EdgeInsets.all(5.0),
                child: Text(widget.product_detail_name),)
            ],
          ),
          Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text('Product Brand'),),
              Padding(
                padding: const EdgeInsets.all(5.0), child: Text('Unkown'),)
            ],
          ),
          Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text('Product Condition'),),
              Padding(padding: const EdgeInsets.all(5.0), child: Text('Good'),)
            ],
          ),
          //similiar product section
          Container(
            height: 360,
            child: SimiliarProducts(),
          )
        ],
      ),
    );
  }
}

class SimiliarProducts extends StatefulWidget {
  @override
  _SimiliarProductsState createState() => _SimiliarProductsState();
}

class _SimiliarProductsState extends State<SimiliarProducts> {
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
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Similar_Single_product(
            product_name: product_list[index]['name'],
            product_picture: product_list[index]['picture'],
            product_oldprice: product_list[index]['old_price'],
            product_price: product_list[index]['price'],
          );
        });
  }
}

class Similar_Single_product extends StatelessWidget {
  final product_name;
  final product_picture;
  final product_oldprice;
  final product_price;

  Similar_Single_product({this.product_name,
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
                      child: Row(
                        children: <Widget>[

                          Expanded(child: Text(product_name,
                            style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 16.0),)),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                            child: Text('\$${product_price}',
                              style: TextStyle(color: Colors.red),),
                          )
                        ],
                      )
                  ),
                  child: Image.asset(
                    product_picture,
                    fit: BoxFit.cover,
                  ),
                )),
          )),
    );
  }
}
