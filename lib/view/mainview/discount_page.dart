import 'package:flutter/material.dart';
import 'package:foodiee/menu/global_variables.dart';
import 'package:foodiee/view/mainview/cart_body.dart';
import 'package:lottie/lottie.dart';

class DiscountPage extends StatefulWidget {
  const DiscountPage({super.key, required this.discountMessage});

  final String discountMessage;

  @override
  State<DiscountPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DiscountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Lottie.asset(
              'assets/animations/congratulations.json',
              //repeat: false
            ),
            Text(
              widget.discountMessage,
              style: const TextStyle(color: Colors.white, fontSize: 17),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Orignal Price: $globlePriceTotal",
              style: const TextStyle(
                color: Colors.white, fontSize: 17,
                decoration: TextDecoration
                    .lineThrough, // Adds the line through the text
                decorationColor: Colors.red, // Optional: Change the line color
                decorationThickness:
                    2.0, // Optional: Adjust the thickness of the line
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Now: ${(globlePriceTotal * 0.80).toInt()}",
              style: const TextStyle(color: Colors.white, fontSize: 17),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return const CartBody();
                    },
                  ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Go to the Cart page",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
//Congratulations you have availed the discount of 15%