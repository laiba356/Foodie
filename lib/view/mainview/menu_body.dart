import 'dart:async';
import 'package:flutter/material.dart';
import 'package:foodiee/menu/dessert.dart';
import 'package:foodiee/menu/dessert_card.dart';
import 'package:foodiee/menu/lists.dart';
import 'package:foodiee/menu/toptab.dart';
import 'package:foodiee/view/productdetailscreens/burger_detail_page.dart';
import 'package:foodiee/view/productdetailscreens/desserts_detail_page.dart';
import 'package:foodiee/view/productdetailscreens/drinks_detail_page.dart';
import 'package:foodiee/view/productdetailscreens/pizza_detail_page.dart';
import 'package:foodiee/view/productdetailscreens/sushi_detail_page.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> with TickerProviderStateMixin {
  late PageController _pageController;
  int pageNumber = 0;
  late String listName;
  bool isfavourite = false;
  late AnimationController _scalAnimationController;
  late Animation<Offset> _scaleanimation;

  @override
  void initState() {
    super.initState();
    listName = "Pizzas";
    _scalAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
//
    _scaleanimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _scalAnimationController,
        curve: Curves.easeInOut,
      ),
    );
    _scalAnimationController.forward();
//
    _pageController = PageController(initialPage: 0);
    Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      setState(() {
        if (pageNumber < 5) {
          pageNumber++;
        } else {
          pageNumber = 0;
        }

        _pageController.animateToPage(pageNumber,
            duration: const Duration(milliseconds: 500), curve: Curves.linear);
      });
    });
  }

  @override
  void dispose() {
    _scalAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var Size(:height, :width) = size;

    return Scaffold(
        body: Container(
      color: Colors.white,
      child: Column(
        children: [
          //1
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: width * 0.02,
                ),
                InkWell(
                    onTap: () {
                      setState(() {
                        listName = "Pizzas";
                        _scalAnimationController.forward(from: 0.0);
                      });
                    },
                    child: buildTopTab(context, "Pizzas", Icons.local_pizza)),
                SizedBox(
                  width: width * 0.05,
                ),
                InkWell(
                    onTap: () {
                      setState(() {
                        listName = "Burgers";
                        _scalAnimationController.forward(from: 0.0);
                      });
                    },
                    child: buildTopTab(context, "Burgers", Icons.restaurant)),
                SizedBox(
                  width: width * 0.05,
                ),
                InkWell(
                    onTap: () {
                      setState(() {
                        listName = "Desserts";
                        _scalAnimationController.forward(from: 0.0);
                      });
                    },
                    child: buildTopTab(
                      context, "Desserts", Icons.cake,
                      //isSelected: true
                    )),
                SizedBox(
                  width: width * 0.05,
                ),
                InkWell(
                    onTap: () {
                      setState(() {
                        listName = "Sushi";
                        _scalAnimationController.forward(from: 0.0);
                      });
                    },
                    child: buildTopTab(context, "Sushi", Icons.rice_bowl)),
                SizedBox(
                  width: width * 0.05,
                ),
                InkWell(
                    onTap: () {
                      setState(() {
                        listName = "Drinks";
                        _scalAnimationController.forward(from: 0.0);
                      });
                    },
                    child: buildTopTab(context, "Drinks", Icons.local_drink)),
                SizedBox(
                  width: width * 0.05,
                ),
              ],
            ),
          ),
          //2
          SizedBox(
            height: height * 0.2,
            width: width,
            child: PageView(
                controller: _pageController,
                // onPageChanged: (index) {
                //   setState(() {
                //     index = pageNumber;
                //   });
                // },
                children: scrollableImages),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          //3
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return Row(
                  children: [
                    Container(
                      width: pageNumber == index ? 10.0 : 7,
                      height: pageNumber == index ? 10.0 : 7,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              pageNumber == index ? Colors.black : Colors.grey),
                    ),
                    SizedBox(
                      width: width * 0.1,
                    )
                  ],
                );
              }),
            ),
          ),
          //4
          const Padding(
            padding: EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Center(
                child: Text(
                  "CATEGORIES",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          //4
          Container(
            height: height * 0.001,
            width: width * 0.94,
            color: Colors.black,
          ),
          SizedBox(
            height: height * 0.03,
          ),
          //5
          Expanded(
            child: AnimatedSwitcher(
              key: ValueKey(listName),
              duration: const Duration(milliseconds: 200),
              child: SlideTransition(
                position: _scaleanimation,
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: _getItemCount(),
                  itemBuilder: (context, index) {
                    return _getItem(index);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  _getItemCount() {
    switch (listName) {
      case "Desserts":
        return desserts.length;
      case "Burgers":
        return burgers.length;
      case "Pizzas":
        return pizzas.length;
      case "Sushi":
        return sushi.length;
      case "Drinks":
        return drinks.length;
      default:
        return 0;
    }
  }

  Widget _getItem(int index) {
    List<FoodCategory> selectedList;

    switch (listName) {
      case "Desserts":
        selectedList = desserts;
        break;
      case "Burgers":
        selectedList = burgers;
        break;
      case "Pizzas":
        selectedList = pizzas;
        break;
      case "Drinks":
        selectedList = drinks;
        break;
      case "Sushi":
        selectedList = sushi;
        break;
      default:
        selectedList = [];
    }

    final selectedItem = selectedList[index];

    return InkWell(
      onTap: () {
        if (listName == "Pizzas") {
          Navigator.of(context).push(
            PageRouteBuilder(
              transitionDuration: const Duration(
                  milliseconds: 1000), // Set Hero animation duration
              pageBuilder: (context, animation, secondaryAnimation) {
                return PizzaDetailPage(
                  name: selectedItem.name,
                  image: selectedItem.imageUrl,
                  description: selectedItem.description,
                  heroTag: selectedItem.name,
                  price: selectedItem.price,
                );
              },
            ),
          );
        } else if (listName == "Burgers") {
          Navigator.of(context).push(
            PageRouteBuilder(
              transitionDuration: const Duration(
                  milliseconds: 1000), // Duration for Burger page
              pageBuilder: (context, animation, secondaryAnimation) {
                return BurgerDetailPage(
                  name: selectedItem.name,
                  image: selectedItem.imageUrl,
                  description: selectedItem.description,
                  heroTag: selectedItem.name,
                  price: selectedItem.price,
                );
              },
            ),
          );
        } else if (listName == "Desserts") {
          Navigator.of(context).push(
            PageRouteBuilder(
              transitionDuration: const Duration(
                  milliseconds: 1000), // Duration for Burger page
              pageBuilder: (context, animation, secondaryAnimation) {
                return DessertsDetailPage(
                  name: selectedItem.name,
                  image: selectedItem.imageUrl,
                  description: selectedItem.description,
                  heroTag: selectedItem.name,
                  price: selectedItem.price,
                );
              },
            ),
          );
        } else if (listName == "Sushi") {
          Navigator.of(context).push(
            PageRouteBuilder(
              transitionDuration: const Duration(
                  milliseconds: 1000), // Duration for Burger page
              pageBuilder: (context, animation, secondaryAnimation) {
                return SushiDetailPage(
                  name: selectedItem.name,
                  image: selectedItem.imageUrl,
                  description: selectedItem.description,
                  heroTag: selectedItem.name,
                  price: selectedItem.price,
                );
              },
            ),
          );
        } else if (listName == "Drinks") {
          Navigator.of(context).push(
            PageRouteBuilder(
              transitionDuration: const Duration(
                  milliseconds: 1000), // Duration for Burger page
              pageBuilder: (context, animation, secondaryAnimation) {
                return DrinksDetailPage(
                  name: selectedItem.name,
                  image: selectedItem.imageUrl,
                  description: selectedItem.description,
                  heroTag: selectedItem.name,
                  price: selectedItem.price,
                );
              },
            ),
          );
        }
      },
      child: DessertCard(dessert: selectedItem),
    );
  }
}
