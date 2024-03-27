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
      home: SmartPhones(),
    );
  }
}

class SmartPhones extends StatefulWidget {
  const SmartPhones({Key? key}) : super(key: key);



  @override
  State<SmartPhones> createState() => _SmartPhonesState();
}

class _SmartPhonesState extends State<SmartPhones> {

  List<Map<String, dynamic>> arrProduct = [];

  int cartCount = 0;
  double cartAmount = 0;

  void addToCart(int index) {
    setState(() {
      if (arrProduct[index]['qty'] == 0) {
        arrProduct[index]['qty']++; // Increment quantity
        cartCount++; // Increment cart count
        cartAmount += arrProduct[index]['amount'];
      } else {
        arrProduct[index]['qty']--; // Decrement quantity
        cartCount--; // Decrement cart count
        cartAmount -= arrProduct[index]['amount'];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Smartphones',
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
              'images/iphone9.jpg', 'SmartPhone: iphone 9', 'Price: \$ 500',
              3.5,
              'Display: 5.2 inches (13.21 cm)OLED.\nscreen resolution: 750 x 1334 pixels.\nprocessor: Apple A13 Bionic processor.\nBattery: 2050 mAh.'),
          buildProductCard(
              'images/iphonex.jpeg', 'SmartPhone: iphone X', 'Price: \$ 550', 5,
              'Display:  5.8″.\nscreen resolution: 1125 x 2436 pixels.\nprocessor: Apple A11 Bionic processor.\nBattery: Endurance rating 74h.'),
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



