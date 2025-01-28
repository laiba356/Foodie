import 'package:flutter/material.dart';
import 'package:foodiee/menu/global_variables.dart';
import 'package:foodiee/menu/lists.dart';

import 'dessert.dart';

class DessertCard extends StatefulWidget {
  final FoodCategory dessert;

  const DessertCard({super.key, required this.dessert});

  @override
  State<DessertCard> createState() => _DessertCardState();
}

class _DessertCardState extends State<DessertCard> {
  @override
  void initState() {
    super.initState();
    if (!favouritesMap.containsKey(globleemail)) {
      favouritesMap[globleemail!] = [];
    }
    listOfFavourites = favouritesMap[globleemail]!;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: widget.dessert.name,
                  child: Image.asset(
                    widget.dessert.imageUrl,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      "${widget.dessert.discount}% Off",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: InkWell(
                    onTap: favouriteIconOntap,
                    child: Icon(
                      widget.dessert.isFavourite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: widget.dessert.isFavourite
                          ? Colors.orange
                          : Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.dessert.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.dessert.description,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text.rich(
                    TextSpan(
                      children: [
                        // const TextSpan(
                        //   text: "From ",
                        //   style: TextStyle(
                        //     color: Colors.grey,
                        //   ),
                        // ),
                        TextSpan(
                          text: "Rs. ${widget.dessert.price}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: " Rs. ${widget.dessert.originalPrice}",
                          style: const TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void favouriteIconOntap() {
    setState(() {
      widget.dessert.isFavourite = !widget.dessert.isFavourite;
    });

    if (widget.dessert.isFavourite) {
      listOfFavourites.add({
        'name': widget.dessert.name,
        'price': widget.dessert.price,
        'image': widget.dessert.imageUrl,
        'description': widget.dessert.description
      });
    } else {
      listOfFavourites
          .removeWhere((item) => item['name'] == widget.dessert.name);
    }
  }
}
