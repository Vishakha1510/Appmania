import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final List<Map<String, dynamic>> cartProducts;
  final double totalAmount;

  const CartScreen({Key? key, required this.cartProducts, required this.totalAmount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cart',
          style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),
        ),
        backgroundColor: Colors.teal.shade100,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Cart Items...',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartProducts.length,
              itemBuilder: (context, index) {
                final product = cartProducts[index];
                return ListTile(
                  leading: Image.asset(
                    product['image'],
                    width: 100,
                    height: 100,
                    fit: BoxFit.fitHeight,
                  ),
                  title: Text(product['title']),
                  subtitle: Text('Quantity: ${product['qty']}'),
                  trailing: Text('\$ ${product['amount'] * product['qty']}'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Container(
              color: Colors.teal.shade200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Total Items: ${cartProducts.length}',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Total Amount: \$ $totalAmount',
                    style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



