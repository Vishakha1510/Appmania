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
      home: Fragrances(),
    );
  }
}

class  Fragrances extends StatefulWidget {
  const Fragrances({Key? key}) : super(key: key);



  @override
  State<Fragrances> createState() => _FragrancesState();
}

class _FragrancesState extends State<Fragrances> {

  List<Map<String, dynamic>> arrProduct = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Fragrances',
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
              'images/f1.jpeg', 'Fragrance: Plum Perfume', 'Price: \$ 1000', 5,
              'Its olfactory profile is soft, fruity and sweet, with subtle notes of flowers and spices. Its trail can be described as sweet, fruity and slightly woody. Top notes of plum offer juicy sweetness and a delicately fruity fragrance to perfumes.'),
          buildProductCard(
              'images/f2.jpg', 'Fragrance: Citrus&Lavender', 'Price: \$ 2500',
              4.5,
              'Citrus&Lavender opens with a mix of citrus notes before it evolves to reveal its true nature with a blend of the three greatest floral notes: lavender, rose and iris.Finishing touch is based on a solid cedar-sandalwood accord with soft musk ...'),
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



