import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homedecor(),
    );
  }
}

class Homedecor extends StatefulWidget {
  const Homedecor({Key? key}) : super(key: key);



  @override
  State<Homedecor> createState() => _HomedecorState();
}

class _HomedecorState extends State<Homedecor> {

  List<Map<String, dynamic>> arrProduct = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Home Decors',
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple.shade100,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {

            },
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [

          buildProductCard(
              'images/h1.jpeg',
              'Product: Wooden Wall Hanging Room Decoration  ', 'Price: \$ 100',
              5,
              'True Decor Wooden Wall Hanging Room Decoration Items For Home/Office/Bedroom/Gift || 3D Effect Designer Wall Decor For Living Room'),
          buildProductCard(
              'images/h2.jpeg', 'Product: Birthday Decoration', 'Price: \$ 50',
              4.5,
              '100 Black and Golden Metallic Balloons ( 30-40 Balloons will be Stick on the ceiling and as bunches on wall with removable paper tapes.)"HAPPY BIRTHDAY" Occasion Foil Banner Ribbons to hang with balloons.'),
        ],
      ),
    );
  }

  Widget buildProductCard(String imagePath, String name, String price,
      double rating, String detail) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    price,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    detail,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RatingBarIndicator(
                        rating: rating,
                        itemCount: 5,
                        itemSize: 25.0,
                        itemBuilder: (context, _) =>
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                        },
                        child: const Text(
                          'Add',
                          style: TextStyle(fontSize: 19, color: Colors.blueAccent, decoration: TextDecoration.underline),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



