import 'package:flutter/material.dart';
import 'package:foodiee/menu/lists.dart';
import 'package:foodiee/menu/ordered_product_container.dart';
import 'package:foodiee/view/productdetailscreens/pizza_detail_page.dart';

class FavouritesBody extends StatefulWidget {
  const FavouritesBody({
    super.key,
  });

  @override
  State<FavouritesBody> createState() => _FavouritesBodyState();
}

class _FavouritesBodyState extends State<FavouritesBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Favourites",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: listOfFavourites.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        transitionDuration: const Duration(
                            milliseconds: 1000), // Animation duration
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return PizzaDetailPage(
                            name: listOfFavourites[index]['name'],
                            image: listOfFavourites[index]['image'],
                            description: listOfFavourites[index]['description'],
                            heroTag: listOfFavourites[index]['name'],
                            price: listOfFavourites[index]['price'],
                          );
                        },
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          const begin =
                              Offset(-1.0, 0.0); // Start from the left
                          const end = Offset.zero; // End at the center
                          const curve = Curves.easeInOut;

                          var tween = Tween(begin: begin, end: end)
                              .chain(CurveTween(curve: curve));
                          var offsetAnimation = animation.drive(tween);

                          return SlideTransition(
                            position: offsetAnimation,
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: OrderedProductContainer(
                    name: listOfFavourites[index]['name'],
                    image: listOfFavourites[index]['image'],
                    price: listOfFavourites[index]['price'],
                  ),
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
