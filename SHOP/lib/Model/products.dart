import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/pages/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name": "Grey Blazer",
      "picture": "images/products/blazer.jpg",
      "old_price": "600/-",
      "price": "400/-",
    },
    {
      "name": "Black Blazer",
      "picture": "images/products/blazer2.webp",
      "old_price": "800/-",
      "price": "450/-",
    },
    {
      "name": "Dress",
      "picture": "images/products/dress.jpg",
      "old_price": "400/-",
      "price": "300/-",
    },
    {
      "name": "Special Dress",
      "picture": "images/products/dress2.jpg",
      "old_price": "600/-",
      "price": "400/-",
    },
    {
      "name": "Jeans Pant",
      "picture": "images/products/jeans.jpg",
      "old_price": "600/-",
      "price": "400/-",
    },
    {
      "name": "Jeans pant",
      "picture": "images/products/jeans2.webp",
      "old_price": "500/-",
      "price": "300/-",
    },
    {
      "name": "Full Sleeve Shirt",
      "picture": "images/products/shirt.jpg",
      "old_price": "300/-",
      "price": "200/-",
    },
    {
      "name": "T-Shirt",
      "picture": "images/products/tshirt.png",
      "old_price": "200/-",
      "price": "150/-",
    },
    {
      "name": "Shoes",
      "picture": "images/products/shoes.webp",
      "old_price": "1000/-",
      "price": "600/-",
    },
    {
      "name": "Heels",
      "picture": "images/products/heels.jpg",
      "old_price": "600/-",
      "price": "500/-",
    },
    {
      "name": "Sneakers",
      "picture": "images/products/sneakers.webp",
      "old_price": "300/-",
      "price": "250/-",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return Single_Product(
          product_name: product_list[index]["name"],
          product_picture: product_list[index]["picture"],
          product_old_price: product_list[index]["old_price"],
          product_price: product_list[index]["price"],
        );
      },
      itemCount: product_list.length,
    );
  }
}

class Single_Product extends StatelessWidget {
  final product_name;
  final product_picture;
  final product_old_price;
  final product_price;
  Single_Product({
    this.product_name,
    this.product_picture,
    this.product_old_price,
    this.product_price,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: product_name,
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Product_Details(
                  product_detail_name: product_name,
                  product_detail_picture: product_picture,
                  product_detail_old_price: product_old_price,
                  product_detaile_price: product_price,
                ),
              ),
            ),
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    product_name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Text(
                    product_price,
                    style: TextStyle(
                        color: Colors.deepOrange, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    product_old_price,
                    style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.lineThrough),
                  ),
                ),
              ),
              child: Image.asset(product_picture, fit: BoxFit.fill),
            ),
          ),
        ),
      ),
    );
  }
}
