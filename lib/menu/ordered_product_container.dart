import 'package:flutter/material.dart';
import 'package:foodiee/menu/global_variables.dart';

class OrderedProductContainer extends StatefulWidget {
  final String image;
  final String name;
  final int price;

  const OrderedProductContainer({
    super.key,
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  State<OrderedProductContainer> createState() =>
      _OrderedProductContainerState();
}

class _OrderedProductContainerState extends State<OrderedProductContainer> {
  int quantity = 1;

  void _increaseQuantity() {
    setState(() {
      quantity += 1;
      globlePriceTotal += widget.price;
    });
  }

  void _decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity -= 1;
        globlePriceTotal -= widget.price;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Minimum quantity is 1'),
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Hero(
              tag: widget.name,
              child: Image.asset(
                widget.image,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Rs.${widget.price}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: _increaseQuantity,
                icon: const Icon(Icons.add, color: Colors.orange),
              ),
              Text(
                "$quantity",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: _decreaseQuantity,
                icon: const Icon(Icons.remove, color: Colors.orange),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
