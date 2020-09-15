import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var products_on_cart = [
    {
      "name": "Grey Blazer",
      "picture": "images/products/blazer.jpg",
      "price": "400/-",
      "size": "M",
      "color": "black",
      "quantity": 1,
    },
    {
      "name": "Shoes",
      "picture": "images/products/shoes.webp",
      "price": "600/-",
      "size": "M",
      "color": "brown",
      "quantity": 1,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return SingleCartProduct(
          cart_product_name: products_on_cart[index]["name"],
          cart_product_picture: products_on_cart[index]["picture"],
          cart_product_color: products_on_cart[index]["color"],
          cart_product_size: products_on_cart[index]["size"],
          cart_product_quantity: products_on_cart[index]["quantity"],
          cart_product_price: products_on_cart[index]["price"],
        );
      },
      itemCount: products_on_cart.length,
    );
  }
}

class SingleCartProduct extends StatelessWidget {
  final cart_product_name;
  final cart_product_picture;
  final cart_product_price;
  final cart_product_size;
  final cart_product_color;
  final cart_product_quantity;
  SingleCartProduct({
      this.cart_product_name,
      this.cart_product_picture,
      this.cart_product_color,
      this.cart_product_size,
      this.cart_product_quantity,
      this.cart_product_price});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(cart_product_picture),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 40.0),
          child: Text(cart_product_name),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Quantity : ${cart_product_quantity}"),
            Text("Size : ${cart_product_size}"),
            Text("Color : ${cart_product_color}"),
          ],
        ),
        trailing: Column(
          children: [
            Expanded(
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_drop_up),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:38.0),
              child: Text("${cart_product_quantity}"),
            ),
            Expanded(
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_drop_down),
              ),
            )


          ],
        ),
      ),
    );
  }
}
//void addQuantity(){
//  cart_product_quantity += 1;
//}
