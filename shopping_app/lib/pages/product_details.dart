import 'package:flutter/material.dart';
import 'package:shopping_app/Model/products.dart';


class Product_Details extends StatefulWidget {
  final product_detail_name;
  final product_detail_picture;
  final product_detail_old_price;
  final product_detaile_price;
  Product_Details({
    this.product_detail_name,
    this.product_detail_picture,
    this.product_detail_old_price,
    this.product_detaile_price,
  });
  @override
  _Product_DetailsState createState() => _Product_DetailsState();
}

class _Product_DetailsState extends State<Product_Details> {
  bool changeColor = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        backgroundColor: Colors.orange,
      ),
      body: ListView(
        children: [
          Container(height: 10,),
          Container(
            color: Colors.white,
            height: 300,
//            color: Colors.black,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.product_detail_picture),
              ),
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    widget.product_detail_name,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  title: Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.product_detail_old_price,
                          style: TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.product_detaile_price,
                          style: TextStyle(
                              color: Colors.deepOrangeAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          color: changeColor ? Colors.redAccent : Colors.grey,
                          onPressed: () {
                            setState(() {
                              changeColor = !changeColor;
                            });
                          },
                          icon: Icon(
                            Icons.favorite,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          //The first Button
          Row(
            children: [
              //The Size selection button
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Size'),
                        content: Text(
                          'Choose the size',
                        ),
                        actions: [
                          MaterialButton(
                            onPressed: () {
                              Navigator.of(context).pop(context);
                            },
                            child: Text(
                              'close',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  color: Colors.white70,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text('Size'),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Color'),
                        content: Text(
                          'Choose the color',
                        ),
                        actions: [
                          MaterialButton(
                            onPressed: () {
                              Navigator.of(context).pop(context);
                            },
                            child: Text(
                              'close',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  color: Colors.white70,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text('Color'),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Quantity'),
                        content: Text(
                          'Choose the quantity',
                        ),
                        actions: [
                          MaterialButton(
                            onPressed: () {
                              Navigator.of(context).pop(context);
                            },
                            child: Text(
                              'close',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  color: Colors.white70,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text('Quantity'),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          //The Second Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //The Size selection button
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: MaterialButton(
                    onPressed: () {},
                    color: Colors.green,
                    textColor: Colors.white,
                    child: Text(
                      'Buy Now',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: MaterialButton(
                    onPressed: () {},
                    color: Colors.orange,
                    textColor: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Add to Cart     ',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.add_shopping_cart,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ),

//              IconButton(
//                onPressed: () {},
//                icon: Icon(
//                  Icons.add_shopping_cart,
//                  color: Colors.orange,
//                ),
//              ),
//              IconButton(
//                onPressed: () {},
//                icon: Icon(
//                  Icons.favorite_border,
//                  color: Colors.orange,
//                ),
//              )
            ],
          ),
          Divider(),
          ListTile(
            title: Text(
              'Product Details',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
                "FID's Shop is a trusted and reliable source for all your garment related needs from Bangladesh."
                " FID's Shop manufactures and supplies quality products in all categories at a competitive"
                " price range from their own and sister production facility."),
          ),
          Divider(),

          ListTile(
            title: Text(
              'Brand',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
                "FID's Brand"),
          ),

          ListTile(
            title: Text(
              'Product Condition',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
                "New"),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Similar Products',style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          Container(
            height: 360,
            child: SimilarProducts(),

          )

        ],
      ),
    );
  }
}
class SimilarProducts extends StatefulWidget {
  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {

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

class Similar_Single_Product extends StatelessWidget {
  final product_name;
  final product_picture;
  final product_old_price;
  final product_price;
  Similar_Single_Product({
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
