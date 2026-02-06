import 'package:flutter/material.dart';
import 'package:shoppingcard/card_model.dart';
import 'package:shoppingcard/cart_db.dart';
// import 'package:shoppingcard/cart_model.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  List<Cart> cartItems = [];

  @override
  void initState() {
    super.initState();
    loadCart();
  }

  void loadCart() async {
    cartItems = await CartDatabase.instance.getCartItems();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Cart")),
      body: cartItems.isEmpty
          ? Center(child: Text("Cart is empty"))
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(cartItems[index].image!),
                  title: Text(cartItems[index].productName!),
                  subtitle: Text("Qty: ${cartItems[index].quantity}"),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () async {
                      await CartDatabase.instance
                          .deleteItem(cartItems[index].id!);
                      loadCart();
                    },
                  ),
                );
              },
            ),
    );
  }
}
