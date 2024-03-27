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
      home: DetailScreen(),
    );
  }
}

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);



  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  List<Map<String, dynamic>> arrProduct = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Detail Page',
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple.shade100,

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
          buildProductCard(
              'images/macbook.webp', 'Laptop: MacBook Pro', 'Price: \$ 800', 5,
              'Display resolution: 2560x1600 pixels\nprocessor: Core i5\nRAM: 12GB\nSSD storage:512GB\nDisplay: size13.30-inch'),
          buildProductCard(
              'images/laptop.jpg', 'Laptop: HP Victus 15', 'Price: \$ 899', 4.5,
              'Display: 15.6-inch\nBattery: 70Wh\nStorage: 512GB\nMemory: 16GB DDR4 3200MHz (2x 8GB)\nCPU: Intel Core i5-12500H'),
          buildProductCard(
              'images/f1.jpeg', 'Fragrance: Plum Perfume', 'Price: \$ 1000', 5,
              'Its olfactory profile is soft, fruity and sweet, with subtle notes of flowers and spices. Its trail can be described as sweet, fruity and slightly woody. Top notes of plum offer juicy sweetness and a delicately fruity fragrance to perfumes.'),
          buildProductCard(
              'images/f2.jpg', 'Fragrance: Citrus&Lavender', 'Price: \$ 2500',
              4.5,
              'Citrus&Lavender opens with a mix of citrus notes before it evolves to reveal its true nature with a blend of the three greatest floral notes: lavender, rose and iris.Finishing touch is based on a solid cedar-sandalwood accord with soft musk ...'),
          buildProductCard(
              'images/s1.jpg', 'Product: Hyaluronic Water', 'Price: \$ 300', 5,
              'Studd Muffyn Hyaluronic Gel- for Hydration, Toning - with Hyaluronic Acid, Kiwi, Papaya, -For All Skin Types for Men and Women-100ml'),
          buildProductCard(
              'images/s2.jpg', 'Product: Cleanser', 'Price: \$ 350', 4.5,
              'Minimalist 2% Salicylic Acid + LHA Face Cleanser With Zinc For Reducing Sebum & Acne'),
          buildProductCard(
              'images/g1.jpeg', 'Product: Coffee', 'Price: \$ 200', 5,
              'NESCAFE Classic Instant Coffee Powder | Instant Coffee Made with Robusta Beans | Roasted Coffee Beans | 100% Pure Coffee | 45 grams Jar'),
          buildProductCard(
              'images/g2.jpeg', 'Product: Maggi', 'Price: \$ 10', 4.5,
              'MAGGI Noodles - Masala, Made With Quality Spices, Rich In Fibre, 32 g Pouch'),
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



