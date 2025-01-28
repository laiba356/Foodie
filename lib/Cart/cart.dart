import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  // Example list to hold cart items
  final List<String> _cartItems = [];

  // Function to add an item to the cart
  void _addItemToCart(String item) {
    setState(() {
      _cartItems.add(item);
    });
  }

  // Function to remove an item from the cart
  void _removeItemFromCart(String item) {
    setState(() {
      _cartItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: _cartItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_cartItems[index]),
            trailing: IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              onPressed: () => _removeItemFromCart(_cartItems[index]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Example item to add to the cart
          _addItemToCart('Item ${_cartItems.length + 1}');
        },
        child: const Icon(Icons.add_shopping_cart),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Cart(),
  ));
}
