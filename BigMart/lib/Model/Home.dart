import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:shopping_app/Model/horizontal_listview.dart';
import 'package:shopping_app/Model/products.dart';
import 'package:shopping_app/pages/cart.dart';
class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isSearching = false;
  Widget image_carousel = new Container(
    height: 200,
    child: Carousel(
      boxFit: BoxFit.fill,
      images: [
        AssetImage('images/combooffer.jpg'),
        AssetImage('images/model_1.jpg'),
        AssetImage('images/model_3.jpg'),
        AssetImage('images/model_4.jpeg'),
        AssetImage('images/wintersale.jpg'),
        AssetImage('images/watch.jpg'),
        AssetImage('images/shoes.jpg'),
      ],
      autoplay: true,
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(microseconds: 1000),
      dotSize: 4,
      indicatorBgPadding: 8,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        title: !isSearching? Text('BIG MART'):TextField(decoration: InputDecoration(hintText: "Search Products",hintStyle: TextStyle(color: Colors.white)),style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(

            icon: !isSearching ? Icon(Icons.search) : Icon(Icons.cancel) ,

            onPressed: (){

              setState(() {

                this.isSearching = !this.isSearching;

              });

            },

          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Cart()));
            },
            icon: Icon(Icons.shopping_cart, color: Colors.white),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('User'),
              accountEmail: Text('user@usermail.com'),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ),
              decoration: BoxDecoration(color: Colors.lightGreen),
            ),
            ListTile(
              onTap: () {},
              title: Text('Home'),
              leading: Icon(
                Icons.home,
                color: Colors.deepOrangeAccent,
              ),
            ),
            ListTile(
              onTap: () {},
              title: Text('My Account'),
              leading: Icon(
                Icons.person,
                color: Colors.deepOrangeAccent,
              ),
            ),
            ListTile(
              onTap: () {},
              title: Text('My Orders'),
              leading:
                  Icon(Icons.shopping_basket, color: Colors.deepOrangeAccent),
            ),
            ListTile(
              onTap: () {},
              title: Text('Categories'),
              leading: Icon(Icons.category, color: Colors.deepOrangeAccent),
            ),
            ListTile(
              onTap: () {},
              title: Text('Favourites'),
              leading: Icon(Icons.favorite, color: Colors.deepOrangeAccent),
            ),
            Divider(),
            ListTile(
              onTap: () {},
              title: Text('Settings'),
              leading: Icon(Icons.settings),
            ),
            ListTile(
              onTap: () {},
              title: Text('About'),
              leading: Icon(
                Icons.help,
                color: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          //Image carousel begins here
          image_carousel,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Catagories'),
          ),
          //Horizontal list view begins here
          HorizontalList(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Recent Product'),
          ),
          Container(
            height: 320,
            child: Products(

            ),
          )
        ],
      ),
    );
  }
}
