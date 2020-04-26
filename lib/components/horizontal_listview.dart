import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_location: 'assets/images/categories/clockicon.png',
            image_caption: 'Clock',
          ),
          Category(
            image_location: 'assets/images/categories/lampIcon.png',
            image_caption: 'Lamp',
          ),
          Category(
            image_location: 'assets/images/categories/telephoneIcon.png',
            image_caption: 'Telephone',
          ),
          Category(
            image_location: 'assets/images/categories/VaseIcon.png',
            image_caption: 'Utensils',
          ),
          Category(
            image_location: 'assets/images/categories/furnitureIcon.png',
            image_caption: 'Furniture',
          ),
          Category(
            image_location: 'assets/images/categories/PaintingIcon.png',
            image_caption: 'Paintings',
          ),

        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({this.image_location, this.image_caption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100.0,
          child: ListTile(
            title: Image.asset(
              image_location,
              width: 100.0,
              height: 60.0,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(image_caption),
            ),
          ),
        ),
      ),
    );
  }
}
