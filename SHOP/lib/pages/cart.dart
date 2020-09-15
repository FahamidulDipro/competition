import 'package:flutter/material.dart';
import 'package:shopping_app/Model/cart_products.dart';
class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Shopping Cart'),
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.search,color: Colors.white,),
          )
        ],
      ),
      bottomNavigationBar: Container(
        color:Colors.white,
        child: Row(
          children: [
            Expanded(
              child: ListTile(
                title: Text('Total Amount : '),
                subtitle: Text('BDT ${100}'),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right:18.0),
                child: MaterialButton(
                  onPressed: (){
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Icon(Icons.check_circle_outline,color: Colors.green,size: 50,),
                          content: Text("You have successfully purchased your product."),
                        )
                      );



                  },
                  child: Text('Check Out',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                  color: Colors.green,
                ),
              ),
            )
          ],
        ),
      ),
      body: CartProducts(),
    );
  }
}
