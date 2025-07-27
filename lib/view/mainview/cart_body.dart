import 'package:flutter/material.dart';
import 'package:foodiee/checkout_page.dart';
import 'package:foodiee/menu/global_variables.dart';
import 'package:foodiee/menu/lists.dart';
import 'package:foodiee/menu/ordered_product_container.dart';

class CartBody extends StatefulWidget {
  const CartBody({super.key});

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  @override
  void initState() {
    super.initState();
    if (!ordersMap.containsKey(globleemail)) {
      ordersMap[globleemail!] = [];
    }
    userOrders = ordersMap[globleemail]!;
    _calculateTotal();
  }

  void _calculateTotal() {
    globlePriceTotal = 0;
    for (var order in userOrders) {
      globlePriceTotal += int.tryParse(order['price'].toString()) ?? 0;
    }
  }

  void _removeItem(int index) {
    setState(() {
      int price = int.tryParse(userOrders[index]['price'].toString()) ?? 0;
      globlePriceTotal = (globlePriceTotal - price);
      userOrders.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 40),
          const Center(
            child: Text(
              "My cart",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: userOrders.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/cart.jpg',
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Empty cart",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )
                : ListView.builder(
                    itemCount: userOrders.length,
                    itemBuilder: (context, index) {
                      final item = userOrders[index];
                      return Dismissible(
                        key: UniqueKey(),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: Colors.red,
                          padding: const EdgeInsets.only(right: 20),
                          alignment: Alignment.centerRight,
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        onDismissed: (direction) {
                          _removeItem(index);
                        },
                        child: OrderedProductContainer(
                          name: item['name'],
                          image: item['image'],
                          price: item['price'],
                        ),
                      );
                    },
                  ),
          ),
          // Total and Buy Now Section
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Rs.$globlePriceTotal",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: userOrders.isEmpty
                        ? null
                        : () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return const CheckoutPage();
                              },
                            ));
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          userOrders.isEmpty ? Colors.grey[300] : Colors.orange,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Buy Now",
                      style: TextStyle(
                        color: userOrders.isEmpty ? Colors.grey : Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
