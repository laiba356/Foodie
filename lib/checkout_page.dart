import 'package:flutter/material.dart';
import 'package:foodiee/menu/global_variables.dart';
import 'package:foodiee/order_confirmed_page.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Info Section
            Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  child: Icon(Icons.person, size: 30),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$globleemail',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        globleAddress == null
                            ? "Address not specified"
                            : "$globleAddress",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            const Divider(),
            // Delivery Option
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Delivery Option',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                TextButton(
                  onPressed: () {
                    // Navigate to delivery options
                  },
                  child: const Text('View all options'),
                ),
              ],
            ),
            const ListTile(
              leading: Icon(Icons.local_shipping),
              title: Text(
                'Standard Delivery',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                'Guaranteed by 13-15 Jan',
                style: TextStyle(color: Colors.white),
              ),
              trailing: Text(
                'Rs. 0',
                style: TextStyle(color: Colors.white),
              ),
            ),
            //  const SizedBox(height: 50),
            const Divider(),
            const SizedBox(height: 20),
            // Pricing Summary
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  ' Subtotal',
                  style: TextStyle(color: Colors.white),
                ),
                // const SizedBox(height: 5),
                Text('Rs. $globlePriceTotal',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white)),
              ],
            ),

            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Shipping Fee Subtotal',
                  style: TextStyle(color: Colors.white),
                ),
                // const SizedBox(height: 5),
                Text('Rs. 0',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white)),
              ],
            ),

            const SizedBox(height: 280),

            // Total
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                ),
                Text(
                  'Rs. $globlePriceTotal',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'VAT included, where applicable',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),

            // Place Order Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return const OrderConfirmedPage();
                    },
                  ));
                },
                child: const Text('Place Order'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
