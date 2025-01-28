import 'package:flutter/material.dart';
import 'package:foodiee/menu/global_variables.dart';
import 'package:foodiee/menu/lists.dart';
import '../orderstatus/pizza_order_status.dart';

class SushiDetailPage extends StatefulWidget {
  final String name;
  final String image;
  final int price;
  final String description;
  final String heroTag;
  const SushiDetailPage(
      {super.key,
      required this.name,
      required this.image,
      required this.description,
      required this.heroTag,
      required this.price});

  @override
  State<SushiDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<SushiDetailPage> {
  int groupValue1 = 1;
  int groupValue2 = 4;
  bool isCheeseChecked = false;
  bool isPeperroniChecked = false;
  bool isMushroomChecked = false;
  bool isOliveChecked = false;
  bool isJalapenoChecked = false;

  @override
  void initState() {
    super.initState();
    if (!ordersMap.containsKey(globleemail)) {
      ordersMap[globleemail!] = [];
    }
    userOrders = ordersMap[globleemail]!;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var Size(:height, :width) = size;

    return Scaffold(
      body: Stack(
        children: [
          // Scrollable content
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: height * 0.3,
                floating: true,
                // pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Hero(
                    tag: widget.name, // Use the same tag as in MealCard
                    child: Image.asset(
                      widget.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Text(
                        widget.name,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Rs ${widget.price}",
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        widget.description,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: height * 0.03),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Fixed white container at the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // Decrement button
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              shape: BoxShape.circle,
                            ),
                            child:
                                const Icon(Icons.remove, color: Colors.black),
                          ),
                          const SizedBox(width: 8),
                          // Quantity display
                          const Text('1', style: TextStyle(fontSize: 16)),
                          const SizedBox(width: 8),
                          // Increment button
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.add, color: Colors.white),
                          ),
                        ],
                      ),
                      // Add to Cart button
                      InkWell(
                        onTap: () {
                          addToCartContainerOnTap(widget.name);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'Add to Cart($globlePriceTotal Rs) ',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Icon(Icons.local_offer, color: Colors.black),
                      const SizedBox(width: 8),
                      const Text(
                        '20% off on orders above \$20',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return PizzaOrderStatus(
                                  name: widget.name,
                                  image: widget.image,
                                );
                              },
                            ));
                          },
                          child: const Icon(Icons.arrow_forward,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void addToCartContainerOnTap(String name) {
    setState(() {
      userOrders.add(
          {'name': widget.name, "price": widget.price, "image": widget.image});
      globleimage = widget.image;
      globlename = widget.name;
      globleprice = widget.price;
    });
    globlePriceTotal = (globlePriceTotal! + widget.price);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('$name Added to cart')));
    print("userOrders:$userOrders");
    print("globle email:$globleemail");
  }
}
