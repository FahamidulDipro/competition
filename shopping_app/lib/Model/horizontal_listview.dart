import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Catagory(
            image_location: 'images/catagories/shirt.png',
            image_caption: 'Shirt',
          ),
          Catagory(
            image_location: 'images/catagories/pant.png',
            image_caption: 'Pants',
          ),
          Catagory(
            image_location: 'images/catagories/skirt.png',
            image_caption: 'Dress',
          ),
          Catagory(
            image_location: 'images/catagories/shoe.png',
            image_caption: 'Shoes',
          ),
          Catagory(
            image_location: 'images/catagories/cap.png',
            image_caption: 'Cap',
          ),
          Catagory(
            image_location: 'images/catagories/heels.png',
            image_caption: 'Heels',
          ),
        ],
      ),
    );
  }
}

class Catagory extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Catagory({
    this.image_location,
    this.image_caption,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 100,
        child: ListTile(
          title: Image.asset(
            image_location,
            width: 80,
            height: 30,

          ),
          subtitle: Container(
            alignment: Alignment.center,
              child: Text(image_caption),
          ),
        ),
      ),
    );
  }
}
