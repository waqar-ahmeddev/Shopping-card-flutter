import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;


class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
   List<String> productName =['Mango','Orange','Grapes','Banana','Chery','Peach','Mixed Fruit Basktet'];
   List<String> productUnit = ['kg','Dozen','kg','Dozen','kg','kg','kg'];
   List<int>  productPrice = [10,20,30,40,50,60,70];
   List<String> productImage = [
    'https://media.istockphoto.com/id/1179280426/photo/mango.webp?a=1&b=1&s=612x612&w=0&k=20&c=TA9Dw-31kOfenORFCaUjigCYzfPM7FK_QhRJGqi3v1Q=',
    'https://plus.unsplash.com/premium_photo-1724849326552-ff97b4a8ab93?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8T3JhbmdlJTIwYmFja2dyb3VuZCUyMHdoaXRlfGVufDB8fDB8fHww',
     'https://images.unsplash.com/photo-1615485925836-8ddb4b7f4433?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8R3JhcGVzJTIwYmFja2dyb3VuZCUyMHdoaXRlfGVufDB8fDB8fHww',
    'https://plus.unsplash.com/premium_photo-1724250081102-cab0e5cb314c?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8QmFuYW5hJTIwYmFja2dyb3VuZCUyMHdoaXRlfGVufDB8fDB8fHww',
    'https://images.unsplash.com/photo-1708454090964-e702b0f3ddae?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8Y2hlcnJ5JTIwYmFja2dyb3VuZCUyMHdoaXRlfGVufDB8fDB8fHww',
    'https://images.unsplash.com/photo-1658940963841-c45b83352db2?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8cGVhY2glMjBiYWNrZ3JvdW5kJTIwd2hpdGV8ZW58MHx8MHx8fDA%3D',
    'https://media.istockphoto.com/id/1398154625/photo/bowl-of-fruit-salad.webp?a=1&b=1&s=612x612&w=0&k=20&c=6ZGDnM7PzPlek-iU38dD513R0GQWpOo-2nAGuF-Xdu4='
   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
         body: Column(
          children: [
              Expanded(
               child: ListView.builder(
                itemCount: productName.length,
                itemBuilder: (context,index){
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                            children: [
                          Image(
                            height: 100,
                            width: 100,
                            image: NetworkImage(productImage[index].toString()),
                          ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Text(productName[index].toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                              SizedBox(height: 5),
                              Text(productUnit[index].toString() +" " +r"$" +  productPrice[index].toString()
                              ,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                              ],
                              ),
                            ),
                         SizedBox(height: 5),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                height:35,
                                width: 100,
                                 decoration: BoxDecoration(
                                   color: Colors.green,
                                   borderRadius: BorderRadius.circular(5),
                                 ),  
                                 child: Center(
                                   child: Text(
                                    'Add to Cart',style: TextStyle(color: Colors.white),
                                   ),
                                 ), 
                            ),
                            )
                          ],
                          ),
                      ],
                      ),
                    ),
                  );
               }
               ) 
              )
          ],
         ) 
      );
  }
} 