import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;


class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:  Text("Product List"),
        centerTitle: true,
          actions: [
        badges.Badge(
         badgeContent: const Text('0', style: TextStyle(color: Colors.white, fontSize: 12), ),
        child: const Icon(Icons.shopping_bag_outlined),
            ),
             const SizedBox(width: 20),
         ],
        ),
      );
  }
}